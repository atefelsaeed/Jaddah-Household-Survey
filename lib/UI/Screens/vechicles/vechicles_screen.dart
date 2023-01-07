import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import 'package:provider/provider.dart';
import '../../../Data/HouseholdPart1/questions_data.dart';
import '../../../Data/HouseholdPart1/vechelis_data.dart';

import '../../../Models/enum_survey.dart';
import '../../../Providers/survey_hhs.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/text.dart';
import '../../Widgets/text_form_field.dart';
import '../Survey/components/q5.dart';
import '../Survey/widgets/list_view_check_box_orange.dart';
import '../Survey/widgets/text_form_row.dart';



class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  late EditingController3 editingController3=EditingController3(peopleUnder18: TextEditingController(),
      totalNumber:  TextEditingController(), peopleAdults18:  TextEditingController());

  @override
  Widget build(BuildContext context) {

    SurveyPTProvider surveyPt =
    Provider.of<SurveyPTProvider>(context,listen: false);
    SurveysProvider surveys =
    Provider.of<SurveysProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _key,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                          AppSize.spaceWidth1(context),
                          TextGlobal(text:" Vehicles in the Household - Household Travel Diary Survey", fontSize: height(context)*.023 ,color: ColorManager.orangeTxtColor,),
                        ],) ,
                        AppSize.spaceHeight3(context),
                        const ListViewVehicles(),
                        Q2VecScreen(editingController3: editingController3,),
                        AppSize.spaceHeight3(context),
                        ListViewCheckBoxOrange(
                          title: VehiclesData.q3VecData.keys.first,
                          question: VehiclesData
                              .q3VecData[VehiclesData.q3VecData.keys.first]!
                              .toList(),
                          subTitle: "",
                        ),
                        AppSize.spaceHeight2(context),
                        DefaultButton(
                          function: () {
                            surveyPt.interViewDate=DateTime.now();
                            surveyPt.headerInterviewNumber=4;
                            surveyPt.headerDistrictName="ll";
                            surveyPt.vehiclesData.vehiclesBodyType!.vehicleTypeName="car";
                            surveys.addSurvey(surveyPt.data);
                            surveys.fetch();
                            print(surveyPt.headerDistrictName);
                            //   surveyPt.vehiclesData.vehiclesBodyType.vehicleTypeName="kkk";
                          },
                          isWidget: true,
                          text: "Next Step",
                          widget: const Icon(Icons.arrow_forward),
                        ),
                        AppSize.spaceHeight2(context),
                        // HouseholdAddressSection()
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );

  }
}
class ListViewVehicles extends StatefulWidget {
  const ListViewVehicles(
      {super.key});

