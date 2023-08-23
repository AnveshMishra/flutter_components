import 'package:api_client/app_text_field.dart';
import 'package:api_client/date_picker/date_picker.dart';
import 'package:api_client/draggable_bottom_sheet.dart';
import 'package:api_client/hexcolor/hexcolor.dart';
import 'package:api_client/orders/widgets/secondry_sale_form.dart';
import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/table/table_widgets.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:api_client/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.read<ThemeProvider>().changeTheme(AppTheme.acc),
              child: const Text('acc'),
            ),
            ElevatedButton(
              onPressed: () =>
                  context.read<ThemeProvider>().changeTheme(AppTheme.ambuja),
              child: const Text('ambuja'),
            ),
            ElevatedButton(
              onPressed: () =>
                  context.read<ThemeProvider>().changeTheme(AppTheme.adani),
              child: const Text('adani'),
            ),
            AppTextField(
              label: 'Hello, world',
              controller: _controller,
            ).paddingFromAllSide(8.sp),
            ElevatedButton(
              onPressed: () => context.read<ThemeProvider>().toggleBrightness(),
              child: const Text('toggleBrightness'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/chart'),
              child: const Text('go to charts'),
            ),
            Container(
              margin: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: context.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(8.sp)),
              child: RecentOrderTableWidget(
                elements: [
                  RecentOrderTableElements(
                    onTap: () {
                      showDraggableBottomSheet(
                        initialChildSize: 0.75,
                        minChildSize: 0.75,
                        title: 'Add Secondary Sales',
                        context: context,
                        builder: (_, con) => SecondarySaleSheet(
                          controller: con,
                        ),
                      );
                    },
                    poNo: 'SP3587N',
                    productName: 'PPC Yellow...+3 More',
                  ),
                  RecentOrderTableElements(
                    onTap: () {
                      context.pushNamed('/order');
                    },
                    poNo: 'SP3587N',
                    productName: 'PPC Yellow...+3 More',
                  ),
                  RecentOrderTableElements(
                    onTap: () {},
                    poNo: 'SP3587N',
                    productName: 'PPC Yellow...+3 More',
                  ),
                ],
              ),
            ),
            Container(
              color: HexColor('#E2E2E2'),
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
