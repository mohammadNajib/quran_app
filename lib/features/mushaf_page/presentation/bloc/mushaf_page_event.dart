part of 'mushaf_page_bloc.dart';

abstract class MushafPageEvent extends Equatable {
  const MushafPageEvent();

  handle({required Function(MushafPageState) emit, required MushafPageUseCases useCase});
}

class ChangeMushafPage extends MushafPageEvent {
  final int pageNumber;

  const ChangeMushafPage({required this.pageNumber});

  @override
  handle({required Function(MushafPageState) emit, required MushafPageUseCases useCase}) async {
    await useCase.changeMushafPageUseCase(pageNumber: pageNumber);
  }

  @override
  List<Object?> get props => [pageNumber];
}

class GetPageNumberEvent extends MushafPageEvent {
  @override
  handle({required Function(MushafPageState) emit, required MushafPageUseCases useCase}) async {
    Either either = await useCase.getPageNumberUseCase();
    either.fold((failure) => emit(ErrorPageState()), (page) => emit(MushafPageNumberState(pageNumber: page)));
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
