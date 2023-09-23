import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hypeneedz/config/routes/routes.gr.dart';
import 'package:line_icons/line_icons.dart';

import '../../application/auth/auth/auth_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            if (state is AuthStateUnauthenticated) {
              AutoRouter.of(context).push(const SignUpRoute());
            }
          }),
        ],
        child: AutoTabsScaffold(
            extendBody: true,
            routes: const [
              LandingRoute(),
              TodoRoute(),
              NewsRoute(),
              UserRoute(),
            ],
            bottomNavigationBuilder: (_, tabsRouter) {
              return Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 40,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                      )
                    ],
                    border: Border.all(
                        color: Colors.white.withOpacity(0.2), width: 1.0),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(0)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20, top: 10),
                    child: GNav(
                        tabBorder: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 1.0),
                        tabBorderRadius: 50,
                        color: Colors.white,
                        activeColor: Colors.black,
                        selectedIndex: tabsRouter.activeIndex,
                        onTabChange: tabsRouter.setActiveIndex,
                        tabBackgroundColor:
                            Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Colors.transparent,
                        tabs: const [
                          GButton(
                            icon: Icons.home,
                            iconSize: 20,
                          ),
                          GButton(
                            icon: Icons.military_tech_outlined,
                          ),
                          GButton(icon: LineIcons.shoePrints),
                          GButton(icon: Icons.person_outlined),
                        ])),
              );
            }));
  }
}
