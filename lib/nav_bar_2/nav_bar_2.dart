import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nav_bars/constants.dart';

class BottomNavBar2 extends StatefulWidget {
  const BottomNavBar2({super.key, required this.w});

  final double w;

  @override
  State<BottomNavBar2> createState() => _BottomNavBar2State();
}

class _BottomNavBar2State extends State<BottomNavBar2> {
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
              (index) => BottomNavBarItem(
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

class BottomNavBarItem extends StatefulWidget {
  const BottomNavBarItem(
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
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        width: widget.isTagSelected ? 90 : 30,
        curve: Curves.ease,
        duration: Durations.short3,
        child: Stack(
          children: [
            if (widget.isTagSelected)
              AnimatedContainer(
                width: 90,
                height: 40,
                curve: Curves.easeIn,
                duration: const Duration(seconds: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.orangePrimaryColor.withOpacity(0.15),
                ),
              ),
            Positioned(
              left: 10,
              top: 10,
              child: SizedBox(
                width: 80,
                child: Row(
                  children: [
                    widget.iconAsset == null
                        ? Container()
                        : SvgPicture.asset(
                            widget.iconAsset!,
                            height: 17,
                            width: 17,
                            colorFilter: ColorFilter.mode(
                                widget.isTagSelected
                                    ? AppColors.orangePrimaryColor
                                    : Colors.grey.shade600,
                                BlendMode.srcIn),
                          ),
                    if (widget.isTagSelected)
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            widget.text,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: widget.isTagSelected
                                      ? AppColors.orangePrimaryColor
                                      : Colors.grey.shade600,
                                ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
