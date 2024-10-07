import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 250, 198, 28),
        centerTitle: true, // Menempatkan teks di tengah AppBar
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: const Color.fromARGB(255, 250, 193, 37)),
            SizedBox(height: 20),

            // Kolom email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            // Kolom password
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Hide password input
            ),

            // Tombol login
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika login bisa dimasukkan di sini
              },
              child: Text('Login'),
            ),

            // Tombol untuk registrasi
            TextButton(
              onPressed: () {
                // Pindah ke halaman register
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Belum Punya akun? Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
