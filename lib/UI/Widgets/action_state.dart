import 'package:flutter/material.dart';

class ActionState extends StatelessWidget {
  const ActionState({Key? key, required this.action}) : super(key: key);
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: action(),
        builder: (context, data) {
          return data.connectionState == ConnectionState.waiting
              ? WillPopScope(
                  onWillPop: () async => false,
                  child: const CircularProgressIndicator(),
                )
              : data.hasError
                  ? Column(
                      children: [
                        Center(
                          child: Transform.rotate(
                            angle: 0.785398,
                            child: const Icon(
                              Icons.add,
                              size: 150,
                            ),
                          ),
                        ),
                        const Text('خطأ بالإتصال'),
                      ],
                    )
                  : data.data == 'subscription done'
                      ? Column(
                          children: const [
                            Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 120,
                              ),
                            ),
                            Text('تم!'),
                          ],
                        )
                      : Column(
                          children: [
                            const Center(
                              child: Icon(
                                Icons.info,
                                size: 120,
                              ),
                            ),
                            const Text('تم!'),
                            Text(
                              data.data.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
        },
      ),
    );
  }
}
