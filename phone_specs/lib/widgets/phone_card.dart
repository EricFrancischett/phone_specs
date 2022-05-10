import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../pages/phone_info_page.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard(
      {Key? key,
      required this.title,
      required this.phoneSlug,
      required this.imageUrl})
      : super(key: key);

  final String title;
  final String phoneSlug;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.titleGrey, width: 2),
            color: AppTheme.brandCardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: ListTile(
              leading: Image.network(imageUrl),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhoneInfoPage(phoneSlug: phoneSlug)));
              },
              title: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppTheme.titleGrey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
