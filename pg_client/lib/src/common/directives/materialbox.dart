import 'dart:html';

import 'package:angular/angular.dart';

import '../js_interop/materialize.dart';

@Directive(
  selector: '[materialbox]',
)
class MaterialboxDirective implements AfterViewChecked, OnDestroy {
  Materialbox mbox;

  @Input()
  Element materialboxElement;

  @override
  void ngAfterViewChecked() {
    if (materialboxElement != null && materialboxElement is Element) {
      mbox = initMaterialbox(materialboxElement);
    }
  }

  @override
  void ngOnDestroy() {
    mbox.destroy();
  }
}
