import 'package:aqueduct/aqueduct.dart';

import '../models/gallery.dart';

class GalleryController extends ResourceController {
  GalleryController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getGalleries() async {
    final query = Query<Gallery>(context);
    return Response.ok(await query.fetch());
  }

  @Operation.post()
  Future<Response> createGallery(@Bind.body() Gallery payload) async {
    final query = Query<Gallery>(context)..values = payload;
    return Response.ok(await query.insert());
  }
}
