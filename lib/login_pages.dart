import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_application_3/home_page.dart';
import 'register_pages.dart';
import 'models/user.dart'; 

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaLengkapController= TextEditingController();


 void login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    bool loginSuccess = false;

    
    for (var data in registeredUsers) {
      if (data.email == email && data.password == password) {
        loginSuccess = true;
        break; 
      }
    }

    if (loginSuccess) {
      Navigator.pushNamed(context, '/Home'); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email atau Password salah!'))
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 250, 198, 28),
        centerTitle: true,
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100, color: const Color.fromARGB(255, 250, 193, 37)),
              SizedBox(height: 20),
              
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Mohon Isi Email'),
                  EmailValidator(errorText: 'Isi Email dengan Valid'),
                ]),
              ),
              SizedBox(height: 20),
              
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, 
                validator: RequiredValidator(errorText: 'Mohon Isi Password'),
              ),
              SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    login(context);
                  }
                },
                child: Text('Login'),
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Register');
                },
                child: Text('Belum Punya akun? Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
