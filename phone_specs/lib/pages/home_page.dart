import 'package:flutter/material.dart';
import 'package:phone_specs/widgets/brand_search_delegate.dart';
import 'package:phone_specs/theme_data.dart';
import 'package:phone_specs/widgets/search_app_bar.dart';
import 'package:phone_specs/widgets/brand_card.dart';
import '../getdata/fetch_brands.dart';
import '../models/brands.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<BrandModel> brandListFromApi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroungColor,
      appBar: SearchAppBar(
        title: "Brands",
        searchDelegate: BrandSearchDelegate(brandList: brandListFromApi),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<BrandModel>>(
            future: fetchBrands(),
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                for (var i = 0; i < snapshot.data!.length; i++) {
                  if (brandListFromApi.contains(snapshot.data![i])) {
                  }
                  else {
                    brandListFromApi.add(snapshot.data![i]);
                  }
                }
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BrandCard(
                          title: snapshot.data![index].brandName!,
                          brandSlug: snapshot.data![index].brandSlug!, subtitle: "${snapshot.data![index].deviceCount} phones",);
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text("Something went wrong");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
