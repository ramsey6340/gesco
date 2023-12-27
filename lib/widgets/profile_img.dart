import 'package:flutter/material.dart';

import '../size_config.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({
    Key? key,
    required this.profileImg,
    this.pressShowImg,
    this.pressModifImg,
    this.showIconAction = false,
    this.iconMinimal = Icons.camera_alt,
    this.iconMinimalColor = Colors.black,
    this.iconMinimalSize = 30.0,
    this.backgroundIconMinimal = const Color(0xFFF5F6F9),
    this.radiusSize = 70.0,
    this.isNetworkImg = true,
    this.image,
  }) : super(key: key);

  final String profileImg;
  final Function()? pressShowImg;
  final Function()? pressModifImg;
  final bool showIconAction;
  final IconData iconMinimal;
  final Color iconMinimalColor;
  final Color backgroundIconMinimal;
  final double radiusSize;
  final bool isNetworkImg;
  final double iconMinimalSize;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SizedBox(
      width: getProportionateScreenWidth(mediaQueryData, radiusSize*2),
      height: getProportionateScreenWidth(mediaQueryData, radiusSize*2),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          (isNetworkImg)
              ? InkWell(
                  onTap: pressShowImg,
                  child: Center(
                    child: CircleAvatar(
                      radius: getProportionateScreenWidth(mediaQueryData, radiusSize),
                      backgroundImage: image?.image ?? NetworkImage(profileImg),
                    ),
                  ),
                )
              : InkWell(
                  onTap: pressShowImg,
                  child: Center(
                    child: CircleAvatar(
                      radius: radiusSize,
                      backgroundImage: image?.image ?? AssetImage(profileImg),
                    ),
                  ),
                ),
          SizedBox(
            width: getProportionateScreenWidth(mediaQueryData, iconMinimalSize+10),
            height: getProportionateScreenWidth(mediaQueryData, iconMinimalSize+10),
            child: InkWell(
              onTap: pressModifImg,
              child: (showIconAction)
                  ? Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(mediaQueryData, 5)),
                      decoration: BoxDecoration(
                        color: backgroundIconMinimal,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          iconMinimal,
                          color: iconMinimalColor,
                          size: getProportionateScreenWidth(mediaQueryData, iconMinimalSize),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
