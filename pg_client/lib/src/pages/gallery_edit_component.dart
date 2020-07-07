import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../route_paths.dart';
import '../common/gallery_form/gallery_form_component.dart';
import '../common/js_interop/materialize.dart';
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
      (onUpdate)="updateGallery"
      (onDelete)="deleteGallery"
      submitBtnText="Save changes"></gallery-form>
  </template>
  ''',
  directives: [
    coreDirectives,
    routerDirectives,
    GalleryFormComponent,
  ],
  providers: [ClassProvider(GalleryService)],
)
class GalleryEditComponent implements OnActivate {
  GalleryEditComponent(this._galleryService, this._router);

  final Router _router;
  final GalleryService _galleryService;
  Gallery gallery;

  @override
  void onActivate(_, RouterState current) async {
    final galleryId = getId(current.parameters);
    gallery = await _galleryService.getGallery(galleryId);
  }

  void updateGallery(Gallery payload) async {
    try {
      await _galleryService.updateGallery(payload);
      initToast(ToastOptions(
        html: 'Successfully updated gallery!',
        classes: 'green darken-3',
      ));
    } catch (e) {
      initToast(ToastOptions(
        html: 'Problem updating gallery :(',
        classes: 'red',
      ));
    }
  }

  void deleteGallery(Gallery payload) async {
    try {
      await _galleryService.deleteGallery(payload);
      initToast(ToastOptions(
        html: 'Successfully deleted gallery!',
        classes: 'blue blue-lighten-3',
      ));
      await _router.navigate('/');
    } catch (e) {
      initToast(ToastOptions(
        html: 'Problem deleting gallery :( Please try again',
        classes: 'red',
      ));
    }
  }
}
