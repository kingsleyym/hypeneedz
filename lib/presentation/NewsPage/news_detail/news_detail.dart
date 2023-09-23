// ignore: file_names
// ignore: file_names
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/profile/bloc/profile_bloc.dart';
import '../../../domain/Entitys/news.dart';
import '../../../injection.dart';

class NewsDetail extends StatelessWidget {
  final News? news;
  const NewsDetail({
    Key? key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final observeBloc = sl<ProfileBloc>()
      ..add(ProfileLoadUser(userId: news!.author));

    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => observeBloc,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              elevation: 0,
              primary: true,
              backgroundColor: Colors.transparent,
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                )
              ]),
          body: Column(
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      color: Colors.transparent),
                  height: size.height * 0.38,
                  child: PageView.builder(
                    itemCount: news?.images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(decoration: BoxDecoration());
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(news!.body,
                        style: Theme.of(context).textTheme.headline6),
                    const Spacer(),
                    Text(news!.body),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.av_timer),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              news!.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(fontWeight: FontWeight.w900),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              news!.body,
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(news!.body,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const User()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}

class User extends StatelessWidget {
  const User({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state.state == ProfileStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error"),
        ));
      }
    }, builder: (context, state) {
      return Column(
        children: [
          state.currentUser ? const Text("You") : const Text("Me"),
          Text(state.user.username),
        ],
      );
    });
  }
}
