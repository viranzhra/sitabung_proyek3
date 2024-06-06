import 'package:flutter/material.dart';
import 'setprofil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileCard(),
      routes: {
        "/setprofil": (context) => EditProfilePage(),
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
                    // Widget lainnya
                  ),
                  Container(
                    // Widget lainnya
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/setprofil");
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
      )
    )
    );
  }
}
