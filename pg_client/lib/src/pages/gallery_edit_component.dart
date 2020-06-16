import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../route_paths.dart';
import '../common/gallery_form/gallery_form_component.dart';
import '../models/gallery.dart';
import '../services/gallery_service.dart';

@Component(
  selector: 'gallery-edit',
  template: '''
  <div class="row">
    <div class="col s12">
      <h3>Edit gallery</h3>
    </div>
  </div>
  <template [ngIf]="gallery != null">
    <gallery-form 
      [gallery]="gallery"
      [isEditMode]="true"
      submitBtnText="Save changes"></gallery-form>
  </template>
  ''',
  directives: [
    coreDirectives,
    GalleryFormComponent,
  ],
  providers: [ClassProvider(GalleryService)],
)
class GalleryEditComponent implements OnActivate {
  GalleryEditComponent(this._galleryService);

  final GalleryService _galleryService;
  Gallery gallery;

  @override
  void onActivate(_, RouterState current) async {
    final galleryId = getId(current.parameters);
    gallery = await _galleryService.getGallery(galleryId);
  }
}
