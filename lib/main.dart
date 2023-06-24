import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hypeneedz/api/theme_service.dart';
import 'package:hypeneedz/application/auth/auth/auth_bloc.dart';
import 'package:hypeneedz/application/news/observe/bloc/observer_bloc_bloc.dart';

import 'package:hypeneedz/infrastructure/repository/product_repo.dart';
import 'package:hypeneedz/config/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/injection.dart' as di;
import 'application/products/watchert/product_bloc.dart';
import 'firebase_options.dart';

import 'injection.dart';
import 'package:hypeneedz/config/routes/routes.gr.dart' as r;

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

  final _appRouter = r.AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return RepositoryProvider<ProductRepository>(
        create: (_) => ProductRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductBloc(
                  productRepository: context.read<ProductRepository>()),
            ),
            BlocProvider(
              create: (context) =>
                  sl<AuthBloc>()..add(AuthCheckRequestedEvent()),
            ),
            BlocProvider(
                create: (context) => sl<NewsObserverBloc>()..add(ObserveAll())),
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
        ),
      );
    });
  }
}
