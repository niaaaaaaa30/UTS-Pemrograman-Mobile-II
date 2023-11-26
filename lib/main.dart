import 'package:flutter/material.dart';
import 'dart:async';
import 'input_data_page.dart'; // Import file input_data_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage()), // Ganti dengan LoginPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 150),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
        SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implementasi logika autentikasi di sini
            // Contoh: Navigasi ke HomePage jika login berhasil
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text('Login'),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {
            // Navigasi ke halaman pendaftaran ketika tombol ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
          child: Text('Belum punya akun? Daftar di sini'),
        ),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Halaman Utama'),
            onTap: () {
              Navigator.pop(context);
              if (!(Navigator.of(context).canPop())) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
            },
          ),
          ListTile(
            title: Text('Halaman Input Data Mahasiswa'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          ),
          ListTile(
            title: Text('List Informasi Mahasiswa'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListInformasiPage()),
              );
            },
          ),
          ListTile(
            title: Text('Tentang Aplikasi'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Nama'),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implementasi logika pendaftaran di sini
          },
          child: Text('Daftar'),
        ),
      ],
    );
  }
}

class ListInformasiPage extends StatelessWidget {
  final List<String> informasiList = [
    'Heru Gunawan NPM: 21552011458 Jurusan: Teknik Informatika',
    'Nia Damayanti NPM: 21552011447 Jurusan: Teknik Informatika',
    'Salsabila Nursafitri NPM: 21552011449 Jurusan: Teknik Informatika',
    'Soni Nursafitri NPM: 21552011431 Jurusan: Teknik Informatika',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Informasi'),
      ),
      body: ListView.builder(
        itemCount: informasiList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(informasiList[index]),
            onTap: () {
              // Implementasi aksi atau navigasi ke halaman detail informasi
            },
          );
        },
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UTS Pemrograman Mobile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Aplikasi Kemahasiswaan STTBandung',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi STTBandung:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'CopyRight By Kelompok 6',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Heru Gunawan_21552011458',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nia Damayanti_21552011447',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Salsabila Nursafitri_21552011449',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Soni Hendrayanti_21552011431',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STTBandung'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aplikasi Kemahasiswaan STTBandung',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman input data ketika tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputDataPage()),
                );
              },
              child: Text('Buka Halaman Input Data'),
            ),
          ],
        ),
      ),
    );
  }
}
