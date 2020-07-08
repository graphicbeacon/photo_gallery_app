import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../common/gallery_list/gallery_list_component.dart';
import '../models/gallery.dart';
import '../services/gallery_service.dart';
import '../route_paths.dart';

@Component(
  selector: 'home',
  template: '''
    <div *ngIf="isLoading">
      Loading...
    </div>

    <div *ngIf="!isLoading && galleries.isEmpty" class="row center">
      <div class="col m4 offset-m4">
        <h4>No galleries found</h4>
        <p>
          <a [routerLink]="RoutePaths.galleryNew.toUrl()" class="btn">Add new</a>
        </p>
      </div>
    </div>

    <div *ngIf="!isLoading && galleries.isNotEmpty">
      <gallery-list [items]="galleries"></gallery-list>
    </div>
  ''',
  directives: [
    coreDirectives,
    routerDirectives,
    GalleryListComponent,
  ],
  exports: [
    RoutePaths,
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
