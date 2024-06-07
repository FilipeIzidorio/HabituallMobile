import 'package:flutter/material.dart';
import 'package:habituall/pages/edit_profile.page.dart';
import 'package:habituall/pages/inicial.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  var showPassword = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage('images/user.png'),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromARGB(240, 238, 207, 161),
                        label: Text("Nome"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: _weightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromARGB(240, 238, 207, 161),
                        label: Text("Peso"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      controller: _heightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromARGB(240, 238, 207, 161),
                        label: Text("Altura"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      obscureText: true,
                      controller: _passwordController,
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
                          fillColor: const Color.fromARGB(240, 238, 207, 161),
                          label: const Text("Senha")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
