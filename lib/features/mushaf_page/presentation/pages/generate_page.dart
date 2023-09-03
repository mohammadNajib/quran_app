import 'package:quran/quran.dart';
import 'package:quran_app/features/mushaf_page/data/models/page_data_model.dart';
import 'package:quran_app/features/mushaf_page/domain/entities/page_date_entity.dart';

String generatePage({required int pageNumber}) {
  if (pageNumber == 0) return 'القرآن الكريم';
  String result = '';
  int surahCount = getSurahCountByPage(pageNumber);
  List<dynamic> pageData = getPageData(pageNumber);
  for (int i = 0; i < surahCount; i++) {
    PageDataEntity page = PageDataModel.fromJson((pageData[i]));
    if (page.startVerse == 1) {
      result += '$basmala\n';
    }
    for (int j = page.startVerse; j <= page.endVerse; j++) {
      result += '${getVerse(page.surahNumber, j)} ';
      result += '${replaceWithArabic(j)} ';
    }
  }
  return result;
}

String replaceWithArabic(int number) {
  String stringNumber = number.toString();
  String result = '';
  for (int i = 0; i < stringNumber.length; i++) {
    switch (stringNumber[i]) {
      case '0':
        result += '\u0660';
        break;
      case '1':
        result += '\u0661';
        break;
      case '2':
        result += '\u0662';
        break;
      case '3':
        result += '\u0663';
        break;
      case '4':
        result += '\u0664';
        break;
      case '5':
        result += '\u0665';
        break;
      case '6':
        result += '\u0666';
        break;
      case '7':
        result += '\u0667';
        break;
      case '8':
        result += '\u0668';
        break;
      case '9':
        result += '\u0669';
        break;
    }
  }
  return result;
}
