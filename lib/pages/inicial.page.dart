import 'package:flutter/material.dart';
import 'package:habituall/pages/login.page.dart';
import 'package:habituall/pages/profile.page.dart';
import 'package:habituall/pages/compromissos.page.dart';
import 'package:habituall/pages/dieta.page.dart';
import 'package:habituall/pages/exercicios.page.dart';
import 'package:habituall/pages/imc.page.dart';
import 'package:habituall/pages/ingestao_agua.page.dart';
import 'package:habituall/pages/metas.page.dart';
import 'package:habituall/pages/saude_mental.page.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});

  @override
  State<InicialPage> createState() => _InicialPageState();
}

late TextEditingController _nameController;

@override
void initState() {
  _nameController = TextEditingController();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bem-vindo ',
            style: TextStyle(fontFamily: 'america', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const ProfilePage()),
                    ),
                  );
                },
                icon: const Image(
                  image: AssetImage('images/user.png'),
                ))
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const LoginPage()),
                  ),
                );
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              )),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/inicialpagebackgrounnd.gif'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.fitness_center),
                      title: const Text('Rotina de Exercícios.'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const ExerciciosPage()),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.food_bank),
                      title: const Text('Dieta e acompanhamento alimentar.'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DietaPage(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.water),
                      title: const Text('Ingestão de água.'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IngestaoAguaPage(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.people),
                      title: const Text('Metas traçadas.'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MetasPage(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.balance),
                      title: const Text('Peso e IMC.'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImcPage(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: const Text('Compromissos.'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompromissosPage(),
                            ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.medical_information_outlined),
                      title: const Text('Saúde mental.'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SaudeMentalPage(),
                            ));
                      },
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
