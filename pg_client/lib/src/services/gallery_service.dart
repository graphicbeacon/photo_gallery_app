import 'dart:html';

import 'package:angular/angular.dart';
import 'package:dio/dio.dart';

import '../models/gallery.dart';

@Injectable()
class GalleryService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8888/gallery'));

  Future<List<Gallery>> getGalleries() async {
    final response = await _dio.get('');

    final responseGalleries = ((response.data) as List).map(
      (data) => Gallery.fromJson(data),
    );

    return responseGalleries.toList();
  }

  Future<Gallery> getGallery(int id) async {
    final response = await _dio.get('/$id');
    return Gallery.fromJson(response.data);
  }

  Future<Gallery> updateGallery(Gallery payload) async {
    final response = await _dio.post('', data: payload.toJson());
    return Gallery.fromJson(response.data);
  }
}
