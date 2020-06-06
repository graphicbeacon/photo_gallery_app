import 'package:angular/angular.dart';

import '../common/gallery_list/gallery_list_component.dart';

@Component(
  selector: 'home',
  template: '''
    <gallery-list></gallery-list>
  ''',
  directives: [GalleryListComponent]
)
class HomeComponent {}