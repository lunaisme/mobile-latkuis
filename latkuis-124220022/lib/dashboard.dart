import 'package:belajar_kuis/main.dart';
import 'package:belajar_kuis/vehicle-data.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.nama});
  final String nama; // Menentukan tipe data untuk nama

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat datang " + nama),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10, // Jarak horizontal antar card
            mainAxisSpacing: 10, // Jarak vertikal antar card
          ),
          itemCount: vehicleList.length,
          itemBuilder: (context, index) {
            final Vehicle = vehicleList[index];
            return Card(
              child: Column(
                children: [
                  Image.network(Vehicle.imageUrls[0]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text(Vehicle.name), Text(Vehicle.type)],
                  ),
                  SizedBox(height: 10),
                  Text(Vehicle.description),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Menggunakan pushReplacement untuk mengganti halaman
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        child: Icon(Icons.logout),
        tooltip: 'Logout',
      ),
    );
  }
}
