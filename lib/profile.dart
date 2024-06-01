import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 239, 239),
        body: ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar perangkat
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return Center(
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
                    backgroundImage: AssetImage('assets/images/orang1.jpg'), // Ganti dengan path foto profil
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VIRA NUR ZAHRA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '1234567890',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'XII IPA 1',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenWidth * 0.4,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromRGBO(147, 214, 246, 1), Color.fromARGB(255, 40, 129, 193)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromRGBO(29, 120, 163, 1), Color.fromARGB(255, 185, 214, 251)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: 40.0,
                        height: 40.0,
                        child: Center(
                          child: Image.asset(
                            'assets/images/panah_atas.png', // Ganti dengan path gambar panah ke atas
                            width: 24, // Sesuaikan ukuran gambar
                            height: 24,
                            color: Colors.white, // Sesuaikan warna gambar jika perlu
                          ),
                        ),
                      ),
                      Positioned(
                        left: 60.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Uang Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'Rp. 300.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.4,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromRGBO(126, 204, 240, 1), Color.fromARGB(255, 57, 116, 193)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromRGBO(29, 120, 163, 1), Color.fromARGB(255, 185, 214, 251)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: 40.0,
                        height: 40.0,
                        child: Center(
                          child: Image.asset(
                            'assets/images/panah_bawah.png', // Ganti dengan path gambar panah ke atas
                            width: 24, // Sesuaikan ukuran gambar
                            height: 24,
                            color: Colors.white, // Sesuaikan warna gambar jika perlu
                          ),
                        ),
                      ),
                      Positioned(
                        left: 60.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Uang Keluar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'Rp. 200.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Tambahkan logika untuk Edit Profil di sini
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
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
                      SizedBox(width: 10), // Jarak antara ikon dan teks
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
                      SizedBox(width: 10), // Jarak antara ikon dan teks
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
                      SizedBox(width: 10), // Jarak antara ikon dan teks
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
      )
    );
  }
}
