import 'package:flutter/material.dart';
import 'package:wisata_candi/Favorite_screen.dart';
import 'package:wisata_candi/SignInScreen.dart';
import 'package:wisata_candi/detail_screen.dart';
import 'package:wisata_candi/Home_screen.dart';
import 'package:wisata_candi/search_screen.dart';
import 'package:wisata_candi/profil_screen.dart';
import 'package:wisata_candi/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
      title: 'Wisata Candi',
      
      initialRoute: '/',
      routes: {
        '/homescreen' : (context)=> HomeScreen(),
        '/signin' : (context) =>  SignInScreen(),
        '/signup' : (context) => Signupscreen(),
      },
      // Uncomment and adjust theme as needed
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     iconTheme: IconThemeData(color: Colors.deepPurple),
      //     titleTextStyle: TextStyle(
      //       color: Colors.deepPurple,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   colorScheme:
      //       ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
      //     primary: Colors.deepPurple,
      //     surface: Colors.deepPurple[50],
      //   ),
      //   useMaterial3: true,
      // ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO1: Deklarasi Variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO2:body
      body: _children[_currentIndex],

      //TODO3: BottomNavigationBar
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        //TODO4: Buat data dan child dari theme
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorit",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
     ),
);
}
}