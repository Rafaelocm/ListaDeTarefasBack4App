import 'package:brasil_fields/brasil_fields.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var controllerCep = TextEditingController(text: "");
  var controllerCPF = TextEditingController(text: "");
  var controllerCentavos = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("APP_TITLE".tr()),
          ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CEP"),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controllerCep,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("CPF"),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controllerCPF,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Centavos"),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controllerCentavos,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter()
              ],
            ),
            TextButton(
                onPressed: () {
                  print(CPFValidator.isValid(controllerCPF.text));
                },
                child: const Text("Continuar"))
          ],
        ),
      ),
    ));
  }
}
