import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/application/news/form_bloc/bloc/form_bloc_bloc.dart';
import 'package:hypeneedz/config/routes/routes.gr.dart';
import 'package:hypeneedz/presentation/NewsPage/widgets/safeoverlay.dart';

import '../../../domain/Entitys/news.dart';
import '../../../injection.dart';
import '../news_text.dart';

@RoutePage()
class NewsFormPage extends StatelessWidget {
  final News? news;
  const NewsFormPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<NewsFormBloc>()..add(InitializeNewsForm(news: news)),
      child: BlocConsumer<NewsFormBloc, NewsFormState>(
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
              title: Text(news == null ? "Create News" : "Edit News"),
            ),
            body: Stack(
              children: [
                const NewsText(),
                SafeInProgressOverlay(isSaving: state.isSaving)
              ],
            ),
          );
        },
      ),
    );
  }
}
