import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/domain/repository/news_repoitory.dart';
import 'package:hypeneedz/infrastructure/repository/news_repoitory.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/news/observe/bloc/observer_bloc_bloc.dart';
import '../../../injection.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsObserverBloc, NewsObserverState>(
      builder: (context, state) {
        if (state is NewsObserverInitial) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.37,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        ("https://i.pinimg.com/564x/2a/17/2a/2a172a1487683fd1d930f315aeae5c0d.jpg")))),
          );
        } else if (state is NewsObserverLoading) {
          print('lol');
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Shimmer.fromColors(
              baseColor: themeData.colorScheme.secondary,
              highlightColor: themeData.colorScheme.onPrimary,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          );
        } else if (state is NewsObserverSucsses) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.37,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.news[0].images.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print(state.news[index].views);
                    sl<NewsRepository>().updateViews(state.news[index]);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(state.news[0].images[index]))),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color.fromARGB(41, 0, 0, 0),
                            Colors.black
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 60),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                state.news[0].title,
                                style: themeData.textTheme.headline1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                state.news[0].body,
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewsObserverFailure) {
          return const Center(child: Text("Failure"));
        }
        return Container();
      },
    );
  }
}
