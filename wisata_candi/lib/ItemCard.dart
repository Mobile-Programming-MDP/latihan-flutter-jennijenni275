import 'package:flutter/material.dart';
import 'package:wisata_candi/candi.dart';
import 'package:wisata_candi/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //TODO 1: deklarasi variabel
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    //TODO 6: implementasi routing ke detail screen 

    //TODO 2:....
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> DetailScreen(candi: candi),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(4), //jarak
        elevation: 1, //efek bayangan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO 3: ImageWidget
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //TODO 4: Text
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                candi.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            //TODO 5: Text
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                candi.type,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
       ),
      ),
    );
}
}