import 'package:estudobackapp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  //utilizando o dotenv.load para inicializar o .env e poder utilizar para fazer chamadas get ex: dotenv.get
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
