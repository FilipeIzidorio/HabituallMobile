import 'package:flutter/material.dart';
import 'package:habituall/pages/inicial.page.dart';

class DietaPage extends StatefulWidget {
  const DietaPage({super.key});

  @override
  State<DietaPage> createState() => _DietaPageState();
}

class _DietaPageState extends State<DietaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sua dieta',
            style: TextStyle(
              fontFamily: 'america',
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 117, 123, 180),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.fastfood_sharp),
                          title: const Text('Café da manhã'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const InicialPage()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Espaçamento entre os cards
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.fastfood_sharp),
                          title: const Text('Lanche da manhã'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const InicialPage()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.fastfood_sharp),
                          title: const Text('Almoço'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const InicialPage()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Espaçamento entre os cards
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.fastfood_sharp),
                          title: const Text('Lanche da Tarde'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const InicialPage()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.fastfood_sharp),
                          title: const Text('Jantar'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const InicialPage()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Espaçamento entre os cards
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.fastfood_sharp),
                          title: const Text('Ceia'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const InicialPage()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
