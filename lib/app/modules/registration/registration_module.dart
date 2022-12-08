import 'package:carteirinha_sistematica/app/modules/registration/registration_page.dart';
import 'package:carteirinha_sistematica/app/modules/registration/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegistrationPage())
  ];

}