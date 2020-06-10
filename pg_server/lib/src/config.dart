import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

class PhotoGalleryConfiguration extends Configuration {
  PhotoGalleryConfiguration(String filename) : super.fromFile(File(filename));

  DatabaseConfiguration database;
}
