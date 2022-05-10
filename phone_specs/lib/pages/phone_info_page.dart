import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phone_specs/models/specs.dart';
import 'package:phone_specs/theme_data.dart';
import 'package:phone_specs/widgets/default_app_bar.dart';
import '../getdata/fetch_specs.dart';
import '../widgets/specs_info_description.dart';

class PhoneInfoPage extends StatefulWidget {
  const PhoneInfoPage({Key? key, required this.phoneSlug}) : super(key: key);

  final String phoneSlug;

  @override
  State<PhoneInfoPage> createState() => _PhoneInfoPageState();
}

int activeIndex = 0;

class _PhoneInfoPageState extends State<PhoneInfoPage> {

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        color: Colors.transparent,
        child: Image.network(
          urlImage,
          fit: BoxFit.contain,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brandCardColor,
      appBar: DefaultAppBar(
        title: "Specifications",),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<InfoData>(
            future: fetchSpecs(widget.phoneSlug),
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CarouselSlider.builder(
                      itemCount: snapshot.data!.phoneImages!.isEmpty? 1 : snapshot.data!.phoneImages!.length,
                      options: CarouselOptions(
                          height: 300,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                              activeIndex = index;
                          }),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final urlImage = snapshot.data!.phoneImages!.isEmpty? "https://cdn.picpng.com/smartphone/smartphone-icon-modern-symbol-54025.png" : snapshot.data!.phoneImages![index];
                        return buildImage(urlImage, index);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SpecsInfoDescription(selectedPhone: snapshot.data!,),
                    )
                  ],
                );
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
