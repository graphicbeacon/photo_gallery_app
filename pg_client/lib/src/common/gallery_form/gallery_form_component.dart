import 'dart:html';
import 'dart:async';

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
  @Input()
  Gallery gallery;

  @Input()
  String submitBtnText;

  @Input()
  bool isEditMode;

  DateTime defaultDate;

  final _formUpdateCtrl = StreamController<Gallery>();
  @Output('onUpdate')
  Stream get formUpdate => _formUpdateCtrl.stream;

  final _formDeleteCtrl = StreamController<Gallery>();
  @Output('onDelete')
  Stream get formDelete => _formDeleteCtrl.stream;

  @override
  void ngOnInit() {
    gallery ??= Gallery();

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
      _formUpdateCtrl.add(gallery);
    } else {
      form.controls.forEach((key, control) {
        control.markAsDirty(onlySelf: true);
      });
    }
  }

  void deleteGallery() async {
    final confirmDelete = window.confirm('Are you sure?');
    if (confirmDelete) {
      _formDeleteCtrl.add(gallery);
    }
  }
}
