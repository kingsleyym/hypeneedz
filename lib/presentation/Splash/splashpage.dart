import 'package:auto_route/auto_route.dart';
import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/routes/routes.gr.dart';

import '../../application/auth/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          Future.delayed(const Duration(seconds: 2), () {
            context.router.replace(const HomePageRoute());
          });
        } else if (state is AuthStateUnauthenticated) {
          Future.delayed(const Duration(seconds: 2), () {
            context.router.replace(const SignUpPageRoute());
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: FadeOutParticle(
              duration: const Duration(seconds: 2),
              disappear: true,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.95,
                color: Colors.black,
                child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.shopify.com/s/files/1/2236/7041/files/HN_RE_LOGO_3_weiss_165x@2x.png?v=1626805628")))),
              )),
        ),
      ),
    );
  }
}
