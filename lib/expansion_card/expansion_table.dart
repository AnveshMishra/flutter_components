import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ExpansionContainerTable extends StatefulWidget {
  final List<ExpansionTableElements> nonHiddenElement;
  final List<ExpansionTableElements> hiddenElement;
  final List<Widget> actions;

  const ExpansionContainerTable({
    super.key,
    required this.nonHiddenElement,
    required this.hiddenElement,
    this.actions = const [],
  });

  @override
  State<ExpansionContainerTable> createState() =>
      _ExpansionContainerTableState();
}

class _ExpansionContainerTableState extends State<ExpansionContainerTable>
    with AutomaticKeepAliveClientMixin {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: () {
        setState(() {
          isCollapsed = !isCollapsed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xE8E8E8E8),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ColoredBox(
              color: Colors.grey.shade200,
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    Text(
                      '#R20042811',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ...widget.actions,
                    Icon(
                      isCollapsed ? Icons.add : Icons.minimize_rounded,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
            ),
            if (!isCollapsed)
              for (var element in widget.hiddenElement) ...[
                _CardData(
                  header: element.firstElementHeader,
                  value: element.firstElementSubtitle,
                ),
              ]
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ExpansionTableElements {
  final String firstElementHeader;
  final String firstElementSubtitle;

  ExpansionTableElements({
    required this.firstElementHeader,
    required this.firstElementSubtitle,
  });
}

class _CardData extends StatelessWidget {
  final String header;
  final String value;
  const _CardData({required this.header, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                header,
                style: context.headlineMedium,
              ),
            ),
            SizedBox(
              width: 8.sp,
            ),
            Expanded(
              flex: 3,
              child: Text(
                value.isEmpty ? '-' : value,
                style: context.bodyMedium,
              ),
            ),
          ],
        ).paddingOnOnlySides(
          left: 16.sp,
          right: 16.sp,
          top: 20.sp,
        ),
        Divider(
          endIndent: 16.sp,
          indent: 16.sp,
        ),
      ],
    );
  }
}
