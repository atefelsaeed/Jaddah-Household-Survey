import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

class DropDownFormInput<T> extends StatelessWidget {
  final Map<T, Widget> options;
  final String? hint;
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

          Text(
            hint.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color:ColorManager.black,
                fontSize: height(context)*.02),
            textAlign: TextAlign.center,
          ),

AppSize.spaceHeight1(context),
            SizedBox(
              width: width(context)*.5,
              height: height(context)*.06,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: InputDecorator(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      child: DropdownButtonHideUnderline(
                    child: DropdownButton<T>(
                      isExpanded: true,
                      hint: label,
                      value: field.value,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                  )),
              ),
            ),



          field.hasError
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      field.errorText!,
                      style: TextStyle(color: Colors.red[700], fontSize: 12),
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
