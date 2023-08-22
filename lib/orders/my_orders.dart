import 'package:api_client/draggable_bottom_sheet.dart';
import 'package:api_client/orders/widgets/order_details.dart';
import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../expansion_card/expansion_table.dart';
import '../hexcolor/hexcolor.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final _deliveryNumberController = TextEditingController();
  final _poNumberController = TextEditingController();
  final _soNumberController = TextEditingController();
  final _orderDateController = TextEditingController();
  final _deliveryDateController = TextEditingController();
  final _deliveryQtyController = TextEditingController();
  final _orderQtyController = TextEditingController();
  final _shipToController = TextEditingController();
  final _soldTo = TextEditingController();
  final _partyName = TextEditingController();
  final _transporterController = TextEditingController();
  final _invoiceController = TextEditingController();
  final _cityController = TextEditingController();
  final _uomController = TextEditingController();
  final _plantController = TextEditingController();
  final _truckController = TextEditingController();
  final _descController = TextEditingController();
  final _remarkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            // height: 0.2.screenHeightMultiple,
            color: HexColor('#FFE2E2E2'),
            child: Column(
              children: [
                SizedBox(
                  height: 52.sp,
                ),
                Row(
                  children: [
                    Text(
                      'My orders',
                      style: context.headlineLarge,
                    ),
                    const Spacer(),
                    const Icon(Icons.filter_alt_outlined),
                    const Icon(Icons.file_copy_rounded),
                  ],
                ).paddingOnOnlySides(
                  left: 20.sp,
                  right: 20.sp,
                ),
                SizedBox(
                  height: 24.sp,
                ),
                TabBar(
                  labelColor: Colors.black,
                  labelStyle: context.bodyMedium?.copyWith(color: Colors.black),
                  controller: tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Pending Order',
                    ),
                    Tab(
                      text: 'Dispatched Order',
                    ),
                    Tab(
                      text: 'Track Order',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              ...List.generate(
                4,
                (index) => ListView(
                  children: [
                    SizedBox(
                      height: 24.sp,
                    ),
                    ExpansionContainerTable(
                      actions: [
                        const Icon(
                          Icons.check_circle_outline,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () => showDraggableBottomSheet(
                            context: context,
                            title: 'Order Details',
                            builder: (_, controller) => MyOrderForms(
                              scrollController: controller,
                              formFields: [
                                FormFields(
                                  label: 'Delivery Number',
                                  controller: _deliveryNumberController,
                                  initValue: '1234532',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Delivery Date',
                                  controller: _deliveryDateController,
                                  initValue: '12/07/22',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Delivery Quantity',
                                  controller: _deliveryQtyController,
                                  initValue: '23',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'PO Number',
                                  controller: _poNumberController,
                                  initValue: '23123421',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'So Number',
                                  controller: _soNumberController,
                                  initValue: '23123421',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Order Date',
                                  controller: _orderDateController,
                                  initValue: '23/12/2023',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Order Qty',
                                  controller: _orderQtyController,
                                  initValue: '23',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Ship To',
                                  controller: _shipToController,
                                  initValue: 'Anvesh',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Sold To',
                                  controller: _soldTo,
                                  initValue: 'Anvesh',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Party Name',
                                  controller: _partyName,
                                  initValue: 'Anvesh',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Transporter ',
                                  controller: _transporterController,
                                  initValue: 'HP449',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Invoice ',
                                  controller: _invoiceController,
                                  initValue: 'HP442234439',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'City ',
                                  controller: _cityController,
                                  initValue: 'Jaipur',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'UOM ',
                                  controller: _uomController,
                                  initValue: '77',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Plant ',
                                  controller: _plantController,
                                  initValue: 'RJE',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Truck No. ',
                                  controller: _truckController,
                                  initValue: 'UP16AX9090',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Description',
                                  controller: _descController,
                                  initValue: 'NA',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                                FormFields(
                                  label: 'Remark',
                                  controller: _remarkController,
                                  initValue: 'NA',
                                  readOnly: true,
                                  bgColor: context.borderColor,
                                ),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.visibility_outlined,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.mode_edit_rounded,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.delete,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                      hiddenElement: [
                        ExpansionTableElements(
                          firstElementHeader: 'PO Number Code',
                          firstElementSubtitle: '12351341',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Date',
                          firstElementSubtitle: '11/04/2017',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Ship',
                          firstElementSubtitle: 'Mumbai',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Ship To Party Name',
                          firstElementSubtitle: 'A',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Material',
                          firstElementSubtitle: 'Cement',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Description',
                          firstElementSubtitle: 'Bulk order',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Posting Error Msg',
                          firstElementSubtitle: '',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Quantity',
                          firstElementSubtitle: '24 tons',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Remark',
                          firstElementSubtitle: 'Remark',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Rejected',
                          firstElementSubtitle: '',
                        ),
                        ExpansionTableElements(
                          firstElementHeader: 'Create Date',
                          firstElementSubtitle: '',
                        ),
                      ],
                      nonHiddenElement: const [],
                    ).paddingOnOnlySides(
                      left: 20.sp,
                      right: 20.sp,
                      bottom: 10.sp,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
