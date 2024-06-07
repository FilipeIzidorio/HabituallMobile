import 'package:flutter/material.dart';

class ExerciciosPage extends StatefulWidget {
  const ExerciciosPage({super.key});

  @override
  State<ExerciciosPage> createState() => _ExerciciosPageState();
}

class _ExerciciosPageState extends State<ExerciciosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Aqui vamos monitorar seus exercícios'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 72, 130, 163),
            titleTextStyle: const TextStyle(fontFamily: 'america')),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assetName'))),
          child: Center(
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Segunda-Feira'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Terça-Feira'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Quarta-Feira'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Quinta-Feira'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Sexta-Feira'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Sábado'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
                  ),
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: const Text('Ddomingo'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ExerciciosPage())));
                    },
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
