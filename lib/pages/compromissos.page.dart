import 'package:flutter/material.dart';

class CompromissosPage extends StatefulWidget {
  const CompromissosPage({super.key});

  @override
  State<CompromissosPage> createState() => _CompromissosPageState();
}

class _CompromissosPageState extends State<CompromissosPage> {
  List<String> compromissos = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Compromissos diários.',
            style: TextStyle(fontFamily: 'america', fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 108, 146, 97),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: compromissos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      compromissos[index],
                      style: const TextStyle(fontFamily: 'america'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          compromissos.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Adicionar compromisso',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        compromissos.add(controller.text);
                        controller.clear();
                      });
                    },
                    child: const Text('Adicionar compromisso'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
