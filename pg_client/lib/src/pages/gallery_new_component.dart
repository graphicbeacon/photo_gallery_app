import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../common/gallery_form/gallery_form_component.dart';
import '../models/gallery.dart';
import '../services/gallery_service.dart';
import '../common/js_interop/materialize.dart';

@Component(
  selector: 'gallery-new',
  template: '''
    <div class="row">
      <div class="col s12">
        <h3>Add new gallery</h3>
      </div>
    </div>
    <gallery-form
      (onUpdate)="updateGallery"
      submitBtnText="Create gallery"></gallery-form>
  ''',
  directives: [GalleryFormComponent],
  providers: [ClassProvider(GalleryService)],
)
class GalleryNewComponent {
  GalleryNewComponent(this._galleryService, this._router);

  final GalleryService _galleryService;
  final Router _router;

  void updateGallery(Gallery gallery) async {
    try {
      await _galleryService.updateGallery(gallery);
      initToast(ToastOptions(
        html: 'Successfully added gallery!',
        classes: 'green darken-3',
      ));
      await _router.navigate('/');
    } catch (e) {
      initToast(ToastOptions(
        html: 'Problem creating gallery :(',
        classes: 'red',
      ));
    }
  }
}
