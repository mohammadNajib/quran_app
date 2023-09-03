import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:quran_app/core/core_importer.dart';
import 'package:quran_app/features/mushaf_page/presentation/bloc/mushaf_page_bloc.dart';
import 'package:quran_app/features/mushaf_page/presentation/pages/mushaf_page.dart';

class MushafScreen extends StatefulWidget {
  const MushafScreen({Key? key}) : super(key: key);

  @override
  MushafScreenState createState() => MushafScreenState();
}

class MushafScreenState extends State<MushafScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MushafPageBloc, MushafPageState>(
      listener: (context, state) {
        if (state is MushafPageNumberState) {
          pageController.animateTo(state.pageNumber.toDouble(),
              duration: const Duration(seconds: 2), curve: Curves.linear);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ExpandablePageView.builder(
              onPageChanged: (page) => BlocProvider.of<MushafPageBloc>(context).add(ChangeMushafPage(pageNumber: page)),
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (context, index) => MushafPage(pageNumber: index),
              estimatedPageSize: double.maxFinite,
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: 604,
              reverse: true,
            ),
          ),
        );
      },
    );
  }
}