  @override
  State<ListViewVehicles> createState() => _ListViewCheckBoxOrangeState();
}class _ListViewCheckBoxOrangeState extends State<ListViewVehicles> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
      InkWell(
        onTap: (){
          print(VehiclesData.vecCar.length);
        },
        child: SizedBox(width: width(context)-30,  child:    TextGlobal(
                text: "? How many motorised vehicles are available to the household for personal use",
                fontSize: height(context) * .02,
                color: ColorManager.black,
              )),
      ),
          ],
        ),
        AppSize.spaceHeight1(context),

        AppSize.spaceHeight1(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child:      GridView.builder(
            primary: true,
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,childAspectRatio: 4),
            itemBuilder: (context, index) =>
                SizedBox(
                  width: width(context)/2,
                  child: Row(children: [
                    TextGlobal(
                      text: VehiclesData.vecModel[index].title,
                      fontSize: height(context) * .02,
                      color: ColorManager.grayColor,
                    ),
                    Checkbox(
                        side: BorderSide(
                          color: ColorManager.orangeTxtColor,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        checkColor: ColorManager.whiteColor,
                        focusColor: ColorManager.orangeTxtColor,
                        activeColor: ColorManager.orangeTxtColor,
                        value:VehiclesData.vecModel[index].isChosen,
                        onChanged: (bool? value) {
                          setState(() {
                            VehiclesData.vecModel[index].isChosen= value!;
                            print(VehiclesData.vecModel.first);
                          });
                        }),
                    VehiclesData.vecModel[index].isChosen==true?MyTextForm(
                      textInputType: TextInputType.number,widthForm: width(context)*.120,
                      controller:VehiclesData.vecModel[index].textEditingController,
                      label: '',onChanged: (d){
                      setState(() {
                        switch (VehiclesData.vecModel[index].title){
                          case "car":
                            VehiclesData.vecCar=[];
                            for(int i=0;i<int.parse(d!);i++) {
                              VehiclesData.vecCar.add(VecBodyType(ageOfVec: TextEditingController(), annual: TextEditingController(), fuel: TextEditingController(), model: TextEditingController(), whoOwn:TextEditingController()));
                            }
                            print(VehiclesData.vecCar);
                            break;
                          case "Large Car (SUV etc.)":
                            VehiclesData.largeCar=[];
                            for(int i=0;i<int.parse(d!);i++) {
                              VehiclesData.largeCar.add(VecBodyType(ageOfVec: TextEditingController(), annual: TextEditingController(), fuel: TextEditingController(), model: TextEditingController(), whoOwn:TextEditingController()));
                            }
                            break;
                          case "Van":
                            VehiclesData.vecVan=[];
                            for(int i=0;i<int.parse(d!);i++) {
                              VehiclesData.vecVan.add(VecBodyType(ageOfVec: TextEditingController(), annual: TextEditingController(), fuel: TextEditingController(), model: TextEditingController(), whoOwn:TextEditingController()));
                            }
                            break;
                          case "E-Scooter":
                            VehiclesData.eScooter=[];
                            for(int i=0;i<int.parse(d!);i++) {
                              VehiclesData.eScooter.add(VecBodyType(ageOfVec: TextEditingController(), annual: TextEditingController(), fuel: TextEditingController(), model: TextEditingController(), whoOwn:TextEditingController()));
                            }
                            break;
                          case "Pick up":
                            VehiclesData.pickUp=[];
                            for(int i=0;i<int.parse(d!);i++) {
                              VehiclesData.pickUp.add(VecBodyType(ageOfVec: TextEditingController(), annual: TextEditingController(), fuel: TextEditingController(), model: TextEditingController(), whoOwn:TextEditingController()));
                            }
                            break;
                          case "other":
                            VehiclesData.other=[];
                            for(int i=0;i<int.parse(d!);i++) {
                              VehiclesData.other.add(VecBodyType(ageOfVec: TextEditingController(), annual: TextEditingController(), fuel: TextEditingController(), model: TextEditingController(), whoOwn:TextEditingController()));
                            }
                            break;





                        }
                      });


                      //   VehiclesData.vecCar.add(VecBodyType(ageOfVec: ageOfVec, annual: annual, fuel: fuel, model: model, whoOwn: whoOwn))
                    },onTap: (){
                      print(VehiclesData.vecModel[index].number);
                    },):Container(),

                  ]),
                ),
          ),
        ),
        for (int i=0;i<VehiclesData.vecCar.length;i++)
        BodyTypeVehicles( vecBodyType: VehiclesData.vecCar[i], index: i+1, title:"car",),
        for (int i=0;i<VehiclesData.vecVan.length;i++)
          BodyTypeVehicles( vecBodyType: VehiclesData.vecVan[i],index: i+1,title: "Van",),
        for (int i=0;i<VehiclesData.largeCar.length;i++)
          BodyTypeVehicles( vecBodyType: VehiclesData.largeCar[i],index: i+1,title: "large car",),
        for (int i=0;i<VehiclesData.pickUp.length;i++)
          BodyTypeVehicles( vecBodyType: VehiclesData.pickUp[i], index: i+1,title: "pickUp",),
        for (int i=0;i<VehiclesData.eScooter.length;i++)
          BodyTypeVehicles( vecBodyType: VehiclesData.eScooter[i],index: i+1,title: "Escooter",),
        AppSize.spaceHeight3(context),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              label: Text(VehiclesData
                  .fuelTypeCodes[VehiclesData.fuelTypeCodes.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: VehiclesData.fuelTypeCodes.keys.first.toString(),
              options: VehiclesData
                  .fuelTypeCodes[VehiclesData.fuelTypeCodes.keys.first]!
                  .toList(),
              onChange: (String? p) {


              },
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput(
              label: Text(VehiclesData
                  .ownership[VehiclesData.ownership.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: VehiclesData.ownership.keys.first.toString(),
              options: VehiclesData
                  .ownership[VehiclesData.ownership.keys.first]!
                  .toList(),
              onChange: (String? p) {


              },
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropDownFormInput(
              label: Text(VehiclesData
                  .parkThisCar[VehiclesData.parkThisCar.keys.first]!
                  .toList()
                  .first
                  .toString()),
              hint: VehiclesData.parkThisCar.keys.first.toString(),
              options: VehiclesData
                  .parkThisCar[VehiclesData.parkThisCar.keys.first]!
                  .toList(),
              onChange: (String? p) {


              },
            ),
          ],
        ),
        AppSize.spaceHeight3(context),




      ],
    );
  }
}





