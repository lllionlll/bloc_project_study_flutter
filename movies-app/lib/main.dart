import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/data/tables/movie_table.dart';

import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:movies_app/presentation/movie_app.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  await getIt.init();
  final appDocsDirectory = await getApplicationDocumentsDirectory();
  //Hive.init(appDocsDirectory.path);
  await Hive.initFlutter(appDocsDirectory.path);
  Hive.registerAdapter(MovieTableAdapter());
  runApp(const MovieApp());
}
