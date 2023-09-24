import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hypeneedz/api/theme_service.dart';
import 'package:hypeneedz/application/auth/auth/auth_bloc.dart';
import 'package:hypeneedz/config/routes/routes.dart';

import 'package:hypeneedz/config/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/injection.dart' as di;

import 'firebase_options.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<AuthBloc>()..add(AuthCheckRequestedEvent()),
          ),
        ],
        child: MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        ),
      );
    });
  }
}
