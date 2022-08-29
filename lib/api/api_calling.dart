import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:pattern_insert_delete/api/api_controller.dart';
import 'package:pattern_insert_delete/api/api_key/screen2.dart';
import 'package:pattern_insert_delete/api/country_api_data.dart';
import 'package:pattern_insert_delete/theme_data/app_images.dart';
import 'package:pattern_insert_delete/utils/app_strings.dart';
import 'package:pattern_insert_delete/theme_data/app_textstyles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ApiUI extends StatefulWidget {
  const ApiUI({
    Key? key,
  }) : super(key: key);

  @override
  State<ApiUI> createState() => _ApiUIState();
}

class _ApiUIState extends State<ApiUI> {
  CountryApiData data = CountryApiData();

  @override
  void initState() {
    callInitState();
    super.initState();
    final countryModal =
        Provider.of<countryDataProvider>(context, listen: false);
    countryModal.getCountryData(context);
  }

  var country_id;
  callInitState() async {
    country_id = data.country ?? [];
    data = await apiController(context);
    print('${data.name}');
    country_id = data.country!;
    print(country_id[0].countryId);
    print(country_id[0].probability);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var allValues = <Widget>[];

    FlutterConfig.variables.forEach((k, v) {
      allValues.add(Text('$k: $v'));
    });
    final countryModal = Provider.of<countryDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppString.title)),
      ),
      body: countryModal.loading
          ? Container(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // ...allValues,
                  // Text('Values of fabric Id: ${FlutterConfig.get('API_URL')}'),
                  TextButton(
                    onPressed: () async {
                      print('-------------------');
                      var country_id = data.country ?? [];
                      data = await apiController(context);
                      print(data);
                      print('${data.name}');
                      print(
                          '--------> data from provider${countryModal.CountryData.name}');
                      country_id = data.country!;
                      // print(country_id[0].countryId);
                      // print(country_id[0].probability);
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                      child: Text(
                        AppString.button_text,
                        style: AppTextStyle().ButtonStyle(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen2()),
                      );
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.w),
                      child: Text('Screen 2'),
                    ),
                  ),
                  Image(
                    image: AssetImage(AppImages.flutter1),
                    height: 40.h,
                    width: 40.w,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: country_id.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text("\$'{country_id[index].countryId}"),
                            // subtitle: Text(
                            //     "---------${country_id[index].probability}"),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
