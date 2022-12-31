import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Models/survey.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/UI/Screens/Survey/Components/surveyHeader.dart';

import '../../../Helper/validator.dart';
import '../../../Models/enum_survey.dart';
import '../../Widgets/dropdown_form_input.dart';
import 'Components/household_address.dart';

class SurveyScreen extends StatefulWidget {
  SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController ditrictName = TextEditingController();
  final TextEditingController zoneNumber = TextEditingController();
  final TextEditingController buildingName = TextEditingController();
  final TextEditingController streetName = TextEditingController();
  final TextEditingController streetNumber = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jaddah Household'),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.save), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _key,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child:

            Column(
              children:  [
               // SurveyHeader(),
             Row(mainAxisAlignment: MainAxisAlignment.start,children: const [
               Text(" رقم المقابلة الشخصية : ",
                 style: TextStyle(fontSize: 24),
               ),
             ],),

                Row(mainAxisAlignment: MainAxisAlignment.start,children: const [
                SizedBox(width: 10,),
                  Text("يوم المقابلة :",style: TextStyle(fontSize: 24),textAlign: TextAlign.right,)
                ],),
                TextFormField(
                  controller: ditrictName,
                  decoration: const InputDecoration(labelText: "اسم الحي"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال اسم الحي",
                  ),
                ),
                TextFormField(
                  controller: zoneNumber,
                  decoration: const InputDecoration(labelText: "رقم المنطقه"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال رقم المنطقه",
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,children: const [
                  SizedBox(width: 10,),
                  Text("Household address",style: TextStyle(fontSize: 24),textAlign: TextAlign.right,)
                ],),
                TextFormField(
                  controller: streetName,
                  decoration: const InputDecoration(labelText: "street name"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال رقم المنطقه",
                  ),
                ),
                TextFormField(
                  controller: streetNumber,
                  decoration: const InputDecoration(labelText: "street number"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال رقم المنطقه",
                  ),
                ),
                TextFormField(
                  controller: zoneNumber,
                  decoration: const InputDecoration(labelText: "رقم المنطقه"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال رقم المنطقه",
                  ),
                ),
                TextFormField(
                  controller: zoneNumber,
                  decoration: const InputDecoration(labelText: "رقم المنطقه"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال رقم المنطقه",
                  ),
                ),
                TextFormField(
                  controller: zoneNumber,
                  decoration: const InputDecoration(labelText: "رقم المنطقه"),
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  validator: (value) => Validator.validateEmpty(
                    value: value!,
                    message: "يرجي ادخال رقم المنطقه",
                  ),
                ),

                DropDownFormInput(
                  hint:  const Text(
                    "What best describes this dwelling type?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label: const Text(""),
                  options: const <DwellingType, Widget>{
                    DwellingType.flatFamily: Text("flat - family"),
                    DwellingType.sharedVilla: Text(" shared villa	"),
                    DwellingType.sharedFlatFamily: Text("shared flat-family"),
                    DwellingType.sharedRoomInAFlatWithMoreThanOneBedSpace: Text(" shared room in a flat with more than one/bed-space"),
                    DwellingType.arabianHouse: Text("arabian house"),
                    DwellingType.ownRoomInAFlatSinglePerson: Text("own room in a flat- single person"),
                    DwellingType.other: Text("other"),

                  },
                  onChange: (DwellingType? p) {

                  },
                  validator: (DwellingType? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                DropDownFormInput(
                  hint:  const Text(
                    "Is The dwelling?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label: const Text(""),
                  options: const <IsDwelling, Widget>{
                  IsDwelling.ownerOccupied:Text("Owner occupied"),
                    IsDwelling.rented:Text("Rented"),
                    IsDwelling.providedByTheEmployer:Text("Provided by the employer"),
                    IsDwelling.providedByTheGovernment:Text("Provided by the government"),
                    IsDwelling.other:Text("other")

                  },
                  onChange: (DwellingType? p) {

                  },
                  validator: (IsDwelling? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                DropDownFormInput(
                  hint:  const Text(
                    "How many bedrooms are there in the accommodation you live in?",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label:  Text(""),
                  options:  <String, Widget>{
                  for(int i=0;i<10;i++)
                  i.toString() : Text(i.toString())

                  },
                  onChange: (DwellingType? p) {

                  },
                  validator: (String? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                DropDownFormInput(
                  hint:  const Text(
                    "1",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label:  Text(" How many separate families live at this address?"),
                  options:  <String, Widget>{
                    for(int i=0;i<10;i++)
                      i.toString() : Text(i.toString())

                  },
                  onChange: (DwellingType? p) {

                  },
                  validator: (String? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                DropDownFormInput(
                  hint:  const Text(
                    "adults (18yrs +)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label: const Text("How many people usually live at this address?"),
                  options: const <TypeChildern, Widget>{
                   TypeChildern.adults:  Text("adults (18yrs +)"),
                    TypeChildern.childern:Text('children (under 18yrs)')

                  },
                  onChange: (DwellingType? p) {

                  },
                  validator: (TypeChildern? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                // HouseholdAddressSection()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
