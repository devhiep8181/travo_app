// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../../../core/app_export.dart';
import '../../../../../domain/entities/place_entity.dart';
import '../../../../../widgets/export_widgets.dart';
import '../../../bloc/favourite_home/favourite_home_bloc.dart';
import 'text_in_image_widget.dart';

class BuilderGridViewWidget extends StatelessWidget {
  const BuilderGridViewWidget({
    required this.listData,
    required this.index,
    super.key,
  });

  final List<PlaceEntity> listData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: ColoredBox(
          color: Colors.amber,
          //height: customHeightElement(index),
          child: Stack(fit: StackFit.expand, children: [
            CustomImageView(
              fit: BoxFit.fill,
              imagePath: listData[index].image,
            ),
            FavouriteWidget(
              favouritePlace: listData[index],
            ),
            TextInImageWidget(index: index, listData: listData),
          ]),
        ),
      ),
    );
  }
}

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    required this.favouritePlace,
    super.key,
  });
  final PlaceEntity favouritePlace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteHomeBloc, FavouriteHomeState>(
      builder: (context, state) {
        var checkFavourtie =
            (state.valueCheckFavourite[favouritePlace.name] ?? false) as bool;
        return Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {
                checkFavourtie = !checkFavourtie;
                context.read<FavouriteHomeBloc>().add(AddFavouriteHomeEvent(
                    valueCheckFavourite: checkFavourtie,
                    favouritePlace: favouritePlace));
              },
              icon: Icon(
                Icons.favorite_sharp,
                color: checkFavourtie
                    ? ColorConstant.redColor
                    : ColorConstant.whiteColor,
              )),
        );
      },
    );
  }
}

//TODO: để vào 1 file riêng
double customHeightElement(int index) {
  if (index.isEven) {
    return 200.h;
  } else if (index % 3 == 0) {
    return 250.h;
  }
  return 150.h;
}
