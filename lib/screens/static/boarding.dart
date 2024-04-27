import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../core/storage.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PreloadPageView(
        preloadPagesCount: 3,
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
        children: [
          BoardingItem(
            img:
                "https://images.ctfassets.net/cypk3gnrfs78/4w9v0q1gxtkLQCt9OyMzVu/ed65d0e9928fda8e513d8797f24855a5/Car-Rental-Process-Illustration.jpg",
            description:
                "Experience Freedom: Your Ultimate Car Rental Journey Starts Here!",
          ),
          BoardingItem(
            img: "https://hpcnursing.com/images/blog/car-rental.jpg",
            description:
                "Your safety is our top priority: Reliable vehicles and peace of mind every journey.",
          ),
          BoardingItem(
            img:
                "https://img.freepik.com/premium-vector/online-ordering-taxi-car-rent-sharing-using-service-mobile-application_333239-96.jpg",
            description:
                "Enjoy the ease of renting a car with just a few taps!",
          ),
        ],
      )),
      bottomNavigationBar: Container(
        height: 70,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  Icon(page == 0
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 1
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(page == 2
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                ],
              ),
              Gap(40),
              InkWell(
                child: ElevatedButton(
                  onPressed: () async {
                    final storage = Storage();
                    await storage.firstLauched();
                    GoRouter.of(context).replace("/home");
                  },
                  child: Text(page == 2 ? "Finish" : "Skip"),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class BoardingItem extends StatelessWidget {
  final String img;
  final String description;

  const BoardingItem({
    super.key,
    required this.img,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(img),
            Padding(
              padding: const EdgeInsets.all(58.0),
              child: Text(
                description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
