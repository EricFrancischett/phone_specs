import 'package:flutter/material.dart';
import 'package:phone_specs/theme_data.dart';
import '../models/brands.dart';
import 'brand_card.dart';

class BrandSearchDelegate extends SearchDelegate {

  final List<BrandModel> brandList;

  BrandSearchDelegate({required this.brandList});

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
    List<BrandModel> suggestions = brandList.where((searchResult) {
      final result = searchResult.brandName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    if (suggestions.isEmpty || suggestions == []) {
      return const Text("Something went wrong");
    } else {
    return Container(
      color: AppTheme.backgroungColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return BrandCard(title: suggestion.brandName!, brandSlug: suggestion.brandSlug!, subtitle: "${suggestion.deviceCount} phones",);
          },
        ),
      ),
    );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<BrandModel> suggestions = brandList.where((searchResult) {
      final result = searchResult.brandName!.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    if (suggestions.isEmpty || suggestions == []) {
      return const Text("Something went wrong");
    } else {
    return Container(
      color: AppTheme.backgroungColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return BrandCard(title: suggestion.brandName!, brandSlug: suggestion.brandSlug!, subtitle: "${suggestion.deviceCount} phones",);
          },
        ),
      ),
    );
    }
  }
}
