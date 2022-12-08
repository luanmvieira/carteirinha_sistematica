import 'package:carteirinha_sistematica/app/modules/auth/auth_store.dart';
import 'package:carteirinha_sistematica/app/modules/home/home_store.dart';
import 'package:carteirinha_sistematica/app/modules/registration/registration_module.dart';
import 'package:carteirinha_sistematica/app/modules/registration/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationStore()),
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/registration', module: RegistrationModule()),

  ];

}