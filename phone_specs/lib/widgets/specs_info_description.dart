import 'package:flutter/material.dart';
import 'package:phone_specs/theme_data.dart';

import '../models/specs.dart';

class SpecsInfoDescription extends StatelessWidget {
  const SpecsInfoDescription({Key? key, required this.selectedPhone})
      : super(key: key);

  final InfoData selectedPhone;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedPhone.phoneName!,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(selectedPhone.brand!,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.event_available_rounded),
            const SizedBox(
              width: 4,
            ),
            Text(selectedPhone.releaseDate!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppTheme.titleGrey)),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.height_rounded),
            const SizedBox(
              width: 4,
            ),
            Text(selectedPhone.dimension!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppTheme.titleGrey)),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.app_settings_alt_rounded),
            const SizedBox(
              width: 4,
            ),
            Text(selectedPhone.os!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppTheme.titleGrey)),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sd_card_rounded),
            const SizedBox(
              width: 4,
            ),
            Text(selectedPhone.storage!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppTheme.titleGrey)),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.titleGrey, width: 2),
            color: AppTheme.brandCardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                "Detailed Specifiations",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              const SizedBox(height: 24),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedPhone.specifications!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(
                      selectedPhone.specifications![index].title!,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            selectedPhone.specifications![index].specs!.length,
                        itemBuilder: (BuildContext context, int index2) {
                          if (selectedPhone.specifications![index]
                                      .specs![index2].val![0] ==
                                  "" ||
                              selectedPhone.specifications![index]
                                  .specs![index2].val![0].isEmpty) {
                            return const SizedBox();
                          } else {
                            return Column(
                              children: [
                                Container(
                                  height: 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: AppTheme.subtitleGrey.withOpacity(0.2),
                                ),
                                Text(
                                  selectedPhone.specifications![index]
                                      .specs![index2].key!,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                    selectedPhone.specifications![index]
                                        .specs![index2].val![0],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    textAlign: TextAlign.center),
                                const SizedBox(
                                  height: 16,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
