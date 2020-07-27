import 'package:aqueduct/aqueduct.dart';

class Gallery extends ManagedObject<_Gallery> implements _Gallery {}

class _Gallery {
  @primaryKey
  int id;

  String title;
  DateTime publishDate;

  @Column(nullable: true)
  String description;

  @Column(nullable: true)
  String thumbnail;
}
