import 'package:carteirinha_sistematica/app/modules/auth/auth_page.dart';
import 'package:carteirinha_sistematica/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => Auth_page()),
  ];

}