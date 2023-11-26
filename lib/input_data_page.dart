// input_data_page.dart

import 'package:flutter/material.dart';

class InputDataPage extends StatefulWidget {
  @override
  _InputDataPageState createState() => _InputDataPageState();
}

class _InputDataPageState extends State<InputDataPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Informasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nomorController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika penyimpanan data di sini
                String nama = _namaController.text;
                String email = _emailController.text;
                String nomor = _nomorController.text;

                // Lakukan sesuatu dengan data yang telah diambil
                // Misalnya, simpan ke database atau tampilkan pesan sukses
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Data Disimpan'),
                      content: Text('Data berhasil disimpan!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Simpan Data'),
            ),
          ],
        ),
      ),
    );
  }
}
