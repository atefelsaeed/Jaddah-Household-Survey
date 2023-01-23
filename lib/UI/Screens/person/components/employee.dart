import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';

// TODO: implement build
class Employee extends StatefulWidget {
  final int i;

  const Employee({super.key, required this.i});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    var base = PersonModelList.personModelList[widget.i];
    var mainOccupationKey = PersonData.mainOccupation.keys.first;
    var occupationSectorKey = PersonData.occupationSector.keys.first;
    return Column(
      children: [
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "عاطلين عن العمل" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - جامعي: دوام كامل (لا يعمل) " ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "شخص البيت" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "معاق / مريض"
                ? Container()
                : DropDownFormInput(
                    label: Text(PersonData
                        .workplace[PersonData.workplace.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint:
                        "إذا كنت موظفًا أو طالبًا ، ما هو وضعك المعتاد للذهاب إلى العمل / المدرسة؟ سؤال موجه - قائمة منسدلة للأنماط",
                    options: PersonData
                        .workplace[PersonData.workplace.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      PersonModelList.personModelList[widget.i].occupationModel!
                          .bestWorkspaceLocation = p.toString();
                    },
                  ),
            PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة ابتدائية" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة متوسطة" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة ثانوية" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        " الطالب - الكلية: بدوام كامل - يعمل بدوام جزئي"
                ? Container()
                : DropDownFormInput(
                    label: Text(PersonData
                        .licence[PersonData.licence.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint:
                        "ما نوع رخصة القيادة التي لديك (ضع علامة على كل ما ينطبق)",
                    options: PersonData.licence[PersonData.licence.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      setState(() {
                        PersonModelList
                            .personModelList[widget.i]
                            .personalQuestion!
                            .drivingLicenceType = p.toString();
                      });
                    },
                  ),
          ],
        ),

        AppSize.spaceHeight3(context),

        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersonModelList.personModelList[widget.i].personalQuestion!
                        .drivingLicenceType ==
                    "بدون ترخيص"
                ? Container()
                : DropDownFormInput(
                    label: Text(PersonData
                        .drivingLiences[PersonData.drivingLiences.keys.first]!
                        .toList()
                        .first
                        .toString()),
                    hint:
                        " مدى توفر سيارة متاحة لك لاستخدامك الشخصي؟(سؤال موجه اسأل فقط إذا كان لديك رخصة قيادة)",
                    options: PersonData
                        .drivingLiences[PersonData.drivingLiences.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      PersonModelList
                          .personModelList[widget.i]
                          .personalQuestion!
                          .availablePersonalCar = p.toString();
                    },
                  ),
            DropDownFormInput(
              label: Text(PersonData.busBuss[PersonData.busBuss.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "هل لديك تذكرة حافلة",
              options:
                  PersonData.busBuss[PersonData.busBuss.keys.first]!.toList(),
              onChange: (String? p) {
                PersonModelList.personModelList[widget.i].personalQuestion!
                    .haveBusPass = p.toString();
              },
            ),
          ],
        ),
        //  TransporterMobilty(index: widget.i)
      ],
    );
  }
}
