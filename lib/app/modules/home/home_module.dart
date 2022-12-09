import 'package:carteirinha_sistematica/app/modules/home/views/carteirinha_page.dart';
import 'package:carteirinha_sistematica/app/modules/home/views/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart'; 

import 'views/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute('/',child: (_, args) => HomePage(),),
   ChildRoute('/carteirinha',child: (_, args) => CarteirinhaPage(),),
   ChildRoute('/profile',child: (_, args) => ProfilePage(),),
 ];
}