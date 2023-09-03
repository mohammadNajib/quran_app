import 'package:equatable/equatable.dart';

class PageDataEntity extends Equatable {
  final int surahNumber;
  final int startVerse;
  final int endVerse;

  const PageDataEntity({required this.surahNumber, required this.startVerse, required this.endVerse});

  @override
  List<Object?> get props => [surahNumber, startVerse, endVerse];
}
