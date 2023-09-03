import 'package:dartz/dartz.dart';
import 'package:quran_app/core/core_importer.dart';
import 'package:quran_app/features/mushaf_page/domain/repositories/mushaf_page_repository.dart';

class ChangeMushafPageUseCase {
  final MushafPageRepository mushafPageRepository;

  ChangeMushafPageUseCase({required this.mushafPageRepository});

  Future<Either<Failure, Unit>> call({required int pageNumber}) async {
    return await mushafPageRepository.changeMushafPage(pageNumber: pageNumber);
  }
}
