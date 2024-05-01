import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_image_view.dart';
import '../blocs/modify_review/modify_review_bloc.dart';
import '../blocs/photo/photo_bloc.dart';
import 'image_review_widget.dart';

class MediaWidget extends StatefulWidget {
  const MediaWidget({
    super.key,
  });

  @override
  State<MediaWidget> createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  final _picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> _openImageModifyPicker() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final imagePath = pickedImage.path;
      final file = File(imagePath);
      // ignore: use_build_context_synchronously
      CustomDialog(context: context).showLoadingDialog();
      try {
        final snapshot =
            await storage.ref().child('images$imagePath').putFile(file);
        final downloadUrl = await snapshot.ref.getDownloadURL();
        // ignore: use_build_context_synchronously
        context
            .read<ModifyReviewBloc>()
            .add(UpdatePhotoReviewEvent(photo: downloadUrl));
      } catch (e) {
        Logger().e(e.toString());
      }
    }
  }

  Future<void> _openImagePicker() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final imagePath = pickedImage.path;
      final file = File(imagePath);
      // ignore: use_build_context_synchronously
      CustomDialog(context: context).showLoadingDialog();
      try {
        final snapshot =
            await storage.ref().child('images$imagePath').putFile(file);
        final downloadUrl = await snapshot.ref.getDownloadURL();
        // ignore: use_build_context_synchronously
        context.read<PhotoBloc>().add(AddPhotoEvent(photo: downloadUrl));
      } catch (e) {
        Logger().e(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final modifyState = context.watch<ModifyReviewBloc>().state;
    final checkMode = modifyState.modify;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageReviewWidget(
              icon: Icons.camera,
              title: 'Camera',
              onPressed: checkMode ? _openImageModifyPicker : _openImagePicker,
            ),
            ImageReviewWidget(
              icon: Icons.perm_media,
              title: 'Colection',
              onPressed: checkMode ? _openImageModifyPicker : _openImagePicker,
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        if (checkMode)
          const ShowImageModeModifyWidget()
        else
          const ShowImageAddWidget(),
      ],
    );
  }
}

class ShowImageAddWidget extends StatelessWidget {
  const ShowImageAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        if (state.photo.isNotEmpty) {
          final listPhotos = state.photo;
          return Wrap(
              spacing: 30.w,
              runSpacing: 10.h,
              children: List.generate(listPhotos.length, (index) {
                return Stack(
                  children: [
                    CustomImageView(
                      fit: BoxFit.fitWidth,
                      height: 100.h,
                      width: MediaQuery.of(context).size.width / 3,
                      imagePath: listPhotos[index],
                      radius: BorderRadius.circular(12.r),
                    ),
                    Positioned(
                        right: -10,
                        top: -10,
                        child: InkWell(
                          onTap: () {
                            context.read<PhotoBloc>().add(
                                DeletePhotoEvent(photo: listPhotos[index]));
                          },
                          child: CircleAvatar(
                            backgroundColor: ColorConstant.whiteColor,
                            radius: 15.r,
                            child: Icon(
                              Icons.close,
                              color: ColorConstant.red600Color.withOpacity(0.9),
                            ),
                          ),
                        ))
                  ],
                );
              }));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class ShowImageModeModifyWidget extends StatelessWidget {
  const ShowImageModeModifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyReviewBloc, ModifyReviewState>(
      builder: (context, state) {
        if (state.modify) {
          final rating = state.rating;
          final photosLength = state.modifyReviewStatus.isLoaded
              ? state.photos.length
              : rating.photos?.length;
          return Wrap(
              spacing: 30.w,
              runSpacing: 10.h,
              children: List.generate(photosLength ?? 1, (index) {
                final photo = state.modifyReviewStatus.isLoaded
                    ? state.photos[index]
                    : state.rating.photos?[index] as String? ?? '';
                return Stack(
                  children: [
                    CustomImageView(
                      fit: BoxFit.fitWidth,
                      height: 100.h,
                      width: MediaQuery.of(context).size.width / 3,
                      imagePath: photo,
                      radius: BorderRadius.circular(12.r),
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: InkWell(
                        onTap: () {
                          context
                              .read<ModifyReviewBloc>()
                              .add(DeletePhotoReviewEvent(photo: photo));
                        },
                        child: CircleAvatar(
                          backgroundColor: ColorConstant.whiteColor,
                          radius: 15.r,
                          child: Icon(
                            Icons.close,
                            color: ColorConstant.red600Color.withOpacity(0.9),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
