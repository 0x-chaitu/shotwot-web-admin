// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin/src/blocs/auth/auth_bloc.dart' as _i8;
import 'package:admin/src/repository/i_auth.dart' as _i6;
import 'package:admin/src/repository/impl/auth.dart' as _i7;
import 'package:admin/src/service/app.module.dart' as _i9;
import 'package:admin/src/service/firebase_service.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.FirebaseAuth>(() => appModule.auth);
  await gh.factoryAsync<_i4.FirebaseService>(
    () => appModule.firebaseService,
    preResolve: true,
  );
  gh.factory<_i5.GoogleSignIn>(() => appModule.gauth);
  gh.factory<_i6.IAuth>(() => _i7.AuthFacade(gh<_i3.FirebaseAuth>()));
  gh.factory<_i8.AuthBloc>(() => _i8.AuthBloc(gh<_i6.IAuth>()));
  return getIt;
}

class _$AppModule extends _i9.AppModule {}
