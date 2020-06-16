import 'package:pg_server/pg_server.dart';

import 'src/config.dart';
import 'src/controllers/gallery_controller.dart';

/// This type initializes an application.
class PgServerChannel extends ApplicationChannel {
  ManagedContext context;
  PhotoGalleryConfiguration config;

  @override
  Future prepare() async {
    config = PhotoGalleryConfiguration('config.yaml');
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, psc);

    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel
  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/gallery/[:id]").link(() => GalleryController(context));

    return router;
  }
}
