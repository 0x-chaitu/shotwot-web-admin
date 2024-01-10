import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:admin/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit(asExtension: false)
Future<void> configureDependencies() async => await init(locator);