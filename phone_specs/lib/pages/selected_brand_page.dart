import 'package:flutter/material.dart';
import 'package:phone_specs/widgets/phone_search_delegate.dart';
import 'package:phone_specs/theme_data.dart';
import 'package:phone_specs/widgets/phone_card.dart';
import '../getdata/fetch_phones.dart';
import '../models/phones.dart';
import '../widgets/search_app_bar.dart';

class SelectedBrandPage extends StatefulWidget {
  const SelectedBrandPage({Key? key, required this.brandSlug, required this.pageTitle})
      : super(key: key);

  final String brandSlug;
  final String pageTitle;

  @override
  State<SelectedBrandPage> createState() => _SelectedBrandPageState();
}

class _SelectedBrandPageState extends State<SelectedBrandPage> {
  List<PhoneModel> phoneListFromApi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroungColor,
      appBar: SearchAppBar(
        title: widget.pageTitle,
        searchDelegate: PhoneSearchDelegate(phoneList: phoneListFromApi),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FutureBuilder<List<PhoneModel>>(
            future: fetchPhones(widget.brandSlug),
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                  for (var element in snapshot.data!) {
                    phoneListFromApi.add(element);
                  }
                });

                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PhoneCard(
                          title: snapshot.data![index].phoneName!,
                          phoneSlug: snapshot.data![index].slug!,
                          imageUrl: snapshot.data![index].image!);
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
