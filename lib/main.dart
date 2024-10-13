import 'package:untitled/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/admin_app.dart';
import 'core/class/observer.dart';
import 'package:device_preview/device_preview.dart';

import 'core/class/cache_helper.dart';
import 'core/get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServise();
  Bloc.observer = MyBlocObserver();
  await getIt<CacheHelper>().init();
  runApp(
      DevicePreview(enabled: false, builder: (context) => const AdminPanel()));
}
