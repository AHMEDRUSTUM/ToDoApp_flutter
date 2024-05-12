import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoShow extends StatelessWidget {
  final String vartitle;
  final bool varstatus;
  final Function MyFanc;
  final Function MyFanc2;
  final int Index;
  const ToDoShow({
    super.key,
    required this.vartitle,
    required this.Index,
    required this.MyFanc,
    required this.MyFanc2,
    required this.varstatus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyFanc(Index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
        padding: EdgeInsets.all(15),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(209, 224, 224, 0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vartitle,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: varstatus ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                  decoration: varstatus == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  varstatus ? Icons.check : Icons.close,
                  color: varstatus ? Colors.green : Colors.redAccent,
                  size: 30,
                ),
                IconButton(
                    onPressed: () {
                      MyFanc2(Index);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red[100],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