class BodyTypeVehicles extends StatelessWidget {
  const BodyTypeVehicles({super.key,required this.vecBodyType,required this.index,required this.title});
final VecBodyType vecBodyType;
final int index;
final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(3.0),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey)
    ),
    child: Column(children: [
   Row(mainAxisAlignment: MainAxisAlignment.center,children: [

     TextGlobal(
fontWeight: FontWeight.bold,
       text: "${index.toString()} ${title.toString()}",
       fontSize: height(context) * .02,
       color: ColorManager.orangeTxtColor,


     ),
     TextGlobal(
       text: " Vehicle body type ",
       fontSize: height(context) * .02,
       color: ColorManager.grayColor,
       fontWeight: FontWeight.bold,
     ),
   ],),
AppSize.spaceHeight2(context),
      Directionality(
        textDirection: TextDirection.ltr,

        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          TextFormer(controller: vecBodyType.fuel,text: "QHV1-2 Fuel",label: "Enter ${vecBodyType.fuel}",headLabel: title,),
          TextFormer(controller: vecBodyType.model,text: "QHV1-3-Model",label: "Enter ${vecBodyType.model}",headLabel: title,)

        ],),
      ),
      AppSize.spaceHeight1(context),
      Directionality(
        textDirection: TextDirection.ltr,

        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          TextFormer(controller: vecBodyType.fuel,text: "QHV1-4- Annual Mileage",label: "Enter ${vecBodyType.annual}",headLabel: title,),
          TextFormer(controller: vecBodyType.model,text: "QHV1-5- Age of vehicle",label: "Enter ${vecBodyType.ageOfVec}",headLabel: title,)

        ],),
      ),
AppSize.spaceHeight1(context),
      Directionality(
        textDirection: TextDirection.ltr,

        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          TextFormer(controller: vecBodyType.fuel,text: "QHV1-4- Annual Mileage",label: "Enter ${vecBodyType.annual}",headLabel: title,),
          TextFormer(controller: vecBodyType.model,text: "QHV1-5- Age of vehicle",label: "Enter ${vecBodyType.ageOfVec}",headLabel: title,)

        ],),
      ),
    ],)
    );
  }
}

class Q2VecScreen extends StatelessWidget {

  EditingController3 editingController3;
  Q2VecScreen({super.key, required this.editingController3});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextGlobal(
            text: VehiclesData.q2VecData.keys.first,
            fontSize: height(context) * .017,
            color: ColorManager.black,
          ),
        ],
      ),
      AppSize.spaceHeight2(context),
      Field(peopleAdults18: editingController3.peopleAdults18, peopleUnder18: editingController3.peopleUnder18,
          totalNumberOfVecText: "adults (18yrs +) For Work use", totalNumberOfVec: editingController3.totalNumber,
          peopleAdults18Text: "adults (18yrs +)  For Leisure", peopleUnder18Text: "children (under 18yrs)")

    ],);

  }
}