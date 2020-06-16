import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../routes.dart';
import '../../models/gallery.dart';

@Component(
  selector: 'gallery-list',
  templateUrl: 'gallery_list_template.html',
  directives: [
    coreDirectives,
    routerDirectives,
  ],
  exports: [
    RoutePaths,
  ],
)
class GalleryListComponent {
  @Input()
  List<Gallery> items;

  String galleryViewUrl(int id) =>
      RoutePaths.galleryView.toUrl(parameters: {idParam: '$id'});

  String galleryEditUrl(int id) =>
      RoutePaths.galleryEdit.toUrl(parameters: {idParam: '$id'});
}
