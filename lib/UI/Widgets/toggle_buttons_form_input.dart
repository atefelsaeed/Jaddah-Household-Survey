import 'package:flutter/material.dart';

class ToggleButtonsFormInput extends StatelessWidget {
  final Widget label;
  final List<Widget> choices;
  final Function? onChange;
  final int? initial;
  final String? Function(int?)? validator;
  final AutovalidateMode autovalidateMode;
  final Function(int?)? onSaved;
  const ToggleButtonsFormInput(
      {Key? key,
      this.label = const SizedBox.shrink(),
      required this.choices,
      this.onChange,
      this.initial,
      this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initial,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      builder: (field) {
        List<bool> selections = choices.map((e) => false).toList();
        if (field.value != null) {
          selections[field.value!] = true;
        }
        return Column(
          children: [
            Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: MediaQuery.of(context).size.width > 530
                  ? Axis.horizontal
                  : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                label,
                const SizedBox(width: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ToggleButtons(
                    children: choices,
                    onPressed: (int index) {
                      field.didChange(index);
                      if (onChange != null) {
                        onChange!(index);
                      }
                    },
                    isSelected: selections,
                  ),
                ),
              ],
            ),
            field.hasError
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        field.errorText!,
                        style: TextStyle(color: Colors.red[700], fontSize: 13),
                      ),
                    ],
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }

  static Widget createChoice({
    required String text,
    IconData? icon,
    double rotation = 0,
    iconColor = Colors.black,
    bool enabled = true,
  }) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Transform.rotate(
                      angle: rotation,
                      child: Icon(
                        icon,
                        color: iconColor,
                      ),
                    )
                  : const SizedBox.shrink(),
              Center(child: Text(text)),
            ],
          ),
        ),
      ),
    );
  }
}
