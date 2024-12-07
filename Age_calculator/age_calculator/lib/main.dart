import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age Calculator',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String myAge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KALKULATOR UNTUK MENGHITUNG UMUR MU ^-^"),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).primaryColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wp.jpeg'), // Add your wallpaper image
            fit: BoxFit.cover, // This will make the image cover the whole screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Berapa umur mu sekarang ^.^ ??',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                myAge,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () => pickDob(context),
                child: const Text('Tuliskan Tahun, bulan, dan tanggal lahir mu!!'),
              )
            ],
          ),
        ),
      ),
    );
  }

  pickDob(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    setState(() {
      myAge = '$years years, $months months, and $days days';
    });
  }
}
