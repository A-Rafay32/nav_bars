import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nav_bars/constants.dart';

class BottomNavBar1 extends StatefulWidget {
  const BottomNavBar1({super.key, required this.w});

  final double w;

  @override
  State<BottomNavBar1> createState() => _BottomNavBar1State();
}

class _BottomNavBar1State extends State<BottomNavBar1> {
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
        height: 60,
        width: widget.w,
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.grey.shade100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              navBarLabels.length,
              (index) => BottomNavBarItem1(
                    iconAsset: navBarSvgs[index],
                    isTagSelected: currentIndex == index ? true : false,
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    text: navBarLabels[index],
                  )),
        ));
  }
}

class BottomNavBarItem1 extends StatelessWidget {
  const BottomNavBarItem1(
      {super.key,
      required this.text,
      this.iconAsset,
      required this.onTap,
      required this.isTagSelected});

  final String text;
  final bool isTagSelected;
  final String? iconAsset;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            iconAsset == null
                ? Container()
                : SvgPicture.asset(
                    iconAsset!,
                    height: 17,
                    width: 17,
                    colorFilter: ColorFilter.mode(
                        isTagSelected
                            ? AppColors.orangePrimaryColor
                            : Colors.grey.shade600,
                        BlendMode.srcIn),
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isTagSelected
                        ? AppColors.orangePrimaryColor
                        : Colors.grey.shade600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
