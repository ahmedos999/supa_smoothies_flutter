import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supasmoothies/screens/read.dart';

import '../components/shared.dart';
import '../services/curd.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

TextEditingController controllertitle = TextEditingController();
TextEditingController controllermethod = TextEditingController();
TextEditingController controllerrating = TextEditingController();

class _createState extends State<create> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green, actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: (() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const view(),
                      ),
                    );
                  }),
                  icon: const Icon(
                    Icons.home,
                    color: Colors.green,
                  )),
            ),
          )
        ]),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              textfield('title', '@pepsi', false, TextInputType.text, Icons.abc,
                  controllertitle),
              textfield('Method', '@put the weed on the cocknut', false,
                  TextInputType.text, Icons.abc, controllermethod),
              textfield('Rating', '@1-10', false, TextInputType.number,
                  Icons.numbers, controllerrating)
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () async {
            Services s = Services();
            await s.createdData(controllertitle.text, controllermethod.text,
                int.parse(controllerrating.text));

            Fluttertoast.showToast(
                msg: "Smoothie added successfully :)",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
