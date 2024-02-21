import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:enigma/contants/api.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:enigma/feature/field/view/field_view.dart';
import 'package:enigma/feature/form/field_model.dart';
import 'package:enigma/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widget/text_field.dart';

@RoutePage()
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

List<String> hintTexts = [
  'Field',
  'Area',
  'ID',
];
List<String> titleTexts = [
  'Location of field',
  'Area of field(with hectare)',
  'Device ID',
];
List<String> iconName = [
  'assets/location.svg',
  'assets/area.svg',
  'assets/device_id.svg',
];
List<FieldModel> models = [];

class _FormScreenState extends State<FormScreen> {
  TextEditingController locField = TextEditingController();
  TextEditingController areaField = TextEditingController();
  TextEditingController idField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [
      locField,
      areaField,
      idField,
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade300.withOpacity(0.9),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            children: [
              appBar(context, 'Add Field'),
              Container(
                color: Colors.white,
                width: context.screenWidth,
                height: 350,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return textAndField(index, controllers[index]);
                  },
                ),
              ),
              SizedBox(height: 210.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                height: 60,
                child: noteButton(
                  title: 'Submit',
                  onTap: () async {
                    getRecommend(controllers, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//function
Future<void> getRecommend(
    List<TextEditingController> a, BuildContext context) async {
  Dio dio = Dio();
  Response response = await dio.post(
    "$cahidUrl/field",
    data: {
      'loc': a[0].text,
      'area': int.parse(a[1].text),
      'arduino_id': int.parse(a[2].text),
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> jsonData = response.data['recommend'];
    for (var itemData in jsonData) {
      models.add(
        FieldModel(
          id: response.data['id'],
          name: itemData['name'],
          spendMoney: itemData['money_spend'],
          earnMoney: itemData['price'],
        ),
      );
    }
    context.router.push(
      SelectCropRoute(
        models: models,
        id: response.data['id'],
      ),
    );
  }
}

Padding textAndField(int index, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(titleTexts[index], style: ConstTextStyle.titleTextStyle),
        SizedBox(height: 10.h),
        MyTextField(
          hintText: hintTexts[index],
          iconName: iconName[index],
          textEditingController: controller,
          color: Colors.grey.shade300.withOpacity(0.7),
        ),
      ],
    ),
  );
}

ElevatedButton noteButton({required String title, void Function()? onTap}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        )),
    onPressed: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title == 'Submit'
            ? const Icon(
                Icons.add_circle,
                color: Colors.white,
              )
            : const SizedBox(),
        SizedBox(width: 5.w),
        Text(
          title,
          style: ConstTextStyle.titleTextStyle!.copyWith(color: Colors.white),
        ),
      ],
    ),
  );
}
