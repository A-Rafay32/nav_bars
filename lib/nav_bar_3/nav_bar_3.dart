import 'package:flutter/material.dart';
import 'package:nav_bars/constants.dart';
import 'package:nav_bars/nav_bar_1/nav_bar_1.dart';

class BottomNavBar3 extends StatefulWidget {
  const BottomNavBar3({
    super.key,
    required this.w,
  });

  final double w;

  @override
  State<BottomNavBar3> createState() => _BottomNavBar3State();
}

class _BottomNavBar3State extends State<BottomNavBar3> {
  final navBarLabels = ["Home", "Chat", "Cart", "Profile"];

  final navBarSvgs = [
    AppSvgs.home,
    AppSvgs.chat,
    AppSvgs.cart,
    AppSvgs.profile
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: 65,
      width: widget.w * 0.8,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 35,
              color: AppColors.orangePrimaryColor.withOpacity(0.3))
        ],
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          navBarLabels.length,
          (index) => BottomNavBarItem1(
            text: navBarLabels[index],
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            isTagSelected: currentIndex == index ? true : false,
            iconAsset: navBarSvgs[index],
          ),
        ),
      ),
    );
  }
}
