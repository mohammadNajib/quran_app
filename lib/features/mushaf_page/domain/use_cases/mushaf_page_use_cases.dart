import 'package:quran_app/features/mushaf_page/domain/use_cases/change_mushaf_page_use_case.dart';
import 'package:quran_app/features/mushaf_page/domain/use_cases/get_page_number_use_case.dart';

class MushafPageUseCases {
  final ChangeMushafPageUseCase changeMushafPageUseCase;
  final GetPageNumberUseCase getPageNumberUseCase;

  MushafPageUseCases({required this.getPageNumberUseCase, required this.changeMushafPageUseCase});
}
