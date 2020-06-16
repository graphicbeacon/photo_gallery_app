String formatPublishedDate(String dateStr) {
  if (dateStr == null || dateStr.isEmpty) return null;

  final date = DateTime.parse(dateStr);
  final year = date?.year;
  final month = date != null && date.month < 10
      ? '${date.month}'.padLeft(2, '0')
      : date?.month;
  final day =
      date != null && date.day < 10 ? '${date.day}'.padLeft(2, '0') : date?.day;

  return '$year-$month-$day';
}
