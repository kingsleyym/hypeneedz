// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageCard extends StatelessWidget {
  const PageCard({
    super.key,
    required this.themeData,
    required this.onTab,
    required this.onLong,
    required this.thumb,
    required this.title,
    required this.body,
    required this.views,
  });

  final ThemeData themeData;
  final Function onLong;
  final Function onTab;
  final String thumb;
  final String title;
  final String body;
  final int views;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        onLong;
      },
      onTap: () {
        onTab;
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: CachedNetworkImageProvider(thumb))),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(41, 0, 0, 0), Colors.black])),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: themeData.textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  Text(
                    body,
                    style: themeData.textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '$views views',
                        style: themeData.textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
