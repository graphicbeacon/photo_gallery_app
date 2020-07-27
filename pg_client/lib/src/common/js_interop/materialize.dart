@JS('M')
library materialize_interop;

import 'dart:html';

import 'package:js/js.dart';

@JS('Datepicker.init')
external Datepicker initDatepicker(Element elem, [DatepickerOptions options]);

class Datepicker {
  external void destroy();
}

@anonymous
@JS()
class DatepickerOptions {
  external factory DatepickerOptions({
    String format,
    DateTime defaultDate,
    bool setDefaultDate,
  });
}

@JS('toast')
external void initToast(ToastOptions options);

@anonymous
@JS()
class ToastOptions {
  external factory ToastOptions({
    String html,
    String classes,
  });
}

@JS('Materialbox.init')
external Materialbox initMaterialbox(Element elem);

class Materialbox {
  external void destroy();
}
