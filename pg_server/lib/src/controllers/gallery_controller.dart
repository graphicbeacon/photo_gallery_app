import 'package:aqueduct/aqueduct.dart';

import '../models/gallery.dart';

class GalleryController extends ResourceController {
  GalleryController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getGalleries() async {
    final query = Query<Gallery>(context)
      ..sortBy(
        (g) => g.id,
        QuerySortOrder.ascending,
      );
    return Response.ok(await query.fetch());
  }

  @Operation.get('id')
  Future<Response> getGallery(@Bind.path('id') int id) async {
    final query = Query<Gallery>(context)..where((g) => g.id).equalTo(id);
    return Response.ok(await query.fetchOne());
  }

  @Operation.post()
  Future<Response> createGallery(@Bind.body() Gallery payload) async {
    final query = Query<Gallery>(context)..values = payload;
    return Response.ok(await query.insert());
  }

  @Operation.put('id')
  Future<Response> updateGallery(
    @Bind.path('id') int id,
    @Bind.body(ignore: ['id']) Gallery payload,
  ) async {
    final query = Query<Gallery>(context)
      ..where((g) => g.id).equalTo(id)
      ..values = payload;
    return Response.ok(await query.updateOne());
  }

  @Operation.delete('id')
  Future<Response> deleteGallery(@Bind.path('id') int id) async {
    final query = Query<Gallery>(context)..where((g) => g.id).equalTo(id);
    return Response.ok(await query.delete());
  }
}
