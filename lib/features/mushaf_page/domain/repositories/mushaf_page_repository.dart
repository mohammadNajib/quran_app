import 'package:dartz/dartz.dart';
import 'package:quran_app/core/core_importer.dart';

abstract class MushafPageRepository {
  Future<Either<Failure, Unit>> changeMushafPage({required int pageNumber});
  Future<Either<Failure, int>> getPageNumber();
}
