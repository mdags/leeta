import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/home.dart';
import 'package:leeta/views/login.dart';
import 'package:leeta/widgets/variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ApiProvider.getToken();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        startLocale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.canRequestFocus) {
          FocusScope.of(context).requestFocus(new FocusNode());
        }
      },
      child: MaterialApp(
        title: 'Leeta',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepOrange.shade100,
            primaryColor: Colors.deepOrange,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: BLACK),
                textTheme: TextTheme(
                    headline6: GoogleFonts.comfortaa(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23)))),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginPage(),
        },
      ),
    );
  }
}
