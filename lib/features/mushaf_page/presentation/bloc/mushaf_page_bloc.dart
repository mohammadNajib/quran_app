import 'package:dartz/dartz.dart';

import '../../../../core/core_importer.dart';
import '../../domain/use_cases/mushaf_page_use_cases.dart';

part 'mushaf_page_event.dart';
part 'mushaf_page_state.dart';

class MushafPageBloc extends Bloc<MushafPageEvent, MushafPageState> {
  final MushafPageUseCases mushafPageUseCases;
  MushafPageBloc({required this.mushafPageUseCases}) : super(MushafPageInitial()) {
    on<MushafPageEvent>((event, emit) {
      event.handle(emit: emit, useCase: mushafPageUseCases);
    });
  }
}
