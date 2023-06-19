import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/SignUpFormBloc/sign_up_form_bloc.dart';
import '../../injection.dart';
import 'Widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SignUpFormBloc>(),
        child: const SignUpForm(),
      ),
    );
  }
}
