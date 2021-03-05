import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

import '../constant/colors.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    var _subTitle = lipsum.createText(numParagraphs: 1, numSentences: 1);
    var _p1 = lipsum.createText(numParagraphs: 1, numSentences: 7);
    var _p2 = lipsum.createText(numParagraphs: 1, numSentences: 9);
    var _p3 = lipsum.createText(numParagraphs: 1, numSentences: 8);

    return Container(
      color: ProjectColor.grey,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColor.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _titleAndCloseWidgets(context),
            _subTitleWidget(_subTitle),
            _bodyWidget(_scrollController, _p1, _p2, _p3),
            _footerWidget(context),
          ],
        ),
      ),
    );
  }

  Padding _titleAndCloseWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              "Title",
              style: TextStyle(
                color: ProjectColor.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                fontFamily: "Roboto",
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              'assets/icons/close.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }

  Container _subTitleWidget(String _subTitle) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Text(
        "$_subTitle",
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.visible,
        style: const TextStyle(
          color: ProjectColor.black,
          fontFamily: "Roboto",
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Container _bodyWidget(
      ScrollController _scrollController, String _p1, String _p2, String _p3) {
    return Container(
      height: 400.0,
      color: ProjectColor.lightGrey,
      child: Scrollbar(
        thickness: 2.0,
        radius: Radius.zero,
        isAlwaysShown: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "$_p1 \n\n $_p2 \n\n $_p3",
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                color: ProjectColor.black,
                fontFamily: "Roboto",
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _footerWidget(BuildContext context) {
    return Container(
      height: 86.0,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          width: 140.0,
          height: 44.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ProjectColor.purpul,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: const Text(
            "TEST BUTTON",
            style: TextStyle(
              color: ProjectColor.white,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontFamily: "Roboto",
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
