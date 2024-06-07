// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habituall/pages/cadastro.page.dart';
import 'package:habituall/pages/inicial.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  var showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  height: 100,
                  child: Image.asset('images/loginlogo.png')),
              SizedBox(
                  width: 400,
                  height: 100,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'E-mail'),
                    ),
                  )),
              SizedBox(
                width: 400,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                  child: TextField(
                    controller: _senhaController,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(showPassword
                                ? Icons.lock_open_rounded
                                : Icons.lock_outline),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            }),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor:Colors.white,
                        hintText: 'Senha'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          String email = prefs.getString('email')!;
                          String password = prefs.getString('password')!;

                          bool emailCorreto = _emailController.text == email;
                          bool senhaCorreta = _senhaController.text == password;

                          if (emailCorreto && senhaCorreta) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InicialPage(),
                              ),
                            );
                          }
                        } catch (e) {}
                      },
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(
                              Color.fromARGB(240, 238, 207, 161))),
                      child: const Text('Entrar',style: TextStyle(color: Colors.black),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroPage(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(
                              Color.fromARGB(240, 238, 207, 161))),
                      child: const Text('Criar Conta',style: TextStyle(color: Colors.black),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
