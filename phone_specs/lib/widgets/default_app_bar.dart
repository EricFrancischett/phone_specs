import 'package:flutter/material.dart';

import '../theme_data.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.titleGrey,
      centerTitle: true,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppTheme.brandCardColor),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}