import 'package:dartz/dartz.dart';
import 'package:quran_app/features/mushaf_page/data/data_sources/mushaf_page_local_data_source.dart';

import '../../../../core/core_importer.dart';
import '../../domain/repositories/mushaf_page_repository.dart';

class MushafPageRepositoryImplement implements MushafPageRepository {
  final MushafPageLocalDataSource mushafPageLocalDataSource;

  MushafPageRepositoryImplement({required this.mushafPageLocalDataSource});

  @override
  Future<Either<Failure, Unit>> changeMushafPage({required int pageNumber}) async {
    try {
      await mushafPageLocalDataSource.changeMushafPage(pageNumber: pageNumber);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getPageNumber() async {
    try {
      int page = await mushafPageLocalDataSource.getPageNumber();
      return Right(page);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }
}
