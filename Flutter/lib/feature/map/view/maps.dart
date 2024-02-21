import 'package:auto_route/auto_route.dart';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:dio/dio.dart';
import 'package:enigma/contants/api.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:enigma/feature/field/view/field_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/maps_provider.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Information inf = Information();
  List<String> titleName = [
    'Rayon',
    'Su səviyyəsi',
    'Aylıq su səviyyəsi',
    'Qərarlaşmış su səviyyəsi(3 həftə ərzində)',
    'Max su səviyyəsi',
    'Torpaq rütubətliyi',
    'Torpaq rütubətliyi(gələn ay)',
    'Daşqın ehtimalı',
  ];

  @override
  Widget build(BuildContext context) {
    List<String?> value = [
      inf.ad,
      inf.suSeviyesi,
      inf.ayliqSu,
      inf.suSeviyyesi3hefte,
      inf.maxSu,
      inf.torpaqRutubetliyi,
      inf.torpaqRutNext,
      inf.dasqinEhtimali,
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade300.withOpacity(0.9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              SizedBox(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Maps',
                      style: ConstTextStyle.titleTextStyle!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Consumer<MapState>(
                builder: (context, mapState, _) {
                  return SimpleMap(
                    instructions: SMapAzerbaijan.instructions,
                    colors: mapState.mapColors,
                    callback: (id, name, tapDetails) async {
                      inf = await apiCall(name: name);
                      setState(() {
                        mapState.updateSelectedArea(id);
                      });
                    },
                  );
                },
              ),
              if (inf.ad != null)
                Container(
                  padding: EdgeInsets.only(top: 50.h),
                  width: context.screenWidth,
                  height: 250,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
                        child: fields(titleName[index], value[index]!)),
                    separatorBuilder: (context, index) => Container(
                      color: Colors.grey[400],
                      width: context.screenWidth,
                      height: 1.h,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Information> apiCall({String? name}) async {
  Dio dio = Dio();
  Response response = await dio.get('$mapsUrl$name');
  return Information.fromJson(response.data[0]);
}

class Information {
  String? ad,
      suSeviyesi,
      torpaqRutubetliyi,
      dasqinEhtimali,
      ayliqSu,
      torpaqRutNext,
      suSeviyyesi3hefte,
      maxSu;
  Information({
    this.ad,
    this.dasqinEhtimali,
    this.suSeviyesi,
    this.torpaqRutubetliyi,
    this.ayliqSu,
    this.maxSu,
    this.suSeviyyesi3hefte,
    this.torpaqRutNext,
  });
  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      ad: json['Rayon'],
      suSeviyesi: json['Su_seviyesi(bu_gun)'],
      dasqinEhtimali: json['Dasqin_Ehtimali'],
      torpaqRutubetliyi: json['Torpaq_rutubetliyi'],
      ayliqSu: json['Aylıq_ortalama_su_seviyesi'],
      maxSu: json['Max_su_seviyyesi'],
      suSeviyyesi3hefte: json['Qerarlasmis_su_seviyyesi(3_hefte_erzinde)'],
      torpaqRutNext: json['Torpaq_rutubetliyi(gelen_ay)'],
    );
  }
}
