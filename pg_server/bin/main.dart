import 'package:aqueduct/aqueduct.dart';
import 'package:pg_server/pg_server.dart';

Future main() async {
  final app = Application<PgServerChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}