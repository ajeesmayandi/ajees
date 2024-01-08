import 'package:flutter/material.dart';

class DialogExample extends StatefulWidget {
  const DialogExample({super.key});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  int currentValue = 0;

  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();

  List<Color> value = [
    Colors.white,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.deepOrange,
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 60,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        number2.clear();
                        number1.clear();
                        // currentValue = int.parse(number1.text) - int.parse(number2.text);
                      });
                    },
                    color: Colors.deepOrange,
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                TextFormField(
                  controller: number1,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: number2,
                ),
                SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      currentValue++;
                    });
                    // bottomSheet(context: context);
                    // showDialog1(context: context);
                  },
                  child: Text(
                    '${currentValue.toString()}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                );
              })
        ],
      ),
    );
  }

  showDialog1({required BuildContext context}) {
    AlertDialog alert = AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text('AlertDialog description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  bottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (BuildContext innerContext) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Text",
                    hintStyle: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
