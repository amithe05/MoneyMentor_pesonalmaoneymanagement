import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:moneymentor/screens/settingscreen/widgets/my_theme.dart';
import 'package:moneymentor/screens/settingscreen/widgets/theme_data.dart';
import 'package:moneymentor/screens/splashscreen/screen_splash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

const saveKey = "savekey";
const themeKey = "themekey";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.zinitializeTimeZones();
  final appdocumentdir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appdocumentdir.path);
  await Hive.openBox('money');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themechangeprovider = DarkThemeProvider();

  getcurrentapptheme() async {
    themechangeprovider.darkTheme =
        await themechangeprovider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getcurrentapptheme();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => themechangeprovider)],
        child: Consumer<DarkThemeProvider>(builder: ((context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MoneyMentor',
            theme:Styles.themeData(themechangeprovider.darkTheme, context),
            home: const ScreenSplash(),
          );
        })));
  }
}
