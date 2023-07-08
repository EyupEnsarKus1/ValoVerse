import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool centerTitle;
  final Widget? actionWidget;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final VoidCallback? backButtonPressed;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.titleWidget,
    this.leadingWidget,
    this.showBackButton = false,
    this.centerTitle = true,
    this.actionWidget,
    this.backButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      elevation: 10,
      title: titleWidget ??
          Text(title,
              style: TextStyle(
                fontFamily: AppFonts.valorant,
                fontWeight: AppWeights.normal,
                fontSize: AppSizes.headlineMedium,
              )),
      leading: (leadingWidget == null && showBackButton == false)
          ? null
          : leadingWidget ??
              BackButton(
                onPressed: backButtonPressed,
              ),
      actions: actionWidget != null ? [actionWidget!] : [],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
