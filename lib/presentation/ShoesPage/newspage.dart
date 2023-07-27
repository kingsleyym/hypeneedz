// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeText = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Icon(
                  LineIcons.alternateLongArrowLeft,
                  color: Colors.black,
                ),
              ))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              width: size.width * 1,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: const Color.fromRGBO(248, 248, 248, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: const DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: NetworkImage(
                          "https://cdn.shopify.com/s/files/1/2236/7041/files/NikeDunkLowIndustrialBlueSashiko_1600x.png?v=1686851092"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike Dunk Low',
                      style: themeText.headline1!.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Industrial Blue Sashiko',
                      style: themeText.headline2!.copyWith(fontSize: 25),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
