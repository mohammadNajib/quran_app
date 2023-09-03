import 'package:dartz/dartz.dart';

import '../../../../core/core_importer.dart';

abstract class MushafPageLocalDataSource {
  Future<Unit> changeMushafPage({required int pageNumber});

  Future<int> getPageNumber();
}

class MushafPageLocalDataSourceImplement implements MushafPageLocalDataSource {
  final SharedPreferences sharedPreferences;

  MushafPageLocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> changeMushafPage({required int pageNumber}) {
    try {
      sharedPreferences.setInt('page_number', pageNumber);
      return Future.value(unit);
    } catch (e) {
      throw (InternalException(message: e.toString()));
    }
  }

  @override
  Future<int> getPageNumber() {
    try {
      return Future.value(sharedPreferences.getInt('page_number'));
    } catch (e) {
      throw (InternalException(message: e.toString()));
    }
  }
}
