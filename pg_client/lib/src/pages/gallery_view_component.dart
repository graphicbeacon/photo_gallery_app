import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:pg_client/src/routes.dart';

import '../models/gallery.dart';
import '../services/gallery_service.dart';

@Component(
  selector: 'gallery-view',
  template: '''
  <div class="row">
    <div class="col s12">
      <template [ngIf]="gallery != null">
        <h3>Viewing "{{ gallery.title }}"</h3>
      </template>
    </div>
  </div>
  ''',
  directives: [coreDirectives],
  providers: [ClassProvider(GalleryService)],
)
class GalleryViewComponent implements OnActivate {
  final GalleryService _galleryService;
  GalleryViewComponent(this._galleryService);

  Gallery gallery;

  @override
  void onActivate(_, RouterState current) async {
    final galleryId = getId(current.parameters);
    gallery = await _galleryService.getGallery(galleryId);
  }
}
