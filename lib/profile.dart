import 'package:flutter/material.dart';
import 'package:sitabung/beranda.dart';
import 'setprofil.dart';
import 'riwayattransaksi.dart';
import 'aduan.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // Rute pertama yang ditampilkan saat aplikasi dijalankan
      routes: {
        '/': (context) => ProfileCard(),  // Rute '/' akan menampilkan ProfileCard()
        '/setprofil': (context) => EditProfilePage(),  // Rute '/setprofil' akan menampilkan EditProfilePage()
        "/riwayattransaksi": (context) => TransactionHistory(),
        "/aduan": (context) => Aduan(),
        "/beranda": (context) => HomeScreen(),
        "/profile": (context) => ProfileCard(),
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 239, 239),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.9,
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(108, 192, 234, 1), Color.fromARGB(255, 57, 116, 193)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/orang1.jpg'),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vira Nur Zahra',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '2203001',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          'Kelas 7A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/setprofil");  // Navigasi ke '/setprofil' untuk halaman EditProfilePage()
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(screenWidth * 0.9, 60)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Color.fromRGBO(28, 31, 113, 1),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Edit Profil',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 128, 128, 128),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 128, 128, 128),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  TextButton(
                    onPressed: () {
                      // Tambahkan logika untuk Keamanan di sini
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(screenWidth * 0.9, 60)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.security,
                          color: Color.fromRGBO(28, 31, 113, 1),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Keamanan',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 128, 128, 128),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 128, 128, 128),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  TextButton(
                    onPressed: () {
                      // Tambahkan logika untuk Bahasa di sini
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(screenWidth * 0.9, 60)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Color.fromRGBO(28, 31, 113, 1),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Bahasa',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 128, 128, 128),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 128, 128, 128),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  TextButton(
                    onPressed: () {
                      // Tambahkan logika untuk Bantuan di sini
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                          side: BorderSide(color: Color.fromARGB(255, 233, 233, 233)),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(screenWidth * 0.9, 60)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help,
                          color: Color.fromRGBO(28, 31, 113, 1),
                        ),
                        SizedBox(width: 10), // Jarak antara ikon dan teks
                        Expanded(
                          child: Text(
                            'Bantuan',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 128, 128, 128),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 128, 128, 128),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(197, 216, 215, 215),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Menentukan ukuran border radius
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Apakah Anda yakin ingin keluar?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0, // Ubah ukuran teks menjadi 18
                              color: Color.fromARGB(255, 83, 76, 76), // Ubah warna teks menjadi hitam
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Tidak",
                              style: TextStyle(
                                color: Color.fromRGBO(28, 31, 113, 1), // Ubah warna teks menjadi biru
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Tambahkan logika logout di sini
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Ya",
                              style: TextStyle(
                                color: Colors.white, // Ubah warna teks menjadi putih
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(28, 31, 113, 1), // Ubah warna latar belakang menjadi biru
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: screenWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(28, 31, 113, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    print("Top Up clicked");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'data/icon_plus.png',
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        "Plus",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 98, 98),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Riwayat clicked");
                    Navigator.pushNamed(context, "/riwayattransaksi");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'data/icon_riwayat.png',
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        "Riwayat",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 98, 98),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Home clicked");
                    Navigator.pushNamed(context, "/beranda");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'data/icon_beranda.png',
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        "Beranda",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 98, 98),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("klik aduan");
                    Navigator.pushNamed(context, "/aduan");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'data/icon_aduan.png',
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        "Aduan",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 98, 98),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Profile clicked");
                    Navigator.pushNamed(context, "/profile");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/orang1.jpg'),
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 98, 98),
                        ),
                      ),
                    ],
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
