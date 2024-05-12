import 'package:flutter/material.dart';

class AddShow extends StatelessWidget {
  final Function addnewtask;
  final TextEditingController myController;

  AddShow({required this.addnewtask, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        centerTitle: true,
        title: (const Text(
          "ADD SCREEN",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: TextField(
                maxLength: 15,
                controller: myController,
                obscureText: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  hintText: "NEW TODO :",
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                addnewtask();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(58, 66, 86, 1),
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: const Text(
                "ADD",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            )
          ]),
        ),
      ),
    );
// isScrollControlled: true);
  }
}
