import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'beranda.dart';

void main() {
  runApp(BelajarFlutter());
}

class BelajarFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool _isObscure = true;
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _usernameErrorText = '';
  String _passwordErrorText = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String> login(String username, String password) async {
    String url = 'http://192.168.148.138/api_sitabung/login.php';
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
              child: Text("OK"),
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
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _usernameController,
                          decoration: _inputDecoration(
                            hintText: "Masukkan username anda",
                            suffixIcon: Icon(Icons.person, color: Colors.black),
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
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 6),
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
                      SizedBox(height: 10),
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
                SizedBox(height: 20),
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
                      showAlertDialog(context, "Login Successful", "You have successfully logged in", onOkPressed: () {
                        Navigator.pushNamed(context, "/beranda");
                      });
                    } else {
                      showAlertDialog(context, "Login Failed", "Username atau password salah");
                    }
                  },
                  child: _isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
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
                    minimumSize: Size(screenWidth * 1.5, 0),
                    backgroundColor: Color.fromRGBO(28, 31, 113, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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