part of 'mushaf_page_bloc.dart';

abstract class MushafPageState extends Equatable {
  const MushafPageState();
}

class MushafPageInitial extends MushafPageState {
  @override
  List<Object> get props => [];
}

class MushafPageNumberState extends MushafPageState {
  final int pageNumber;

  const MushafPageNumberState({required this.pageNumber});

  @override
  List<Object?> get props => [pageNumber];
}

class ErrorPageState extends MushafPageState {
  @override
  List<Object?> get props => [];
}
