import 'package:estudobackapp/model/tarefa_model.dart';
import 'package:estudobackapp/repositories/tarefa_repository.dart';
import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  var descricaoController = TextEditingController(text: "");
  TarefaRepositorie tarefaRepositorie = TarefaRepositorie();
  var _tarefas = TarefasBack4AppModel([]);
  var apenasNaoConcluidas = false;
  var load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterDados();
  }

  obterDados() async {
    setState(() {
      load = true;
    });
    _tarefas = await tarefaRepositorie.obterTarefas(apenasNaoConcluidas);
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: Column(
                  children: [
                    const Text(
                      "Adicione uma tarefa",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          label: const Text(
                            "Descrição da tarefa",
                            style: TextStyle(fontSize: 18),
                          ),
                          floatingLabelStyle: const TextStyle(
                              color: Colors.blue, fontSize: 16)),
                      controller: descricaoController,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancelar",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                              ),
                              onPressed: () async {
                                await tarefaRepositorie.criarTarefa(
                                    TarefaBack4AppModel.criar(
                                        descricaoController.text, false));
                                obterDados();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Adicionar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Apenas não concluídos",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: apenasNaoConcluidas,
                  onChanged: (value) {
                    apenasNaoConcluidas = value;
                    obterDados();
                  },
                )
              ],
            ),
          ),
          load
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: _tarefas.tarefas.length,
                    itemBuilder: (_, int index) {
                      var tarefa = _tarefas.tarefas[index];
                      return Dismissible(
                          onDismissed: (direction) async {
                            await tarefaRepositorie
                                .deletarTarefa(tarefa.objectId);
                            _tarefas.tarefas.removeAt(index);
                          },
                          key: Key(tarefa.objectId),
                          child: ListTile(
                            title: Text(tarefa.descricao),
                            trailing: Switch(
                              value: tarefa.concluido,
                              onChanged: (bool value) async {
                                tarefa.concluido = value;
                                await tarefaRepositorie.atualizarTarefa(tarefa);
                                obterDados();
                              },
                            ),
                          ));
                    },
                  ),
                ),
        ],
      ),
    ));
  }
}
