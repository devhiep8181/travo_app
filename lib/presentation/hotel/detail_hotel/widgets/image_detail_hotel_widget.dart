import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../onboarding/onboarding_screen.dart';

class ImageDetailHotelWidget extends StatefulWidget {
  const ImageDetailHotelWidget({
    required this.image,
    super.key,
  });
  final String image;

  @override
  State<ImageDetailHotelWidget> createState() => _ImageDetailHotelWidgetState();
}

class _ImageDetailHotelWidgetState extends State<ImageDetailHotelWidget> {
  int currentIndex = 0;
  PageController? _controller;
  List<String> listImage = [];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    listImage =
        List<String>.filled(3, widget.image); //tạo danh sách có 3 bức ảnh
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            itemCount: listImage.length,
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return SizedBox.expand(
                child: CustomImageView(
                  fit: BoxFit.fitHeight,
                  imagePath: listImage[index],
                ),
              );
            }),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 20,
          bottom: MediaQuery.of(context).size.height / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtonWidget(),
                  ButtonWidget(
                    icon: Icons.favorite,
                    color: ColorConstant.salmonPinkColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    listImage.length,
                    (index) => BuildDotWidget(
                          currentIndex: currentIndex,
                          index: index,
                          color: ColorConstant.whiteColor,
                        )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
