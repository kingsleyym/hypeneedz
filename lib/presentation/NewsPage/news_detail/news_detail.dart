// ignore: file_names
// ignore: file_names
// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/profile/bloc/profile_bloc.dart';
import '../../../domain/Entitys/news.dart';
import '../../../injection.dart';

@RoutePage()
class NewsDetailPage extends StatelessWidget {
  final News? news;
  const NewsDetailPage({
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
                      return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(news!.images[index]))));
                    },
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    BlocConsumer<ProfileBloc, ProfileState>(
                        listener: (context, state) {
                      if (state.state == ProfileStatus.failure) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Error"),
                        ));
                      }
                    }, builder: (context, state) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage:
                                NetworkImage(state.user.image ?? ""),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(state.user.username ?? "das"),
                        ],
                      );
                    }),
                    const Spacer(),
                    Text(news!.views.toString()),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.av_timer),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 1,
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
    return Container(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Gefallt 83 Mal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              selectionColor: Colors.black,
              text: const TextSpan(
                text: 'Luca Kingsley ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          ' This enables users to select the texThis enables users to select the texThis enables users to select the tex!',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Alle" + " 10" + " Kommentare Ansehen",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Vor 22 Stunden',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ]),
    );
  }
}
