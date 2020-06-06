import 'package:angular_router/angular_router.dart';

import './route_paths.dart';
import './pages/home_component.template.dart' as home_template;
import './pages/gallery_new_component.template.dart' as gallery_new_template;

export './route_paths.dart';

class Routes {
  static final home = RouteDefinition(
    routePath: RoutePaths.home,
    component: home_template.HomeComponentNgFactory,
  );

  static final galleryNew = RouteDefinition(
    routePath: RoutePaths.galleryNew,
    component: gallery_new_template.GalleryNewComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    home,
    galleryNew,
  ];
}