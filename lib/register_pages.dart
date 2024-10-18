import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'models/user.dart'; // Import the User model

// Variable global untuk menyimpan data pengguna
List<User> registeredUsers = [];

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: const Color.fromARGB(255, 253, 211, 22),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 80),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Nama Lengkap', border: OutlineInputBorder()),
                  validator: RequiredValidator(errorText: 'Mohon Isi Nama Lengkap').call,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Mohon Isi Email'),
                    EmailValidator(errorText: 'Email Tidak Valid'),
                  ]).call,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Mohon Isi Password'),
                    MinLengthValidator(6, errorText: 'Password Harus Di-isi Minimal 6 Karakter'),
                  ]).call,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _konfirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Konfirmasi Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Password Tidak Sama!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save user data to the registeredUsers list
                      registeredUsers.add(User(
                        namaLengkap: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registrasi Sukses!')),
                      );

                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: const Text("Register"),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Sudah Punya Akun?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
