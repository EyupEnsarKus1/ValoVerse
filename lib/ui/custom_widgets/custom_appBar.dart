import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_wiki_app/ui/constants/enums/padding_enum.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/padding_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showActionIcon;
  final bool showBackButton;
  final Widget? actionWidget;
  final Widget? titleWidget;
  final Widget? leading;
  final VoidCallback? onActionTap;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.titleWidget,
    this.leading,
    this.showActionIcon = false,
    this.showBackButton = false,
    this.onActionTap,
    this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PaddingEnum.high.padding,
          vertical: PaddingEnum.normal.padding,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style:
                            TextStyle(fontFamily: 'Valorant', fontSize: 24.sp),
                      ),
                    )
                  : Center(
                      child: titleWidget,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-15, 0),
                      child: showBackButton
                          ? BackButton(
                              onPressed: () => Navigator.pop(context),
                            )
                          : Container(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: InkWell(
                      onTap: onActionTap,
                      child: Padding(
                        padding: PaddingEnum.low.paddingAll(),
                        child: actionWidget,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
