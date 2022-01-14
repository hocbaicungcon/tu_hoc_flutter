import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CuTo());
}

class ATM {
  int soDuTaiKhoan = 50;
  void rutTien(int soTien) {
    soDuTaiKhoan += soTien;
  }
}

class CuTo extends StatelessWidget {
  const CuTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ATM>(
        create: (context) => ATM(),
        child: MaterialApp(
          title: 'CỤ TỔ Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const OngNoi(),
        ));
  }
}

class OngNoi extends StatefulWidget {
  const OngNoi({Key? key}) : super(key: key);

  @override
  State<OngNoi> createState() => _OngNoiState();
}

class _OngNoiState extends State<OngNoi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ÔNG NỘI'),
        ),
        body: const BoDuong());
  }
}

class BoDuong extends StatelessWidget {
  const BoDuong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SugarBaby();
  }
}

class SugarBaby extends StatelessWidget {
  const SugarBaby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ATM>(
        builder: (context, atm, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Em là SugarBaby được bao: ${atm.soDuTaiKhoan}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: const Text('Vòi Tiền'),
              onPressed: () {
                atm.rutTien(100000);
              },
            ),
          ],
        ),
      ),
    );
  }
}
