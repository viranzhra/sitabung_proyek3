import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {
      'name': 'Bahasa Indonesia',
      'action': () => print('Bahasa Indonesia selected')
    },
    {'name': 'English', 'action': () => print('English selected')},
    {'name': 'Español', 'action': () => print('Español selected')},
    // Add more languages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Bahasa',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: languages.map((language) {
            int index = languages.indexOf(language);
            BorderRadius borderRadius;

            if (index == 0) {
              borderRadius = BorderRadius.vertical(
                top: Radius.circular(8),
              );
            } else if (index == languages.length - 1) {
              borderRadius = BorderRadius.vertical(
                bottom: Radius.circular(8),
              );
            } else {
              borderRadius = BorderRadius.zero;
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                    side: BorderSide(color: Colors.white), // Add white border
                  ),
                ),
                onPressed: language['action'],
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    language['name'],
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
