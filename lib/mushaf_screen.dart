import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/mushaf_page.dart';

class MushafScreen extends StatefulWidget {
  const MushafScreen({Key? key}) : super(key: key);

  @override
  MushafScreenState createState() => MushafScreenState();
}

class MushafScreenState extends State<MushafScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExpandablePageView.builder(
            itemCount: 604,
            reverse: true,
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            estimatedPageSize: double.maxFinite,
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemBuilder: (context, index) {
              return MushafPage(pageNumber: index);
            }),
      ),
    );
  }
}
