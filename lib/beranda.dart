import 'package:flutter/material.dart';
import 'riwayattransaksi.dart';
import 'aduan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        "/riwayattransaksi": (context) => TransactionHistory(),
        "/aduan": (context) => Aduan(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isHidden = true;
  // ignore: unused_field
  int _selectedIndex = 0;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 234, 234), // Sesuaikan warna background dengan body
        // title: Text('Aplikasi Saya'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              // Icon profile (avatar)
              radius: 25,
              backgroundImage: AssetImage('data/logo_sitabung1.png'), // Ubah dengan path gambar foto Anda
            ),
            onPressed: () {
              // Aksi saat avatar diklik
            },
          ),
        ],
      ),

      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tampilan teks bagian atas
              Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "VIRA NUR ZAHRA",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Memberikan jarak

              // Tampilan pencarian
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Color.fromARGB(255, 174, 174, 174)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.search, color: Colors.blue),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromARGB(174, 10, 132, 233),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),

              // Tampilan angka rupiah
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue[200]!, Colors.blue[800]!],
                  ),
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('data/logo_sitabung1.png'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          children: [
                            TextSpan(text: 'Rp. '),
                            _isHidden
                                ? TextSpan(text: '*******')
                                : TextSpan(text: '500.000'),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _toggleVisibility();
                      },
                      icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility, color: Colors.white,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Tampilan kotak persegi
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 10),
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.all(800),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(width: 10),
                  ],
                ),
              ),

              // Tampilan kotak persegi panjang dengan foto di dalamnya dan dapat discroll ke bawah
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 20), // Tambahkan padding di bagian atas ListView
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 13, horizontal: 20), // Tambahkan margin kanan dan kiri
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'data/sm.jpg', // Ubah dengan path gambar sesuai kebutuhan
                            fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 171, 169, 169).withOpacity(0.5), // Warna shadow
              spreadRadius: 5, // Jarak shadow
              blurRadius: 7, // Tingkat kabur shadow
              offset: Offset(0, 3), // Offset shadow
            ),
          ],
        ),
        child: BottomAppBar(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    print("Icon plus di klik");
                  },
                  child: Image.asset(
                    'data/icon_plus.png',
                    width: 50, 
                    height: 50, 
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("riwayat di klik");
                    Navigator.pushNamed(context, "/riwayattransaksi");
                  },
                  child: Image.asset(
                    'data/icon_riwayat.png', // Ganti dengan path gambar ikon riwayat
                    width: 50, // Atur lebar ikon
                    height: 50, // Atur tinggi ikon
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Aksi saat ikon beranda diklik
                  },
                  child: Image.asset(
                    'data/icon_beranda.png', // Ganti dengan path gambar ikon beranda
                    width: 50, // Atur lebar ikon
                    height: 50, // Atur tinggi ikon
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("aduan di klik");
                    Navigator.pushNamed(context, "/aduan");
                  },
                  child: Image.asset(
                    'data/icon_aduan.png', // Ganti dengan path gambar ikon aduan
                    width: 50, // Atur lebar ikon
                    height: 50, // Atur tinggi ikon
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Aksi saat foto profile (avatar) diklik
                  },
                  child: CircleAvatar(
                    // Icon profile (avatar)
                    radius: 20,
                    backgroundImage: AssetImage('data/logo_sitabung1.png'), // Ubah dengan path gambar foto Anda
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
