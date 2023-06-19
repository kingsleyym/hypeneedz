import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth/auth_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // **************************************************************************
// news
// **************************************************************************
        Container(
          height: MediaQuery.of(context).size.height * 0.32,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      ("https://i.pinimg.com/564x/2a/17/2a/2a172a1487683fd1d930f315aeae5c0d.jpg")))),
          child: Container(
            color: Color.fromARGB(60, 0, 0, 0),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sneaker Heads',
                      style: themeData.textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.w900, color: Colors.white),
                    ),
                    Text(
                      'this is an example Text about schue',
                      style: themeData.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    )
                  ]),
            ),
          ),
        ),
        // **************************************************************************
// AutoRouteGenerator
// **************************************************************************
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Landing Page',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutPressEvent());
              },
              child:
                  const Text('Sign out', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        Center(
          child: Container(
            child: const Text('Landing Page'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Picturese(
                  shoepic:
                      'https://cdn.shopify.com/s/files/1/2236/7041/products/AirJordan4SECraftPhotonDust_2e07b16c-2734-4865-85ef-63d7937c2d77_1600x.jpg?v=1677252545'),
              Picturese(
                  shoepic:
                      'https://cdn.shopify.com/s/files/1/2236/7041/products/AirJordan4SECraftPhotonDustSeitenansicht_1600x.jpg?v=1677252545'),
              Picturese(
                  shoepic:
                      'https://cdn.shopify.com/s/files/1/2236/7041/products/AirJordan4SECraftPhotonDust_2e07b16c-2734-4865-85ef-63d7937c2d77_1600x.jpg?v=1677252545'),
            ],
          ),
        )
      ],
    );
  }
}

class Picturese extends StatelessWidget {
  final String shoepic;

  const Picturese({
    Key? key,
    required this.shoepic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(shoepic))),
            ),
          ),
          Text(
            'Air Jordan 4',
            style: themeData.textTheme.bodyText1!.copyWith(fontSize: 6),
          )
        ],
      ),
    );
  }
}
