import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/all_data.dart';
import '../../../../Data/HouseholdPart1/person_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'headline.dart';

// TODO: implement build
class Employee extends StatelessWidget {
  final int i;

  const Employee({required this.i});

  @override
  Widget build(BuildContext context) {
    var base = PersonModelList.personModelList[i];
    var mainOccupationKey = PersonData.mainOccupation.keys.first;
    var occupationSectorKey = PersonData.occupationSector.keys.first;
    return Column(
      children: [
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput2(
              label: Text(PersonData.mainOccupation[mainOccupationKey]!
                  .toList()
                  .first["value"]
                  .toString()),
              hint: mainOccupationKey.toString(),
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
              },
            ),
            DropDownFormInput(
              label: Text(PersonData.occupationSector[occupationSectorKey]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.occupationSector.keys.first.toString(),
              options:
                  PersonData.occupationSector[occupationSectorKey]!.toList(),
              onChange: (String? p) {},
            ),
          ],
        ),
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput(
              label: Text(PersonData.occupationLevelSector[occupationSectorKey]!
                  .toList()
                  .first
                  .toString()),
              hint: occupationSectorKey.toString(),
              options: PersonData.occupationLevelSector[occupationSectorKey]!
                  .toList(),
              onChange: (String? p) {},
            ),
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
          ],
        ),
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput(
              label: Text(PersonData.commute[PersonData.commute.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.commute.keys.first.toString(),
              options:
                  PersonData.commute[PersonData.commute.keys.first]!.toList(),
              onChange: (String? p) {},
            ),
            DropDownFormInput(
              label: Text(PersonData.bike[PersonData.bike.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.bike.keys.first.toString(),
              options: PersonData.bike[PersonData.bike.keys.first]!.toList(),
              onChange: (String? p) {},
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        const HeadLine(
            title: "Address of the Main Occupation  (work or study place) ",
            subTitle:
                "Write both if a person is a part- time student and also part- time employed; then ask both education and work address"),
        AppSize.spaceHeight3(context),
        Directionality(
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
        ),
        AppSize.spaceHeight3(context),
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
        ),
        AppSize.spaceHeight3(context),
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
        ),
        AppSize.spaceHeight3(context),
        Row(
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
        ),
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
              hint: PersonData.drivingLiences.keys.first.toString(),
              options: PersonData
                  .drivingLiences[PersonData.drivingLiences.keys.first]!
                  .toList(),
              onChange: (String? p) {},
            ),
            DropDownFormInput(
              label: Text(PersonData.busBuss[PersonData.busBuss.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: PersonData.busBuss.keys.first.toString(),
              options:
                  PersonData.busBuss[PersonData.busBuss.keys.first]!.toList(),
              onChange: (String? p) {},
            ),
          ],
        ),
      ],
    );
  }
}
