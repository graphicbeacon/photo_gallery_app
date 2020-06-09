import 'package:angular/angular.dart';

import '../common/gallery_form/gallery_form_component.dart';

@Component(
  selector: 'gallery-new',
  template: '''
    <div class="row">
      <div class="col s12">
        <h3>Add new gallery</h3>
      </div>
    </div>
    <gallery-form></gallery-form>
  ''',
  directives: [GalleryFormComponent],
)
class GalleryNewComponent {}
