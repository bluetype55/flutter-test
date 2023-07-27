import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/pngwing.com.png'),
                backgroundColor: Colors.white,
              ),
              accountName: const Text('Jackson'),
              accountEmail: const Text('jackson@naver.com'),
              onDetailsPressed: () {
                print('arrow os clicked');
              },
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/sun-6751_256.gif'),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: const Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text('Setting'),
              onTap: () {
                print('Setting is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: const Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
