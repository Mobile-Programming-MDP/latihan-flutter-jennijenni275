import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obsurePassword = true;

  //TODO 1: Fungsi Sign Up
  void signUp() {
    String name = _namaController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (password.length < 8 ||
        password.contains(RegExp(r'[A-Z]')) ||
        password.contains(RegExp(r'[a-z]')) ||
        password.contains(RegExp(r'[0-9]')) ||
        password.contains(RegExp(r'[@#!\\\$%^&*_-()<>?":{}|<>]'))) {
      setState(() {
        _errorText =
            'Minimal 8 karakter, kombinasi [A-Z], [a-z], [0-9], [@#!\\\$%^&*_-()<>?":{}|<>]';
      });return;
        }
        else 
      setState(() {
        _errorText = ""; // Tidak ada error
      });

    print("Sign Up Berhasil^^");
    print('Nama : $name');
    print('Nama Pengguna : $username');
    print('Kata Sandi : $password');
  }

  //TODO 2: Fungsi bispose
@override
  void dispose() {
    // TODO: implement dispose
    _namaController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                    labelText: "Nama", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: "Nama Pengguna", border: OutlineInputBorder()),
              ),
               SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration:  InputDecoration(
                    labelText: "Kata Sandi", 
                    errorText: _errorText.isNotEmpty ? _errorText: null,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _obsurePassword =!_obsurePassword;
                      });
                    }, icon: Icon(_obsurePassword
                    ? Icons.visibility_off:
                    Icons.visibility),)
                    ),
                obscureText: _obsurePassword,
              ),
               SizedBox(height: 20),
              ElevatedButton(onPressed: () {}
              , child: const Text("Sign Up")),
            ],
          ),
        ),
     ),
);
}
}