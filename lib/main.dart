import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:red_host_app/app_widget.dart';
import 'package:red_host_app/src/core/DI/dependency_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const AppWidget());
}
