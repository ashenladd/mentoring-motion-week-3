import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: WidgetMenu(),
    );
  }
}

class WidgetMenu extends StatefulWidget {
  const WidgetMenu({super.key});

  @override
  State<WidgetMenu> createState() => _WidgetMenuState();
}

class _WidgetMenuState extends State<WidgetMenu> {
  int _selectedIndex = 0;
  final List<Widget> _page = [
    const HomeHome(),
    const ProfilePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.disc_full,
            ),
            label: "Coba",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Profil Saya'),
        backgroundColor: const Color(0xffA79EFF),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xffFFFFFF),
                width: 358,
                height: 66,
                child: Row(
                  children: [
                    const Text('Widget 1'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Abdul Azis Al Ayubbi'),
                        Row(
                          children: const [
                            Icon(Icons.location_on),
                            Text(
                              'JL DURI SELATAN IB',
                            ),
                          ],
                        ),
                      ],
                    ), //WIDGET KE 2
                    const Icon(Icons.logout),
                  ],
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              const Text('Menu'),
              const SizedBox(height: 14),
              Container(
                  width: 358,
                  height: 45,
                  color: const Color(0xffFFFFFF),
                  child: Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(Icons.email),
                      SizedBox(width: 12),
                      Text("Undang Teman"),
                    ],
                  )),
              const SizedBox(
                height: 21,
              ),
              Container(
                  width: 358,
                  height: 45,
                  color: const Color(0xffFFFFFF),
                  child: Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(Icons.location_on),
                      SizedBox(width: 12),
                      Text("Ubah alamat"),
                    ],
                  )),
              const SizedBox(
                height: 21,
              ),
              Container(
                  width: 358,
                  height: 45,
                  color: const Color(0xffFFFFFF),
                  child: Row(
                    children: const [
                      SizedBox(width: 12),
                      Icon(Icons.settings),
                      SizedBox(width: 12),
                      Text("Pengaturan Akun"),
                    ],
                  )),
              const SizedBox(
                height: 115,
              ),
              SizedBox(
                width: 358,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA79EFF),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout),
                      Text(
                        "Keluar",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Lottie.asset('assets/lottie/internet_connection.json')),
    );
  }
}

class HomeHome extends StatefulWidget {
  const HomeHome({super.key});

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  String x = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Lottie.asset('assets/lottie/internet_connection.json'),
        ElevatedButton(
            onPressed: () {
              Get.to(() => SecondPage(), arguments: 'Yo From Home')
                  ?.then((value) => setState(() {
                        x = value;
                      }));
            },
            child: const Text("BUTTTTTOON")),
        Text(x.toString().isEmpty ? "Empty" : x)
      ]),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String arg = Get.arguments;
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [Icon(Icons.shopify_outlined)],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.back(result: "Yo From Floating Button");
        }),
        body: Column(
          children: [
            Center(child: Text(arg.isEmpty ? "Empty" : arg)),
            ElevatedButton(
                onPressed: () {
                  Get.back(result: "Yo From Middle Button");
                },
                child: const Text("BACK TO HOME"))
          ],
        ));
  }
}
