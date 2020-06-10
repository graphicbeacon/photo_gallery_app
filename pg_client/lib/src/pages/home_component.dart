import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../common/gallery_list/gallery_list_component.dart';
import '../models/gallery.dart';
import '../services/gallery_service.dart';

@Component(
  selector: 'home',
  template: '''
    <div *ngIf="isLoading">
      Loading...
    </div>

    <div *ngIf="!isLoading">
      <gallery-list [items]="galleries"></gallery-list>
    </div>
  ''',
  directives: [
    coreDirectives,
    GalleryListComponent,
  ],
  providers: [ClassProvider(GalleryService)],
)
class HomeComponent implements OnActivate {
  HomeComponent(this._galleryService);

  final GalleryService _galleryService;
  List<Gallery> galleries;
  bool isLoading = true;

  @override
  Future<void> onActivate(_, __) async {
    galleries = await _galleryService.getGalleries();
    isLoading = false;
  }
}
