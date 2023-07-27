// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/domain/repository/news_repoitory.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../application/news/observe/bloc/observer_bloc_bloc.dart';
import '../../../config/routes/routes.gr.dart';
import '../../../injection.dart';
import '../../widgets/pagecard.dart';

class NewsHeader extends StatelessWidget {
  NewsHeader({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsObserverBloc, NewsObserverState>(
      builder: (context, state) {
        if (state is NewsObserverInitial) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        ("https://i.pinimg.com/564x/2a/17/2a/2a172a1487683fd1d930f315aeae5c0d.jpg")))),
          );
        } else if (state is NewsObserverLoading) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Shimmer.fromColors(
              baseColor: themeData.colorScheme.secondary,
              highlightColor: themeData.colorScheme.onPrimary,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          );
        } else if (state is NewsObserverSucsses) {
          return Stack(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  return PageCard(
                    themeData: themeData,
                    onTab: () {
                      sl<NewsRepository>().updateViews(state.news[index]);
                      AutoRouter.of(context)
                          .push(NewsDetailRoute(news: state.news[index]));
                    },
                    onLong: () {
                      AutoRouter.of(context).push(NewsFormRoute(news: null));
                    },
                    body: state.news[index].desc,
                    thumb: state.news[index].thumb,
                    title: state.news[index].title,
                    views: state.news[index].views!,
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: 20,
                child: Column(children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: state.news.length,
                      effect: const WormEffect(
                          dotColor: Colors.black,
                          activeDotColor: Colors.white,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 5),
                    ),
                  ),
                ]),
              ),
            ),
          ]);
        } else if (state is NewsObserverFailure) {
          return const Center(child: Text("Failure"));
        }
        return Container();
      },
    );
  }
}
