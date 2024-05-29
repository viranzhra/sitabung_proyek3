import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  void _showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload Image'),
          content: Text('Choose an option to upload your image.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Action for uploading from gallery
                Navigator.of(context).pop();
              },
              child: Text('Gallery'),
            ),
            TextButton(
              onPressed: () {
                // Action for taking a photo
                Navigator.of(context).pop();
              },
              child: Text('Camera'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Action when back button is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Color.fromARGB(255, 220, 238, 247),
            child: Column(
              children: [
                Spacer(), // Spacer to push the content to the center
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showUploadDialog(context);
                  },
                  child: Text('Send File'),
                ),
                Spacer(), // Spacer to push the content to the center
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 100, // Adjust the width as needed
                      height: 40, // Adjust the height as needed
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue[300]!, Colors.blue[900]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          // Action for upload button
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Upload',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
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
