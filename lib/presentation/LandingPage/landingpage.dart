import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/application/news/observe/bloc/observer_bloc_bloc.dart';
import 'package:hypeneedz/config/routes/routes.gr.dart';
import 'package:hypeneedz/presentation/LandingPage/widgets/newsheader.dart';

import '../../application/auth/auth/auth_bloc.dart';
import '../../injection.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final themeText = Theme.of(context).textTheme;
    final themeColor = Theme.of(context).colorScheme;
    final observeBloc = sl<NewsObserverBloc>()..add(ObserveAll());

    return BlocProvider<NewsObserverBloc>(
      create: (context) => observeBloc,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **************************************************************************
            // news
            // **************************************************************************
            NewsHeader(themeData: themeData),
            // **************************************************************************
            // widegt_consihn
            // **************************************************************************
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 24, right: 24.0, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 34, 34, 34)),
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 140,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn.dribbble.com/users/677658/screenshots/4888588/vans-800x600-2.png?compress=1&resize=700x525&vertical=center')),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Sneaker Heads',
                                style: themeData.textTheme.headline2!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                'this is an example ',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    'Lets Go',
                                    style: themeData.textTheme.headline4,
                                  )
                                ],
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // **************************************************************************
            // Shoes_header
            // **************************************************************************
            Padding(
              padding: const EdgeInsets.only(
                  left: 26.0, right: 16.0, top: 5.0, bottom: 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Landing Page',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignOutPressEvent());
                      },
                      child: Text('MORE',
                          style: themeData.textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Picturese(
                    shoepic:
                        'https://cdn.shopify.com/s/files/1/2236/7041/products/AirJordan4SECraftPhotonDust_2e07b16c-2734-4865-85ef-63d7937c2d77_1600x.jpg?v=1677252545',
                    name: 'Photon Dust',
                    brand: 'Air Jordan 4',
                  ),
                  Picturese(
                    shoepic:
                        'https://cdn.shopify.com/s/files/1/2236/7041/products/NikeDunkLowSEFleecePackHoneydew_W_1600x.jpg?v=1670277728',
                    name: 'Fleece Green',
                    brand: 'Nike Dunk',
                  ),
                  Picturese(
                    shoepic:
                        'https://cdn.shopify.com/s/files/1/2236/7041/products/AirJordan4SBPineGreen_2adc7184-fccf-49ba-a9cf-98f86c341aa7_1600x.jpg?v=1682344253',
                    name: 'Pine Green',
                    brand: 'Air Jordan 4',
                  ),
                  Picturese(
                    shoepic:
                        'https://cdn.shopify.com/s/files/1/2236/7041/products/AirJordan4BlankCanvas_W_1600x.jpg?v=1656164703',
                    name: 'Pine Green',
                    brand: 'Air Jordan 4',
                  ),
                ],
              ),
            ),

            // **************************************************************************
            // AutoRouteGenerator
            // **************************************************************************
            const SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 24, right: 24.0, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HypeNewz',
                            style: themeText.headline2!
                                .copyWith(fontSize: 25, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Nike Dunk Low',
                            style: themeText.headline1!
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 240,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://cdn.shopify.com/s/files/1/2236/7041/files/basics_mobile_1200x.jpg?v=1685829466')),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 240,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://cdn.shopify.com/s/files/1/2236/7041/files/AJ4_collection_mobile_Kopie_1200x.jpg?v=1676900673')),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            )
          ],
        ),
      ),
    );
  }
}

class Picturese extends StatelessWidget {
  final String shoepic;

  final String name;

  final String brand;

  const Picturese({
    Key? key,
    required this.shoepic,
    required this.name,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(const ShoesPageRoute());
            },
            child: Container(
              height: 100,
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(shoepic))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              brand,
              style: themeData.textTheme.bodyText1!.copyWith(fontSize: 10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Text(
              name,
              style: themeData.textTheme.bodyText1!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'ab 299,00 Eur',
              style: themeData.textTheme.bodyText1!.copyWith(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
