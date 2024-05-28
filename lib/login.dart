import 'package:flutter/material.dart';
import 'beranda.dart';

void main() {
  runApp(BelajarFlutter());
}

class BelajarFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghapus tulisan debug
      home: LoginScreen(),
      routes: {
        "/beranda": (context) => MyApp(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true; // Variabel untuk mengontrol visibilitas teks
  TextEditingController _emailController = TextEditingController(); // Controller untuk mengelola nilai input email
  TextEditingController _passwordController = TextEditingController(); // Controller untuk mengelola nilai input password
  String _emailErrorText = ''; // Variabel untuk menampung pesan kesalahan input email

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  // Mendapatkan ukuran layar perangkat
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(28, 31, 113, 1),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/logonew.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Warna shadow
                            spreadRadius: 1, // Jarak shadow
                            blurRadius: 6, // Tingkat kabur shadow
                            offset: Offset(0, 3), // Offset shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.20)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Masukkan username anda",
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.black, // warna ikon
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Warna shadow
                            spreadRadius: 1, // Jarak shadow
                            blurRadius: 6, // Tingkat kabur shadow
                            offset: Offset(0, 3), // Offset shadow
                          ),
                        ],
                      ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black.withOpacity(0.10)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Masukkan email anda',
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.black, // warna ikon
                        ),
                        errorText: _emailErrorText.isNotEmpty ? _emailErrorText : null, // Tampilkan pesan kesalahan jika ada
                      ),
                      onChanged: (value) {
                        // Bersihkan pesan kesalahan saat input email berubah
                        setState(() {
                          _emailErrorText = '';
                        });
                      },
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Warna shadow
                            spreadRadius: 1, // Jarak shadow
                            blurRadius: 6, // Tingkat kabur shadow
                            offset: Offset(0, 6), // Offset shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        maxLength: 8,
                        buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
                          return null; // Menghilangkan counter otomatis
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.10)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Masukkan password anda",
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility_off : Icons.visibility,
                            ),
                            color: Colors.black, // warna ikon
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 10), // Memberikan jarak antara input dan teks jumlah karakter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maksimal hanya 8 karakter saja",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${_passwordController.text.length}/8", // Teks jumlah karakter yang diinginkan
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validasi email
                  if (_emailController.text.isEmpty) {
                    // Jika email kosong, tampilkan pesan kesalahan
                    setState(() {
                      _emailErrorText = 'Email tidak boleh kosong';
                    });
                  } else if (!_emailController.text.contains('@')) {
                    // Jika email tidak valid, tampilkan pesan kesalahan
                    setState(() {
                      _emailErrorText = 'Email tidak valid';
                    });
                  } else {
                    // Jika email valid, lanjutkan ke halaman beranda
                    Navigator.pushNamed(context, "/beranda");
                  }
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 243, 243, 243),
                    letterSpacing: 4,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  minimumSize: Size(screenWidth * 1.5, 0), // Menetapkan lebar minimum sesuai dengan setengah dari lebar layar
                  backgroundColor: Color.fromRGBO(28, 31, 113, 1),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  // Tambahkan logika yang ingin Anda jalankan saat tautan diklik di sini
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Color(0xff0D0140),
                  ),
                ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}


