import 'package:estudobackapp/model/tarefa_model.dart';
import 'package:estudobackapp/repositories/backapp_custom_dio.dart';

class TarefaRepositorie {
  //inicializando a customDio que tem as informações backend do Back4App configuradas
  final _customDio = Back4AppCustomDio();

  TarefaRepositorie();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var url = "/Tarefas";
    if (naoConcluidas) {
      url = "$url?where={\"concluido\": false}";
    }
    var results = await _customDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(results.data);
  }

  Future<void> criarTarefa(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio
          .post("/Tarefas", data: tarefaBack4AppModel.toCreateJson());
    } catch (e) {
      throw (e);
    }
  }

  Future<void> atualizarTarefa(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio.put("/Tarefas/${tarefaBack4AppModel.objectId}",
          data: tarefaBack4AppModel.toEndPointJson());
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deletarTarefa(String objectId) async {
    try {
      await _customDio.dio.delete("/Tarefas/$objectId");
    } catch (e) {
      throw (e);
    }
  }
}
