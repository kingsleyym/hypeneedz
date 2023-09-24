import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/application/shoes/form_bloc/bloc/form_bloc_bloc.dart';
import 'package:hypeneedz/config/routes/routes.gr.dart';
import 'package:hypeneedz/presentation/todo/shoes_text.dart';

import '../../../domain/Entitys/shoes.dart';
import '../../../injection.dart';
import '../NewsPage/widgets/safeoverlay.dart';

@RoutePage()
class ShoesFormPage extends StatelessWidget {
  final Shoes? shoes;
  const ShoesFormPage({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ShoesFormBloc>()..add(InitializeShoesForm(shoes: shoes)),
      child: BlocConsumer<ShoesFormBloc, ShoesFormState>(
        listenWhen: (p, c) =>
            p.failureOrSuccessOption != c.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
              () {},
              (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
                  (failure) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("failure"),
                          backgroundColor: Colors.redAccent)),
                  (_) => Navigator.of(context).popUntil(
                      (route) => route.settings.name == LandingRoute.name)));
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              iconTheme: const IconThemeData(color: Colors.black),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(shoes == null ? "Create Shoes" : "Edit Shoes"),
            ),
            body: Stack(
              children: [
                const ShoesText(),
                SafeInProgressOverlay(isSaving: state.isSaving)
              ],
            ),
          );
        },
      ),
    );
  }
}
