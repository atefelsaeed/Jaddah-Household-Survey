import 'package:flutter/material.dart';

class DropDownFormInput<T> extends StatelessWidget {
  final Map<T, Widget> options;
  final Widget? hint;
  final Widget label;
  final Function? onChange;

  final T? initial;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Function(T?)? onSaved;
  const DropDownFormInput({
    Key? key,
    required this.options,
    this.hint,
    this.label = const SizedBox.shrink(),
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.initial,
    this.validator,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: initial,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      builder: (FormFieldState<T> field) => Column(
        children: [
          Row(
            children: [
              label,
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButton<T>(
                  isExpanded: true,
                  hint: hint,
                  value: field.value,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  onChanged: (T? newValue) {
                    field.didChange(newValue);
                    if (onChange != null) {
                      onChange!(newValue);
                    }
                  },
                  items: options
                      .map(
                        (T v, Widget w) => MapEntry<T, DropdownMenuItem<T>>(
                          v,
                          DropdownMenuItem<T>(
                            value: v,
                            child: w,
                          ),
                        ),
                      )
                      .values
                      .toList(),
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
      ),
    );
  }
}
