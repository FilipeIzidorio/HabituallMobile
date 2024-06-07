import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double imc = 0;
  String status = '';

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      pesoController.text = prefs.getString('peso') ?? '';
      alturaController.text = prefs.getString('altura') ?? '';
    });
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('peso', pesoController.text);
    prefs.setString('altura', alturaController.text);
  }

  void _calculateImc() {
    double peso =
        double.tryParse(pesoController.text.replaceAll(',', '.')) ?? 0;
    double alturaCM =
        double.tryParse(alturaController.text.replaceAll(',', '.')) ?? 0;
    if (peso > 0 && alturaCM > 0) {
      double alturaM = alturaCM / 100; // Convertendo para metros
      double newImc = peso / (alturaM * alturaM);
      String newStatus;
      if (newImc < 18.5) {
        newStatus = 'Abaixo do Peso';
      } else if (newImc >= 18.5 && newImc <= 24.9) {
        newStatus = 'Peso Normal';
      } else if (newImc >= 25 && newImc <= 29.9) {
        newStatus = 'Sobrepeso';
      } else if (newImc >= 30 && newImc <= 34.9) {
        newStatus = 'Obesidade Grau I';
      } else if (newImc >= 35 && newImc <= 39.9) {
        newStatus = 'Obesidade Grau II';
      } else {
        newStatus = 'Obesidade Grau III';
      }
      setState(() {
        imc = newImc;
        status = newStatus;
      });
    } else {
      setState(() {
        imc = 0;
        status = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Acompanhamos peso e IMC',
            style: TextStyle(fontFamily: 'america', fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 158, 172, 99),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: pesoController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: alturaController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Altura (cm)'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  _saveData();
                  _calculateImc();
                },
                child: const Text(
                  'Calcular IMC',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 158, 172, 99))),
              ),
              const SizedBox(height: 16),
              Text(
                'IMC: ${imc.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Status: $status',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
