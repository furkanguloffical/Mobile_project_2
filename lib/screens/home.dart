import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../bloc/client/client_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<Map<String, dynamic>> arabaModelleri = [
  {
    'resimUrl': 'https://example.com/araba1.jpg',
    'model': 'Tesla Model S',
    'gunlukFiyat': 200,
  },
  {
    'resimUrl': 'https://example.com/araba2.jpg',
    'model': 'BMW i8',
    'gunlukFiyat': 250,
  },
  {
    'resimUrl': 'https://example.com/araba3.jpg',
    'model': 'Audi Q7',
    'gunlukFiyat': 180,
  },
  // İstediğiniz kadar araba modeli ekleyebilirsiniz
];

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;
  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80,
          ),
          child: Column(
            children: [
              Container(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Menu",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkwellMenu(context, "Models", '/', Icon(Icons.car_repair)),
              InkwellMenu(context, "Favorites", 'client/favorite.dart',
                  Icon(Icons.favorite_border)),
              InkwellMenu(context, "Search ", '/', Icon(Icons.search)),
              InkwellMenu(
                  context, "My previous rentals", '/', Icon(Icons.history)),
              InkwellMenu(context, "Support ", '/',
                  Icon(Icons.contact_support_outlined)),
              InkwellMenu(context, "Contact ", '/', Icon(Icons.call)),
              InkwellMenu(context, "About Us", '/', Icon(Icons.person)),
              ElevatedButton(
                onPressed: () {
                  clientCubit.changeDarkMode(darkMode: true);
                },
                child: Text('DarkMode'),
              ),
              ElevatedButton(
                onPressed: () {
                  clientCubit.changeDarkMode(darkMode: false);
                },
                child: Text('LightMode'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Kiralama işlevini burada gerçekleştirin
                },
                child: Text('Language'),
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [],
                ),
              ),
              PostItem(
                  "https://www.bmw.com.tr/content/dam/bmw/common/all-models/m-series/m2-coupe/2022/Navigation/bmw-m-series-m2-coupe-lci-modelfinder.png",
                  "BMW",
                  80),
              PostItem(
                  "https://www.mercedes-benz.com.tr/content/dam/hq/passengercars/cars/cle/cle-coupe-c236-pi/modeloverview/06-2023/images/mercedes-benz-cle-coupe-c236-model-overview-696x392-06-2023.png",
                  "Mercedes",
                  100),
              PostItem(
                  "https://imgd-ct.aeplcdn.com/664x415/n/cw/ec/108981/mc20-right-front-three-quarter.jpeg?isig=0&q=80",
                  "Maserati",
                  150),
              PostItem(
                  "https://istanbul.bentleymotors.com/picserver1/userdata/1/31595/3FAdVwEMPE/dws%20600x300%20king%20fisher%20flying%20spur%20mulliner.png",
                  "Bentley",
                  200),
              PostItem(
                  "https://www.motortrend.com/uploads/sites/10/2019/09/2020-ford-mustang-fastback-ecoboost-coupe-angular-front.png",
                  "Mustang",
                  150),
              PostItem(
                  "https://cdn.wheel-size.com/automobile/body/porsche-taycan-2020-2024-1688721548.2062147.jpg",
                  "Porsche",
                  150),
              PostItem(
                  "https://www.bmw.com.tr/content/dam/bmw/common/all-models/m-series/m2-coupe/2022/Navigation/bmw-m-series-m2-coupe-lci-modelfinder.png",
                  "BMW",
                  80),
              PostItem(
                  "https://www.mercedes-benz.com.tr/content/dam/hq/passengercars/cars/cle/cle-coupe-c236-pi/modeloverview/06-2023/images/mercedes-benz-cle-coupe-c236-model-overview-696x392-06-2023.png",
                  "Mercedes",
                  100),
              PostItem(
                  "https://imgd-ct.aeplcdn.com/664x415/n/cw/ec/108981/mc20-right-front-three-quarter.jpeg?isig=0&q=80",
                  "Maserati",
                  150),
              PostItem(
                  "https://istanbul.bentleymotors.com/picserver1/userdata/1/31595/3FAdVwEMPE/dws%20600x300%20king%20fisher%20flying%20spur%20mulliner.png",
                  "Bentley",
                  200),
              PostItem(
                  "https://www.motortrend.com/uploads/sites/10/2019/09/2020-ford-mustang-fastback-ecoboost-coupe-angular-front.png",
                  "Mustang",
                  150),
            ]),
          ),
        )),
      ]),
    );
  }

  InkWell InkwellMenu(
      BuildContext context, String name, String route, Icon icon) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            SizedBox(width: 10),
            Text(name),
          ],
        ),
      ),
    );
  }
}

Container PostItem(String post, String model, int price) => Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(children: [
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(post),
          ),
          Gap(10),
          Text(
            'Model: ${model}\nDaily Price: ${price}\$',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Kiralama işlevini burada gerçekleştirin
                },
                child: Text('Rent'),
              ),
              Gap(20),
              Icon(Icons.favorite_border)
            ],
          ),

          SizedBox(height: 20), // Boşluk ekleyin

          // Araba Modeli ve Günlük Fiyatı
        ]),
      ),
    );
