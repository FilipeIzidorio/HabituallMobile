import 'dart:io';
import 'package:flutter/material.dart';
import 'package:habituall/pages/inicial.page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // ignore: unused_field
  File? _image;

  late TextEditingController _nameController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

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
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _weightController.text = prefs.getString('weight') ?? '';
      _heightController.text = prefs.getString('height') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    });
  }

  Widget build(BuildContext context) {
    var showPassword = false;

    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          'Meu perfil',
          style: TextStyle(fontFamily: 'america', color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const InicialPage()),
                  ),
                );
              },
              icon: const Icon(
                Icons.keyboard_backspace_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _getImage,
                child: const Image(
                  image: AssetImage('images/user.png'),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _nameController,
                      enabled: true,
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Color.fromARGB(240, 238, 207, 161),
                          label: Text("Nome")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: true,
                      controller: _weightController,
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Color.fromARGB(240, 238, 207, 161),
                          label: Text("Peso")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: true,
                      controller: _heightController,
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Color.fromARGB(240, 238, 207, 161),
                          label: Text("Altura")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: true,
                      obscureText: !showPassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(showPassword
                                  // ignore: dead_code
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
                          fillColor: const Color.fromARGB(240, 238, 207, 161),
                          label: const Text("Senha")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Salvar")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
