import 'dart:html';
import 'dart:async';

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

Future<dynamic> generateBase64(File file) async {
  final completer = Completer();
  final reader = FileReader();

  reader.onLoad.listen((file) {
    final loadedFile = file.currentTarget as FileReader;
    completer.complete(loadedFile.result);
  });

  reader.readAsDataUrl(file);
  return completer.future;
}
