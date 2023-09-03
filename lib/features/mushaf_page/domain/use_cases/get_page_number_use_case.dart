import 'package:dartz/dartz.dart';
import 'package:quran_app/features/mushaf_page/domain/repositories/mushaf_page_repository.dart';

import '../../../../core/core_importer.dart';

class GetPageNumberUseCase {
  final MushafPageRepository mushafPageRepository;

  GetPageNumberUseCase({required this.mushafPageRepository});

  Future<Either<Failure, int>> call() async {
    return await mushafPageRepository.getPageNumber();
  }
}
