import 'package:flutter/material.dart';

class ActionAlert extends StatefulWidget {
  const ActionAlert({
    Key? key,
    required this.actionState,
    required this.child,
  }) : super(key: key);
  final Widget actionState;
  final Widget child;

  @override
  State<ActionAlert> createState() => _ActionAlertState();
}

class _ActionAlertState extends State<ActionAlert> {
  bool didAction = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      title: didAction ? const SizedBox.shrink() : const Text("هل أنت متأكد؟"),
      content: didAction
          ? SizedBox(child: widget.actionState, height: 220)
          : widget.child,
      actions: didAction
          ? []
          : [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      'نعم',
                    ),
                    onPressed: () {
                      setState(() {
                        didAction = true;
                      });
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'إلغاء',
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              )
            ],
    );
  }
}
