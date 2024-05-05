import 'package:flutter/material.dart';
import 'dashboard.dart';

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
        "/dashboard": (context) => DashboardPage(),
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
  String _emailErrorText = ''; // Variabel untuk menampung pesan kesalahan input email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 228, 237, 244),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 91, 156, 202),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/logonew.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 91, 156, 202),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukkan username anda",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        suffixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 91, 156, 202), // warna ikon
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 91, 156, 202),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Masukkan email anda',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        suffixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 91, 156, 202), // warna ikon
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 91, 156, 202),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      obscureText: _isObscure,
                      maxLength: 8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukkan password anda",
                        helperText: "Maksimal hanya 8 karakter saja",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                              color: Color.fromARGB(255, 91, 156, 202), // warna ikon

                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
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
                    // Jika email valid, lanjutkan ke halaman dashboard
                    Navigator.pushNamed(context, "/dashboard");
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                  backgroundColor: Color.fromARGB(255, 91, 156, 202),
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
    );
  }
}
