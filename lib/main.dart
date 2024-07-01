import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/main_bindings.dart';
import 'package:fpg_flutter/utils/app_info_util.dart';
import 'package:fpg_flutter/public/global/global.dart';
import 'package:fpg_flutter/utils/storage/index.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'public/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Storage.instance.init();
  await Global.init();
  await AppInfoUtils.instance.fetchAppInfo();
  initializeDateFormatting().then((_) => runApp(
        ChangeNotifierProvider(
          create: (_) => AppTheme(),
          child: MyApp(),
        ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, themeNotifier, child) {
      return ScreenUtilInit(
        designSize: const Size(540, 960),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'FPG-t002',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRouter.login,
            getPages: AppRouter.pages,
            theme: AppTheme.lightTheme, // Use light theme
            darkTheme: AppTheme.darkTheme, // Use dark theme
            themeMode: ThemeMode.system,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            initialBinding: MainBindings(),
          );
        },
      );
    });
  }
}
