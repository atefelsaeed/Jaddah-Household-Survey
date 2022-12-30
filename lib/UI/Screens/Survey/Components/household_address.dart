import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import '../../../../Helper/validator.dart';

class HouseholdAddressSection extends StatefulWidget {
  const HouseholdAddressSection({Key? key}) : super(key: key);

  @override
  _HouseholdAddressSectionState createState() => _HouseholdAddressSectionState();
}

class _HouseholdAddressSectionState extends State<HouseholdAddressSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Text('District Name:'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        label: Text("District Name"),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      validator: (String? value) => Validator.validateEmpty(
                        value: value,
                        message: "يجب اعطاء اجابة",
                      ),
                      onChanged: (String? s) {
                        //-------------send data to backend------------------
                        // survey.data.header.districtName = s!;
                        // print(survey.journeyStarDistrictName);
                      },
                    ),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Text('Zone Number:'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        label: Text("Zone Number"),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      validator: (String? value) => Validator.validateEmpty(
                        value: value,
                        message: "يجب اعطاء اجابة",
                      ),
                      onChanged: (String? s) {
                        //-------------send data to backend------------------
                        // survey.data.header.districtName = s!;
                        // print(survey.journeyStarDistrictName);
                      },
                    ),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
