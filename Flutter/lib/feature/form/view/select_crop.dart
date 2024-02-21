import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:enigma/contants/api.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/feature/form/field_model.dart';
import 'package:enigma/feature/form/view/form_view.dart';
import 'package:enigma/feature/home/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../contants/text.dart';
import '../../field/view/field_view.dart';

@RoutePage()
class SelectCropScreen extends StatefulWidget {
  final List<FieldModel> models;
  final int id;
  const SelectCropScreen({
    super.key,
    required this.models,
    required this.id,
  });

  @override
  State<SelectCropScreen> createState() => _SelectCropScreenState();
}

FullInf info = FullInf();

class _SelectCropScreenState extends State<SelectCropScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            children: [
              appBar(context, 'Select Crop'),
              Container(
                color: Colors.white,
                height: 50.h,
              ),
              Container(
                color: Colors.white,
                width: context.screenWidth,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.models.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.green.shade400,
                      ),
                      width: 200,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            'Crop: ${widget.models[index].name!}',
                            style: ConstTextStyle.subTitleTextStyle!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Amount to be spent: ${widget.models[index].spendMoney}',
                            style: ConstTextStyle.subTitleTextStyle!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Amount to be earned: ${widget.models[index].earnMoney}',
                            style: ConstTextStyle.subTitleTextStyle!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: MyTextField(
                  iconName: 'assets/hand_and_plant.svg',
                  hintText: 'Selected Crop Name',
                  color: Colors.grey.shade300.withOpacity(0.7),
                  textEditingController: controller,
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: MyTextField(
                  iconName: 'assets/calendar.svg',
                  hintText: 'Planting date',
                  color: Colors.grey.shade300.withOpacity(0.7),
                  textEditingController: controller2,
                ),
              ),
              SizedBox(height: 230.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: noteButton(
                  title: 'Complete',
                  onTap: () async {
                    sendName(
                      name: controller.text,
                      id: widget.id,
                      date: controller2.text,
                      context: context,
                    );
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
Future<void> sendName({
  required String name,
  required int id,
  required String date,
  required BuildContext context,
}) async {
  Dio dio = Dio();
  Response response = await dio.post(
    '$cahidUrl/field/$id',
    data: {
      'crop': name,
      'plant_date': date,
    },
  );
  final json = response.data;
  info = FullInf(
    cropName: json['name'],
    date: json['plant_date'],
    harvestDate: json['harvest_date'],
    potasium: json['potassium'],
    phosphor: json['phosphorus'],
    nitrogen: json['nitrogen'],
    size: json['area'],
  );
  context.router.pushNamed('/field');
}

class FullInf {
  String? cropName, date, harvestDate;
  int? nitrogen, phosphor, potasium, size;
  FullInf({
    this.cropName,
    this.date,
    this.nitrogen,
    this.size,
    this.phosphor,
    this.potasium,
    this.harvestDate,
  });
}
