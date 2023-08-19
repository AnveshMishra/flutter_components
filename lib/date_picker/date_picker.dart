import 'package:api_client/date_picker/widgets/day_header.dart';
import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    this.onSelectionChanged,
    this.slectionRadius,
    this.initialSelectedDate,
    this.showDoneButton = true,
  });

  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final double? slectionRadius;
  final DateTime? initialSelectedDate;
  final bool showDoneButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: showDoneButton
          ? ElevatedButton(
              onPressed: () {},
              child: Text(
                'Done',
                style: context.bodyLarge?.copyWith(
                  color: context.colorScheme.background,
                ),
              ).paddingFromAllSide(8.sp),
            ).paddingFromAllSide(16.sp)
          : null,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DayHeaders(),
            Expanded(
              // flex: 0,
              child: SizedBox(
                child: SfDateRangePicker(
                  initialSelectedDate: initialSelectedDate ?? DateTime.now(),
                  onSelectionChanged: onSelectionChanged,
                  selectionRadius: slectionRadius ?? 20.sp,
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: context.headlineSmall,
                  ),
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                      viewHeaderHeight: 0),
                  enableMultiView: true,
                  enablePastDates: false,
                  minDate: DateTime(DateTime.now().year, DateTime.now().month),
                  maxDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                  navigationMode: DateRangePickerNavigationMode.scroll,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
