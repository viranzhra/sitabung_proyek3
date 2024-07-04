import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'beranda.dart';

void main() {
  runApp(const BelajarFlutter());
}

class BelajarFlutter extends StatelessWidget {
  const BelajarFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: LoginScreen(),
        ),
      ),
      routes: {
        "/beranda": (context) => MyApp(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _usernameErrorText = '';
  final String _passwordErrorText = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String> login(String username, String password) async {
    String url = 'http://192.168.0.9/api_sitabung/login.php';
    final response = await http.post(Uri.parse(url), body: {
      "username": username,
      "password": password,
    });

    if (response.statusCode == 200) {
      var data = response.body.trim();  // Ensure no extra spaces or newlines
      return data;
    } else {
      return 'error';
    }
  }

  void showAlertDialog(BuildContext context, String title, String content, {Function? onOkPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onOkPressed != null) {
                  onOkPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }

  InputDecoration _inputDecoration({required String hintText, Widget? suffixIcon, String? errorText}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.20)),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      suffixIcon: suffixIcon,
      errorText: errorText,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(28, 31, 113, 1),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logonew.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _usernameController,
                          decoration: _inputDecoration(
                            hintText: "Masukkan username anda",
                            suffixIcon: const Icon(Icons.person, color: Colors.black),
                            errorText: _usernameErrorText.isNotEmpty ? _usernameErrorText : null,
                          ),
                          onChanged: (value) {
                            if (_usernameErrorText.isNotEmpty) {
                              setState(() {
                                _usernameErrorText = '';
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _isObscure,
                          maxLength: 8,
                          buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
                            return null;
                          },
                          decoration: _inputDecoration(
                            hintText: "Masukkan password anda",
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            errorText: _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
                          ),
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
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
                            "${_passwordController.text.length}/8",
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    String result = await login(_usernameController.text, _passwordController.text);
                    setState(() {
                      _isLoading = false;
                    });
                    if (result == "success") {
                      // ignore: use_build_context_synchronously
                      showAlertDialog(context, "Login Successful", "You have successfully logged in", onOkPressed: () {
                        Navigator.pushNamed(context, "/beranda");
                      });
                    } else {
                      // ignore: use_build_context_synchronously
                      showAlertDialog(context, "Login Failed", "Username atau password salah");
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 243, 243),
                            letterSpacing: 4,
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: Size(screenWidth * 1.5, 0),
                    backgroundColor: const Color.fromRGBO(28, 31, 113, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    // Tambahkan logika yang ingin Anda jalankan saat tautan diklik di sini
                  },
                  child: const Text(
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