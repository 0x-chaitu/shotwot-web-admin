import 'package:admin/injection.dart';
import 'package:admin/src/app.dart';
import 'package:admin/src/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (context) => locator<AuthBloc>(),
    ),
  ], child: const App()));
}
