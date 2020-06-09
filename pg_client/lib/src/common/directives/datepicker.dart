import 'dart:html';

import 'package:angular/angular.dart';

import '../js_interop/materialize.dart';

@Directive(
  selector: '[datepicker]',
)
class DatepickerDirective implements AfterViewChecked, OnDestroy {
  Datepicker datepicker;

  @Input()
  Element datepickerElement;

  @Input()
  DateTime datepickerDefaultDate;

  @override
  void ngAfterViewChecked() {
    if (datepickerElement != null && datepickerElement is Element) {
      datepicker = initDatepicker(
        datepickerElement,
        DatepickerOptions(
          format: 'yyyy-mm-dd',
          defaultDate: datepickerDefaultDate,
          setDefaultDate: true,
        ),
      );
    }
  }

  @override
  void ngOnDestroy() {
    datepicker.destroy();
  }
}
