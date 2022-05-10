import 'package:flutter/material.dart';
import 'package:phone_specs/theme_data.dart';

// ignore: must_be_immutable
class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  SearchAppBar(
      {Key? key, required this.title, this.searchDelegate})
      : super(key: key);

  final String title;
   SearchDelegate? searchDelegate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.titleGrey,
      actions: [
        IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: searchDelegate!,
              );
            },
            icon: const Icon(Icons.search))
      ],
      centerTitle: true,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppTheme.brandCardColor),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
