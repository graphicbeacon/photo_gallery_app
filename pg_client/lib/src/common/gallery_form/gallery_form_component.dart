import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../models/gallery.dart';
import '../directives/datepicker.dart';

@Component(
    selector: 'gallery-form',
    templateUrl: 'gallery_form_template.html',
    styleUrls: [
      'gallery_form_template.css'
    ],
    directives: [
      coreDirectives,
      formDirectives,
      DatepickerDirective,
    ])
class GalleryFormComponent implements OnInit {
  Gallery gallery;

  DateTime defaultDate;

  @override
  void ngOnInit() {
    gallery = Gallery();

    if (gallery.publishDate is String && gallery.publishDate.isNotEmpty) {
      // Convert publishDate to DateTime object
      defaultDate = DateTime.parse(gallery.publishDate);
    }
  }

  void onDatepickerUpdate(Event $event) {
    gallery.publishDate = ($event.target as InputElement).value;
  }

  void updateGallery(NgForm form) {
    if (form.valid) {
      window.console.log(gallery.toJson());
    } else {
      form.controls.forEach((key, control) {
        control.markAsDirty(onlySelf: true);
      });
    }
  }
}