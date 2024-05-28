import 'package:flutter/material.dart';
import 'beranda.dart';

void main() {
  runApp(Aduan());
}

class Aduan extends StatelessWidget {
  const Aduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            },
          ),
          title: Text(
            'ADUAN',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ), // Memberikan jarak antara AppBar dan Container
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Posisikan konten secara horizontal di tengah
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Posisikan konten secara vertikal di tengah
                  children: [
                    Icon(
                      Icons.school, // Icon sekolah
                      color: Colors.white, // Warna ikon putih
                      size: 60,
                    ),
                    SizedBox(
                      width: 10,
                    ), // Memberikan jarak antara ikon dan teks
                    Text(
                      'SEKOLAH',
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ), // Memberikan margin horizontal
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Menambahkan radius
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue[300]!,
                      Colors.blue[700]!
                    ], // Warna gradasi dari muda ke tua
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ), // Memberikan jarak antara dua Container
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Posisikan konten secara horizontal di tengah
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Posisikan konten secara vertikal di tengah
                  children: [
                    Icon(
                      Icons.account_balance_wallet, // Icon tabungan
                      color: Colors.white,
                      size: 60, // Warna ikon putih
                    ),
                    SizedBox(
                      width: 10,
                    ), // Memberikan jarak antara ikon dan teks
                    Text(
                      'TABUNGAN',
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ), // Memberikan margin horizontal
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Menambahkan radius
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue[300]!,
                      Colors.blue[700]!
                    ], // Warna gradasi dari muda ke tua
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
