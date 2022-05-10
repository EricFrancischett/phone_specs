import 'package:flutter/material.dart';
import 'package:phone_specs/theme_data.dart';
import '../models/phones.dart';
import 'phone_card.dart';

class PhoneSearchDelegate extends SearchDelegate {
  
  final List<PhoneModel> phoneList;

  PhoneSearchDelegate({required this.phoneList});
  
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) {
    List<PhoneModel> suggestions = phoneList.where((searchResult) {
      final result = searchResult.phoneName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Container(
      color: AppTheme.backgroungColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return PhoneCard(title: suggestion.phoneName!, imageUrl: suggestion.image!, phoneSlug: suggestion.slug!,);
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PhoneModel> suggestions = phoneList.where((searchResult) {
      final result = searchResult.phoneName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Container(
      color: AppTheme.backgroungColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return PhoneCard(title: suggestion.phoneName!, imageUrl: suggestion.image!, phoneSlug: suggestion.slug!,);
          },
        ),
      ),
    );
  }
}
