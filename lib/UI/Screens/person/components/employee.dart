import 'package:flutter/cupertino.dart';
import 'package:jaddah_household_survey/UI/Screens/person/components/transporter_moblity.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';

// TODO: implement build
class Employee extends StatelessWidget {
  final int i;

  const Employee({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    var base = PersonModelList.personModelList[i];
    var mainOccupationKey = PersonData.mainOccupation.keys.first;
    var occupationSectorKey = PersonData.occupationSector.keys.first;
    return Column(
      children: [
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput2(
              label: Text(PersonData.mainOccupation[mainOccupationKey]!
                  .toList()
                  .first["value"]
                  .toString()),
              hint:"الوظيفة الأساسية",
              options: PersonData.mainOccupation[mainOccupationKey]!.toList(),
              onChange: (String? p) {
                List value =
                    PersonData.mainOccupation[mainOccupationKey].toList();

                for (int inr = 0; inr < value.length; inr++) {
                  if (p == value[inr]["value"]) {
                    base.personalQuestion!.mainOccupationType =
                        value[inr]["value"];
                  }
                }
                PersonModelList.personModelList[i].personalQuestion!.mainOccupationType=p.toString();

              },
            ),
            DropDownFormInput(
              label: Text(PersonData.occupationSector[occupationSectorKey]!
                  .toList()
                  .first
                  .toString()),
              hint: "لو عمل ما هو قطا ع العمل",
              options:
                  PersonData.occupationSector[occupationSectorKey]!.toList(),
              onChange: (String? p) {
                PersonModelList.personModelList[i].occupationModel!.occupationSector=p.toString();
              },
            ),
          ],
        ),
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(PersonData.workplace[PersonData.workplace.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: "إذا كنت موظفًا أو طالبًا ، ما هو وضعك المعتاد للسفر إلى العمل / المدرسة؟ سؤال موجه - قائمة منسدلة للأنماط",
              options: PersonData.workplace[PersonData.workplace.keys.first]!
                  .toList(),
              onChange: (String? p) {
               // PersonModelList.personModelList[i].personalQuestion.=p.toString();
              },
            ),
            DropDownFormInput(
              label: Text(PersonData.licence[PersonData.licence.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint:"ما نوع رخصة القيادة التي لديك (ضع علامة على كل ما ينطبق)",
              options: PersonData.licence[PersonData.licence.keys.first]!.toList(),
              onChange: (String? p) {
                PersonModelList.personModelList[i].personalQuestion!.drivingLicenceType=p.toString();
              },
            ),
          ],
        ),


      /*  const HeadLine(
            title: "Address of the Main Occupation  (work or study place) ",
            subTitle:
                "Write both if a person is a part- time student and also part- time employed; then ask both education and work address"),
        AppSize.spaceHeight3(context),*/
      /*  Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: base.occupationModel!.geoCodes!,
                text: "Geocodes",
                label: "Geocodes",
              ),
              TextForm(
                controller: base.occupationModel!.address!,
                text: "address",
                label: "address",
              )
            ],
          ),
        ),
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(PersonData.workplace[PersonData.workplace.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.workplace.keys.first.toString(),
              options: PersonData.workplace[PersonData.workplace.keys.first]!
                  .toList(),
              onChange: (String? p) {},
            ),
            DropDownFormInput(
              label: Text(PersonData
                  .employeeOffer[PersonData.employeeOffer.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.employeeOffer.keys.first.toString(),
              options: PersonData
                  .employeeOffer[PersonData.employeeOffer.keys.first]!
                  .toList(),
              onChange: (String? p) {},
            ),
          ],
        ),*/
        /*AppSize.spaceHeight3(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: base.occupationModel!.startingWoke!,
                text: "StartYourWork",
                label: "StartYourWork",
              ),
              TextForm(
                controller: base.occupationModel!.endingWoke!,
                text: "endYourWork",
                label: "endYourWork",
              )
            ],
          ),
        ),*/
      /*  AppSize.spaceHeight3(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextForm(
                controller: base.occupationModel!.earliestTimeStartingWork!,
                text: "Early and Late Start",
                label: "Early and Late Start",
              ),
              TextForm(
                controller: base.occupationModel!.earliestTimeFinishingWork!,
                text: "Early and Late Finish",
                label: "Early and Late Finish",
              )
            ],
          ),
        ),*/
        AppSize.spaceHeight3(context),
       /* Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(PersonData
                  .carSharing[PersonData.carSharing.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.carSharing.keys.first.toString(),
              options: PersonData.carSharing[PersonData.carSharing.keys.first]!
                  .toList(),
              onChange: (String? p) {},
            ),
            TextForm(
              controller: base.personalQuestion!.educationAddress!.fullAddress!,
              text: "Address of the Main Occupation",
              label: "Address of the Main Occupation",
            )
          ],
        ),*/
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: Text(PersonData
                  .drivingLiences[PersonData.drivingLiences.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: " مدى توفر سيارة متاحة لك لاستخدامك الشخصي؟(سؤال موجه اسأل فقط إذا كان لديك رخصة قيادة)",
              options: PersonData
                  .drivingLiences[PersonData.drivingLiences.keys.first]!
                  .toList(),
              onChange: (String? p) {
                PersonModelList.personModelList[i].personalQuestion!.availablePersonalCar=p.toString();
              },
            ),
            DropDownFormInput(
              label: Text(PersonData.busBuss[PersonData.busBuss.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint:"هل لديك تذكرة حافلة" ,
              options:
                  PersonData.busBuss[PersonData.busBuss.keys.first]!.toList(),
              onChange: (String? p) {
                PersonModelList.personModelList[i].personalQuestion!.haveBusPass=p.toString();
              },
            ),

          ],
        ),
        TransporterMobilty(index: i)
      ],
    );
  }
}
