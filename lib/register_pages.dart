import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: const Color.fromARGB(255, 250, 198, 28),
        centerTitle: true, // Menempatkan teks di tengah AppBar
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add, size: 100, color: const Color.fromARGB(255, 250, 193, 37)),
            SizedBox(height: 20),

            // Kolom nama
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Kolom email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Kolom password
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Sembunyikan input password
            ),
            SizedBox(height: 20),

            // Tombol Daftar
            ElevatedButton(
              onPressed: () {
                // Logika pendaftaran bisa dimasukkan di sini
              },
              child: Text('Daftar'),
            ),

            // Tombol kembali ke login
            TextButton(
              onPressed: () {
                // Kembali ke halaman login
                Navigator.pop(context);
              },
              child: Text('Sudah punya akun? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
