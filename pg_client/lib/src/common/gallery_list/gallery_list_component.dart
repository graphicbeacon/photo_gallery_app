import 'package:angular/angular.dart';

@Component(
  selector: 'gallery-list',
  templateUrl: 'gallery_list_template.html',
  directives: [coreDirectives]
)
class GalleryListComponent {
  List items = List.generate(10, (idx) => 'Gallery $idx');
}