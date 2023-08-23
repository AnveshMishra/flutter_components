import 'package:api_client/app_drop_down.dart';
import 'package:api_client/app_text_field.dart';
import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SecondarySaleSheet extends StatefulWidget {
  final ScrollController? controller;
  const SecondarySaleSheet({super.key, this.controller});

  @override
  State<SecondarySaleSheet> createState() => _SecondarySaleSheetState();
}

class _SecondarySaleSheetState extends State<SecondarySaleSheet> {
  late List<SecondarySaleFieldsModel> fields;

  @override
  void initState() {
    super.initState();
    fields = [
      SecondarySaleFieldsModel(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: fields.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Remaining quantity (14MT)',
                  style: context.headlineSmall,
                ),
                const Spacer(),
                if (fields.length > 1) ...[
                  IconButton(
                      onPressed: () {
                        fields.removeAt(index);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: context.colorScheme.error,
                      ))
                ]
              ],
            ).paddingOnOnlySides(left: 16.sp, right: 16.sp, top: 16.sp),
            AppDropDown(
              controller: fields[index].shipToPartyController,
              onPressed: () {},
              label: 'Ship to Party',
              initValue: 'Enter ship to party no. or name or city',
            ).paddingFromAllSide(
              16.sp,
            ),
            AppTextField(
              controller: fields[index].assignCityController,
              label: 'Assign City',
              hint: 'Assign city',
            ).paddingOnOnlySides(
              left: 16.sp,
              right: 16.sp,
              bottom: 16.sp,
            ),
            if (index == fields.length - 1) ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.onBackground,
                ),
                onPressed: () {
                  fields.add(SecondarySaleFieldsModel());
                  setState(() {});
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    widget.controller?.animateTo(
                        (widget.controller?.position.maxScrollExtent ??
                            0 + 100),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  });
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   if (dataKey[formLength - 1].currentContext != null) {
                  //     Scrollable.ensureVisible(
                  //       dataKey[formLength - 1].currentContext ?? context,
                  //       duration: const Duration(milliseconds: 400),
                  //       curve: Curves.easeInOut,
                  //     );
                  //   }
                  // });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Text(
                      'Add More',
                      style: context.headlineMedium?.copyWith(
                        color: context.colorScheme.background,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}

class SecondarySaleFieldsModel {
  final TextEditingController shipToPartyController = TextEditingController();
  final TextEditingController assignCityController = TextEditingController();
}
