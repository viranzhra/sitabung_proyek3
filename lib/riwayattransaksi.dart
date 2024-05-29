import 'package:flutter/material.dart';
import 'beranda.dart';

void main() {
  runApp(TransactionHistory());
}

class TransactionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1C1F71),
          title: Text(
            'RIWAYAT TRANSAKSI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            },
          ),
        ),
        body: TransactionHistoryBody(),
      ),
    );
  }
}

class TransactionHistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTransactionCard(
              screenWidth,
              'Uang Masuk',
              'assets/images/panah_atas.png',
            ),
            _buildTransactionCard(
              screenWidth,
              'Uang Keluar',
              'assets/images/panah_bawah.png',
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      'Transaksi $index',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Rp. 25.000 $index'),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(
      double screenWidth, String title, String iconPath) {
    return Container(
      width: screenWidth * 0.4,
      height: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(147, 214, 246, 1),
            Color.fromARGB(255, 40, 129, 193),
          ],
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
                colors: [
                  Color.fromRGBO(29, 120, 163, 1),
                  Color.fromARGB(255, 185, 214, 251),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(180.0),
            ),
            width: 35.0,
            height: 35.0,
            child: Center(
              child: Image.asset(
                iconPath,
                width: 20,
                height: 20,
                color: Colors.white,
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
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Uncomment if you need to display the amount
                // Text(
                //   'Rp. 300.000',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 15,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String leftIconPath;
  final String iconPath;
  final String text;

  GradientButton({
    required this.onPressed,
    required this.leftIconPath,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6ED4FF), Color(0xFF1C1F71)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              leftIconPath,
              color: Colors.white,
              height: 24,
              width: 24,
            ),
            SizedBox(width: 8),
            Image.asset(
              iconPath,
              color: Colors.white,
              height: 24,
              width: 24,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
