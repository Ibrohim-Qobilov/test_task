import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/utils/test_style.dart';
import 'icons.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Notifications',
        style: AppTextStyles.appBarText,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: SvgPicture.asset(AppIcon.icon),
      ),
      actions: [
        Center(
          child: Text(
            'Mark all reads',
            style: AppTextStyles.appBarActionText,
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
