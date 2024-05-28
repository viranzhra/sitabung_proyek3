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
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFE2D7D7), // Mengatur warna latar belakang
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTransactionButton('UANG MASUK', Icons.arrow_downward),
                    _buildTransactionButton('UANG KELUAR', Icons.arrow_upward),
                  ],
                ),
                SizedBox(height: 20),
                _buildTransactionColumn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionButton(String text, IconData icon) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.blue[200]!, Colors.blue[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionColumn() {
    return Column(
      children: [
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
        _buildTransactionItem(''),
      ],
    );
  }

  Widget _buildTransactionItem(String text) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white),
      ),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Text(text),
    );
  }
}
