import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestaruantPageAppBar extends StatelessWidget {
  const RestaruantPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.black,
        ),
      ),
      actions: [
        Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            "assets/icons/share.svg",
            color: Colors.black,
          ),
        ),
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.black,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/Header-image.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
