import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showDraggableBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext context, ScrollController controller)
      builder,
  bool hideClose = false,
  String? title,
  double? initialChildSize,
  double? minChildSize,
  double? maxChildSize,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () =>
              context.pop(), // This will pop when we tap transparent part
          child: GestureDetector(
            onTap:
                () {}, // this is added so bottom sheet does not close when tap on non transparent part
            child: DraggableScrollableSheet(
              initialChildSize: initialChildSize ?? 0.5,
              expand: false,
              minChildSize: minChildSize ?? 0.5,
              maxChildSize: maxChildSize ?? 0.95,
              builder: (context, scrollController) {
                return SafeArea(
                  bottom: false,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          24.sp,
                        ),
                        topRight: Radius.circular(24.sp),
                      ),
                    ),
                    padding: EdgeInsets.only(
                        bottom:
                            MediaQuery.of(context).viewInsets.bottom + 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.sp,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: 4.sp,
                            width: 48.sp,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        if (!hideClose) ...[
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                        if (title != null) ...[
                          Text(
                            title,
                            style: context.headlineMedium,
                          ).paddingSymmetric(horizontal: 16.sp),
                        ],
                        Flexible(
                          flex: 1,
                          child: builder.call(context, scrollController),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
}
