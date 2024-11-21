import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String actionLabel = 'Belum ada aksi'; // Variabel untuk menyimpan label aksi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interaction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container sebagai tombol
            GestureDetector(
              
              onTap: () 
              {
                setState(() {
                  actionLabel = 'Pengguna melakukan Tap';
                });
              },
              onDoubleTap: () {
                setState(() {
                  actionLabel = 'Pengguna melakukan Double Tap';
                });
              },
              onLongPress: () {
                setState(() {
                  actionLabel = 'Pengguna melakukan Long Press';
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Aksi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // Menambahkan SizedBox untuk memberi jarak
            SizedBox(height: 16),
            // Text untuk menampilkan label aksi
            Text(
              actionLabel,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
     ),
);
}
}