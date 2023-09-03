import 'package:quran_app/features/mushaf_page/domain/entities/page_date_entity.dart';

class PageDataModel extends PageDataEntity {
  const PageDataModel({required surahNumber, required startVerse, required endVerse})
      : super(endVerse: endVerse, startVerse: startVerse, surahNumber: surahNumber);

  factory PageDataModel.fromJson(Map<String, dynamic> json) =>
      PageDataModel(endVerse: json['end'], startVerse: json['start'], surahNumber: json['surah']);
}
