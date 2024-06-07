import 'dart:io';
import 'package:flutter/material.dart';
import 'package:habituall/pages/inicial.page.dart';
import 'package:habituall/pages/login.page.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  File? _image;
  String _selectedSexo = 'Masculino';

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        // ignore: avoid_print
        print('Nenhuma imagem selecionada.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const LoginPage()),
                  ),
                );
              },
              icon: const Icon(
                Icons.keyboard_backspace_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          title: const Text(
            'Efetue seu cadastro.',
            style: TextStyle(fontFamily: 'america',color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/backgroungcadastropage.gif'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: GestureDetector(
                    onTap: _getImage,
                    child: _image == null
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              color:  Colors.white,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.photo_filter_rounded,
                                size: 40,
                              ),
                            ),
                          )
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                    width: 270,
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text('Nome'),
                        ),
                      ),
                    )),
                SizedBox(
                    width: 270,
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                      child: TextField(
                        controller: _date,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          icon: Icon(Icons.calendar_today_outlined),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text('Data de Nascimento'),
                        ),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2100));

                          if (pickeddate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat('dd-MM-yyyy').format(pickeddate);
                            });
                          }
                        },
                      ),
                    )),
                SizedBox(
                  width: 270,
                  height: 65,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: _selectedSexo,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedSexo = newValue
                              .toString(); // Converte para string, se necessário
                        });
                      },
                      items: ['Masculino', 'Feminino', 'Outro']
                          .map((sexo) => DropdownMenuItem(
                                value: sexo,
                                child: Text(sexo),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                    width: 270,
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                      child: TextField(
                        controller: _weightController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            label: Text('Peso')),
                      ),
                    )),
                SizedBox(
                    width: 270,
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                      child: TextField(
                        controller: _heightController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            label: Text('Altura')),
                      ),
                    )),
                SizedBox(
                    width: 270,
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Email"),
                        ),
                      ),
                    )),
                SizedBox(
                    width: 270,
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Senha"),
                        ),
                      ),
                    )),
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

                          prefs.setString('name', _nameController.text);
                          prefs.setString('weight', _weightController.text);
                          prefs.setString('height', _heightController.text);
                          prefs.setString('email', _emailController.text);
                          prefs.setString('password', _passwordController.text);

                          if (_nameController.text != "" &&
                              _weightController.text != "" &&
                              _heightController.text != "" &&
                              _emailController.text != "" &&
                              _passwordController.text != "") {
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InicialPage(),
                              ),
                            );
                          }

                          // ignore: empty_catches
                        } catch (e) {}
                      },
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(
                              Colors.white)),
                      child: const Text('Cadastrar',style:TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
