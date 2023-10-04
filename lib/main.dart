import 'package:easy_localization/easy_localization.dart';
import 'package:estudobackapp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  //utilizando o dotenv.load para inicializar o .env e poder utilizar para fazer chamadas get ex: dotenv.get
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}
