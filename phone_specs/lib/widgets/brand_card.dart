import 'package:flutter/material.dart';
import 'package:phone_specs/theme_data.dart';
import '../pages/selected_brand_page.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({Key? key, required this.title, required this.brandSlug, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;
  final String brandSlug;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.titleGrey,
              width: 2),
            color: AppTheme.brandCardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedBrandPage(brandSlug: brandSlug, pageTitle: title,),
                ),
              );
            },
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text(
              subtitle,
              style: Theme.of(context).textTheme.titleSmall,),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.titleGrey,),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
