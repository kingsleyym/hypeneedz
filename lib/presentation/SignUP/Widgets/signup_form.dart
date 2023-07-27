// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

import 'package:hypeneedz/presentation/SignUP/Widgets/signinbutton.dart';

import '../../../application/auth/SignUpFormBloc/sign_up_form_bloc.dart';
import '../../../config/routes/routes.gr.dart';
import '../../../core/failures/auth_failures.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    String? validateEmail(String? input) {
      const emailRegex =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      if (input == null || input.isEmpty) {
        return "please enter email";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        email = input;
        return null;
      } else {
        return 'incalid email format';
      }
    }

    String? validatePassword(String? input) {
      if (input == null || input.isEmpty) {
        return "please enter email";
      } else if (input.length >= 6) {
        password = input;
        return null;
      } else {
        return 'password to short';
      }
    }

    String mapFailureMessenger(AuthFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "Server went wrong";
        case EmailAlreadyInUseFailure:
          return "email already in use";
        case InvalidEmailAndPasswordCombinationFailure:
          return "invalid email or password";
        default:
          return "something went wrong";
      }
    }

    final themeData = Theme.of(context);
    return BlocConsumer<SignUpFormBloc, SignupformState>(
      listenWhen: (p, c) =>
          p.authFailureOrSuccessOption != c.authFailureOrSuccessOption,
      listener: (context, state) {
        state.authFailureOrSuccessOption?.fold(
            () => {},
            (eitherfailureorsucces) => eitherfailureorsucces.fold((failure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        mapFailureMessenger(failure),
                        style: themeData.textTheme.bodyText1,
                      )));
                }, (_) {
                  AutoRouter.of(context).replace(const HomePageRoute());
                }));
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.2,
                        image: NetworkImage(
                            "https://cdn.shopify.com/s/files/1/2236/7041/files/Zeichenflaeche_2_Kopie_2_1200x.jpg?v=1686500092")),
                    color: Colors.black,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
                    child: Image.network(
                      "https://cdn.shopify.com/s/files/1/2236/7041/files/HN_RE_LOGO_3_weiss_165x@2x.png?v=1626805628",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50)),
                      color: Colors.white),
                  child: Form(
                    autovalidateMode: state.showValidationMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Login',
                          style: themeData.textTheme.headline1!.copyWith(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Please register or sign in",
                            style: themeData.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 3)),
                        const SizedBox(
                          height: 60,
                        ),
                        TextFormField(
                          validator: validateEmail,
                          cursorColor: Colors.grey,
                          decoration:
                              const InputDecoration(labelText: 'E-Mail'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: validatePassword,
                          obscureText: true,
                          cursorColor: Colors.grey,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignInRegisterButton(
                              buttonText: "sign in",
                              callback: () {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<SignUpFormBloc>(context).add(
                                      SignInWithEmailAndPasswordPressed(
                                          email: email, password: password));
                                } else {
                                  BlocProvider.of<SignUpFormBloc>(context).add(
                                      SignInWithEmailAndPasswordPressed(
                                          email: null, password: null));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.redAccent,
                                          content: Text(
                                            "invalid input",
                                            style:
                                                themeData.textTheme.bodyText1,
                                          )));
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                      onTap: (() =>
                                          BlocProvider.of<SignUpFormBloc>(
                                                  context)
                                              .add(SignInWithGoogle())),
                                      child: const Icon(
                                        LineIcons.facebook,
                                        size: 30,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                      onTap: (() =>
                                          BlocProvider.of<SignUpFormBloc>(
                                                  context)
                                              .add(SignInWithGoogle())),
                                      child: const Icon(
                                        LineIcons.googlePlus,
                                        size: 30,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                      onTap: (() =>
                                          BlocProvider.of<SignUpFormBloc>(
                                                  context)
                                              .add(SignInWithGoogle())),
                                      child: const Icon(
                                        fill: 1,
                                        LineIcons.apple,
                                        size: 30,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Dont have an account?'),
                                TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      BlocProvider.of<SignUpFormBloc>(context)
                                          .add(
                                              RegisterWithEmailAndPasswordPressed(
                                                  email: email,
                                                  password: password));
                                    } else {
                                      BlocProvider.of<SignUpFormBloc>(context)
                                          .add(
                                              RegisterWithEmailAndPasswordPressed(
                                                  email: null, password: null));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.redAccent,
                                              content: Text(
                                                "invalid input",
                                                style: themeData
                                                    .textTheme.bodyText2
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700),
                                              )));
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: themeData.textTheme.bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (state.isSubmitting) ...[
                          const SizedBox(
                            height: 25,
                          ),
                          LinearProgressIndicator(
                              color: themeData.colorScheme.secondary)
                        ],
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
