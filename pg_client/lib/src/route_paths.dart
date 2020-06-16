import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final home = RoutePath(path: '/');
  static final galleryNew = RoutePath(path: '/gallery/new');
  static final galleryView = RoutePath(path: '/gallery/:$idParam');
  static final galleryEdit = RoutePath(path: '${galleryView.path}/edit');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
