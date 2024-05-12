import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/widgets/AddShow.dart';
import 'package:todo_app/widgets/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: todo(),
    );
  }
}

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

// bu class icerisinde ozelikleri
class Task {
  String title = "";
  bool status = false;
  Task({required this.title, required this.status});
}

class _todoState extends State<todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        elevation: 0,
        title: const Text(
          "TO DO APP",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 0, right: 15, bottom: 0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    deleteAll();
                  });
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.redAccent,
                  size: 35,
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return AddShow(
                  addnewtask: addnewtask,
                  myController: myController,
                );
              });
          // isScrollControlled: true);
        },
        child: const Icon(
          color: Colors.white,
          Icons.add,
        ),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "${true_count()}/${alltask.length}",
                style: TextStyle(
                    color: true_count() == alltask.length
                        ? Colors.green
                        : Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 50),
              ),
              SizedBox(
                height: 522,
                child: ListView.builder(
                    itemCount: alltask.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoShow(
                        vartitle: alltask[index].title,
                        varstatus: alltask[index].status,
                        MyFanc: changestatus,
                        MyFanc2: delete,
                        Index: index,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
    alltask.removeAt(0);
  }

  delete(int clickedtask) {
    setState(() {
      alltask.removeAt(clickedtask);
    });
  }

  deleteAll() {
    setState(() {
      alltask.removeRange(0, alltask.length);
    });
  }

  changestatus(int taskIndex) {
    setState(() {
      alltask[taskIndex].status = !alltask[taskIndex].status;
    });
  }

  int true_count() {
    int sayac = 0;
    alltask.forEach((element) {
      if (element.status) {
        sayac++;
      }
    });
    return sayac;
  }

  final myController = TextEditingController();

  List alltask = [];

  void addnewtask() {
    setState(() {
      alltask.add(Task(title: myController.text, status: false));
    });
  }
}
