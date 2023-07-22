import 'package:alertamigo_app/pages/feature_showcase_page/feature_showcase_page.dart';
import 'package:alertamigo_app/provider/create_report_provider.dart';
import 'package:alertamigo_app/provider/map_provider.dart';
import 'package:alertamigo_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider()),
        ChangeNotifierProvider<CreateReportProvider>(
            create: (_) => CreateReportProvider()),
      ],
      child: GestureDetector(
          onTap: () {
            if (FocusManager.instance.primaryFocus!.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: MaterialApp(
            title: 'Alertamigo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().theme,
            onGenerateRoute: (settings) => generateRoute(settings),
            home: const ShowcaseScreen(),
            //    MainPage(
            //   pageIndex: 0,
            // ),
          )),
    );
  }
}
