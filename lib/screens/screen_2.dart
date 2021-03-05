import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../providers/base_items_provider.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    var hProvider = context.watch<HorizontalItemsProvider>();
    var vProvider = context.watch<VerticalItemsProvider>();

    return Container(
      color: ProjectColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _closeButtonWidget(context),
          _labelWidget("Section 1 (${hProvider.itemsCount})"),
          _hCarousel(hProvider),
          const SizedBox(height: 16.0),
          _labelWidget("Section 2 (${vProvider.itemsCount})"),
          _vCarousel(vProvider),
        ],
      ),
    );
  }

  Container _closeButtonWidget(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(
        top: 44.0,
        right: 12.0,
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Image.asset(
          'assets/icons/close.png',
          width: 24.0,
          height: 24.0,
        ),
      ),
    );
  }

  Container _labelWidget(String label) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Text(
        "$label",
        textDirection: TextDirection.ltr,
        style: labelTextStyle(),
      ),
    );
  }

  Container _hCarousel(HorizontalItemsProvider hProvider) {
    return Container(
      height: 154.0,
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: hProvider.itemsCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              width: 350.0,
              height: 148.0,
              margin: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                color: ProjectColor.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: ProjectColor.black.withOpacity(0.25),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: _textItemWidget(hProvider, index),
            ),
          );
        },
      ),
    );
  }

  Expanded _vCarousel(VerticalItemsProvider vProvider) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: vProvider.itemsCount,
        itemBuilder: (context, index) {
          return Container(
            width: 382.0,
            height: 150.0,
            margin: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            decoration: BoxDecoration(
              color: ProjectColor.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ProjectColor.black.withOpacity(0.25),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: _textItemWidget(vProvider, index),
          );
        },
      ),
    );
  }

  Center _textItemWidget(BaseItemsProvider anyProvider, int index) {
    return Center(
      child: Text(
        "${anyProvider.generateItemAt(index)}",
        style: labelTextStyle(),
      ),
    );
  }

  TextStyle labelTextStyle() {
    return const TextStyle(
      color: ProjectColor.black,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontSize: 24.0,
      letterSpacing: -0.17,
    );
  }
}
