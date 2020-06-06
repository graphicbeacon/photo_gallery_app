import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
  ],
  exports: [
    RoutePaths,
    Routes,
  ]
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
