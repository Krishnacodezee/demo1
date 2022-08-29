import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pattern_insert_delete/api/api_key/api_key_controller.dart';
import 'package:pattern_insert_delete/api/api_key/user_api_data.dart';
import 'package:pattern_insert_delete/calander/basic_table_calander.dart';
import 'package:pattern_insert_delete/calander/cmp_table_calander.dart';
import 'package:pattern_insert_delete/theme_data/app_color.dart';
import 'package:sizer/sizer.dart';

import '../../calander/events_table_calander.dart';
import '../../calander/multi_calendar.dart';
import '../../calander/range_example.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    Key? key,
  }) : super(key: key);

  @override
  State<Screen2> createState() => _ApiUIState();
}

class _ApiUIState extends State<Screen2> {
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  List<UserApiData> data = <UserApiData>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Api Calling')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/ic_logo.svg',
            color: Colors.black,
            // matchTextDirection: true,
          ),
          TextButton(
            onPressed: () async {
              weatherApiController();
              // print(data);
              for (var item in data) {
                print('-----------${item.title}');
              }
              setState(() {});
              for (var item in data) {
                print('-----------${item.title}');
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('data'),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableBasicsExample()),
              );
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: Text(' Basic Calander '),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableComplexExample()),
              );
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: Text(' cmp Calander '),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableEventsExample()),
              );
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: Text(' events Calander '),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableMultiExample()),
              );
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: Text(' multi Calander '),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TableRangeExample()),
              );
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.w),
              child: Text(' range Calander '),
            ),
          ),
          //Dropdown menu
          DropdownButton(

            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
                print('--------------> $newValue');
              });
            },
          ),
          //
          // Container(
          //   height: 300,
          //   child: ListView.builder(
          //     itemCount: data.length,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: Container(
          //               color: AppColor.black,
          //               width: MediaQuery.of(context).size.width - 40,
          //               height: 140,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(data[0].id.toString()),
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
