import 'package:flutter/material.dart';

class ReplaceWidgets extends StatefulWidget {
  const ReplaceWidgets({
    Key? key,
  }) : super(key: key);

  @override
  State<ReplaceWidgets> createState() => _ReplaceWidgetsState();
}

class _ReplaceWidgetsState extends State<ReplaceWidgets> {
  bool isA = false, isB = false, isC = false, isD = false;
  // int counterA = 0, counterB = 0, counterC = 0, counterD = 0, counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Replace Widgets')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  insertRemoveText(
                      isA
                          ? 'A'
                          : isB
                              ? 'B'
                              : isC
                                  ? 'C'
                                  : 'D',
                      Colors.amberAccent, () {
                    setState(() {});
                  }),
                ],
              ),
              // const SizedBox(height: 50),
              // Row(
              //   children: [
              //     const SizedBox(width: 20),
              //     // for (int i = 0; i <= counterB; i++)
              //     insertRemoveText('B', Colors.pinkAccent, () {
              //       setState(() {
              //         // counterB--;
              //       });
              //     }),
              //     const SizedBox(width: 20),
              //   ],
              // ),
              // const SizedBox(height: 50),
              // Row(
              //   children: [
              //     const SizedBox(width: 20),
              //     // for (int i = 0; i <= counterC; i++)
              //     insertRemoveText('C', Colors.lightBlueAccent, () {
              //       setState(() {
              //         // counterC--;
              //       });
              //     }),
              //     const SizedBox(width: 20),
              //   ],
              // ),
              // const SizedBox(height: 50),
              // Row(
              //   children: [
              //     const SizedBox(width: 20),
              //     // for (int i = 0; i <= counterD; i++)
              //     insertRemoveText('D', Colors.deepOrangeAccent, () {
              //       setState(() {
              //         // counterD--;
              //       });
              //     }),
              //     const SizedBox(width: 20),
              //   ],
              // ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  insertRemoveText('A', Colors.amberAccent, () {
                    setState(() {
                      isA = true;
                      // counterA++;
                    });
                  }),
                  insertRemoveText('B', Colors.pinkAccent, () {
                    setState(() {
                      isB = true;
                      // counterB++;
                    });
                  }),
                  insertRemoveText('C', Colors.lightBlueAccent, () {
                    setState(() {
                      isC = true;
                      // counterC++;
                    });
                  }),
                  insertRemoveText('D', Colors.deepOrangeAccent, () {
                    setState(() {
                      isD = true;
                      // counterD++;
                    });
                  }),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector insertRemoveText(
      String string, Color textColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: 35,
          color: textColor.withOpacity(0.15),
          child: Text(
            string,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
