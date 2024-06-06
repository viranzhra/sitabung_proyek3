import 'package:flutter/material.dart';
import 'riwayattransaksi.dart';
import 'dart:convert';
import 'aduan.dart';
import 'package:http/http.dart' as http;

import 'profile.dart';

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
        "/beranda": (context) => HomeScreen(),
        "/profile": (context) => ProfileCard(),
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
  String _nama = "Loading...";
  int _total = 0;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.148.138/api_sitabung/beranda.php'), // Sesuaikan dengan alamat API Anda
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': 'vira', 'password': 'password123'}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _nama = data['nama'];
          _total = data['total'];
          _errorMessage = '';
        });
      } else {
        setState(() {
          _errorMessage = 'Error: ${response.statusCode} ${response.reasonPhrase}';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Error: $error';
      });
    }
  }

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
        backgroundColor: Color.fromARGB(255, 234, 234, 234),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('data/abu.jpg'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _nama,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
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
                                : TextSpan(text: _total.toString()),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _toggleVisibility,
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 10),
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.all(10),
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
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 20),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
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
                            'data/sm.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
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