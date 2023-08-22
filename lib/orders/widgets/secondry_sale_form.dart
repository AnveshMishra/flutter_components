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
  int formLength = 1;
  List<GlobalKey> dataKey = [
    GlobalKey(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: formLength,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          key: dataKey[index],
          children: [
            Row(
              children: [
                Text(
                  'Remaining quantity (14MT)',
                  style: context.headlineSmall,
                ),
                const Spacer(),
                if (index != 0) ...[
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle,
                        color: context.colorScheme.error,
                      ))
                ]
              ],
            ).paddingOnOnlySides(left: 16.sp, right: 16.sp, top: 16.sp),
            AppDropDown(
              controller: TextEditingController(),
              onPressed: () {},
              label: 'Ship to Party',
              initValue: 'Enter ship to party no. or name or city',
            ).paddingFromAllSide(
              16.sp,
            ),
            AppTextField(
              controller: TextEditingController(),
              label: 'Assing City',
              hint: 'Assign city',
            ).paddingOnOnlySides(
              left: 16.sp,
              right: 16.sp,
              bottom: 16.sp,
            ),
            if (index == formLength - 1) ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.onBackground,
                ),
                onPressed: () {
                  formLength += 1;
                  dataKey.add(
                    GlobalKey(),
                  );
                  setState(() {});
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    widget.controller?.animateTo(
                        widget.controller?.position.maxScrollExtent ?? 0,
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
                      style:
                          context.headlineMedium?.copyWith(color: Colors.white),
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
