import 'package:brasil_fields/brasil_fields.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:estudobackapp/pages/brasil_fields_page.dart';
import 'package:estudobackapp/pages/tarefa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late var tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(initialIndex: 0, length: 5, vsync: this); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: double.infinity,
          child: TabBarView(
            controller: tabcontroller,
           children: [
            const TarefasPage(),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
             const BrasilFieldsPage()
            ],
          )),
      bottomNavigationBar: ConvexAppBar(
        height: 50,
        initialActiveIndex: 3,
          items: const [
            TabItem(title: "Tarefas", icon: Icons.home, isIconBlend: true),
            TabItem(title: "Tarefas 2", icon: Icons.home),
            TabItem(title: "Lista 3", icon: Icons.home),
            TabItem(title: "Lista 4", icon: Icons.home),
            TabItem(title: "Brasil", icon: Icons.home),
          ], 
          onTap: (int i)=> tabcontroller.index = i, 
          controller: tabcontroller, 
          ),
    ));
  }
}
