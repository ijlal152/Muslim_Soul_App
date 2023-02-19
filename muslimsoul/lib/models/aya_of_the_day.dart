class AyaOfTheDay{
  final String? arText;
  final String? enTranslation;
  final String? surahEnName;
  final int? surahNumber;

  AyaOfTheDay({required this.arText, required this.enTranslation, required this.surahEnName, required this.surahNumber});

  factory AyaOfTheDay.fromJson(Map<String, dynamic> json) {
    return AyaOfTheDay(
      arText: json['data'][0]["text"],
      enTranslation: json['data'][2]["text"],
      surahEnName: json['data'][2]["surah"]["englishName"],
      surahNumber: json['data'][2]["numberInSurah"],
    );
  }
//
}