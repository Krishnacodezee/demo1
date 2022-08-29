// json response --
// class MentorTimetableApiData {
//   int? id;
//   int? weekday;
//   String? startTime;
//   String? endTime;
//   int? mentor;
//
//   MentorTimetableApiData(
//       {this.id, this.weekday, this.startTime, this.endTime, this.mentor});
//
//   MentorTimetableApiData.fromJson(Map<String, dynamic> json) {
//     id = json['id']??0;
//     weekday = json['weekday']??0;
//     startTime = json['start_time']??'';
//     endTime = json['end_time']??'';
//     mentor = json['mentor']??0;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['weekday'] = this.weekday;
//     data['start_time'] = this.startTime;
//     data['end_time'] = this.endTime;
//     data['mentor'] = this.mentor;
//     return data;
//   }
// }


//api calling
//
// import 'dart:convert';
// import 'package:coffeechat/_theme_data/app_strings.dart';
// import 'package:coffeechat/models/mentor_timetable_api_data.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// Future<MentorTimetableApiData> mentorTimetableApiController() async {
//   var url = Uri.parse('${AppStrings.backend_api}api/mentor-timetable/1');
//
//   MentorTimetableApiData? data;
//   MentorTimetableApiData? myModels;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var token = prefs.getString('token');
//   // Exception Handling here
//   try {
//     var response =
//     await http.get(url, headers: {"Authorization": "Bearer $token"});
//     print(response.body);
//     if (response.statusCode == 200) {
//       myModels = MentorTimetableApiData.fromJson(json.decode(response.body));
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   } catch (e) {
//     print(e.toString());
//     print('No data found');
//   }
//
//   return myModels!;
// }


//
// print data
// import 'package:coffeechat/_theme_data/app_strings.dart';
// import 'package:coffeechat/_theme_data/app_textstyles.dart';
// import 'package:coffeechat/_theme_data/colors.dart';
// import 'package:coffeechat/models/mentor_timetable_api_data.dart';
// import 'package:coffeechat/models/mentor_timetable_repository.dart';
// import 'package:coffeechat/providers/mentor_timetable_api.dart';
// import 'package:coffeechat/utils/calendar_dates.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class MentorTimetableScreen extends StatefulWidget {
//   @override
//   State<MentorTimetableScreen> createState() => _MentorTimetableScreenState();
// }
//
// class _MentorTimetableScreenState extends State<MentorTimetableScreen> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }
//
//   List<Event> _getEventsForRange(DateTime start, DateTime end) {
//     // Implementation example
//     final days = daysInRange(start, end);
//
//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });
//
//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       _selectedEvents.value = _getEventsForRange(start, end);
//     } else if (start != null) {
//       _selectedEvents.value = _getEventsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getEventsForDay(end);
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//     getData();
//   }
//
//   MentorTimetableApiData? data;
//
//   getData() async {
//     data = await mentorTimetableApiController();
//     print(data);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mentor Timetable Screen'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar<Event>(
//             firstDay: kFirstDay,
//             lastDay: kLastDay,
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat,
//             rangeSelectionMode: _rangeSelectionMode,
//             eventLoader: _getEventsForDay,
//             startingDayOfWeek: StartingDayOfWeek.sunday,
//             calendarStyle: const CalendarStyle(
//               outsideDaysVisible: false,
//             ),
//             onDaySelected: _onDaySelected,
//             onRangeSelected: _onRangeSelected,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () => print('${value[index]}'),
//                         // title: Text('${value[index]}'),
//
//                         // subtitle: Text('${data!.startTime!.toString()} - ${data!.endTime!.toString()}'),
//                         title: Text(
//                             '${mentorTimetableJsonRepository[index]["start_time"]} - ${mentorTimetableJsonRepository[index]["end_time"]}'),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           // TextButton(
//           //     onPressed: () async {
//           //       data = await mentorTimetableApiController();
//           //     },
//           //     child: Text('Print mentor Time Table Data')),
//
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//                 width: MediaQuery.of(context).size.width - 32,
//                 height: 100,
//                 child: data == null // Error Handling here
//                     ? Center(
//                     child: Text(AppStrings.unable_to_get_data,
//                         style: TextStyle(fontSize: 18)))
//                     : Container(
//                   color: AppColor.black.withOpacity(0.1),
//                   width: MediaQuery.of(context).size.width - 32,
//                   height: 160,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Id : ${data!.id.toString()}',
//                         style: AppTextStyles().boldTextStyle(),
//                       ),
//                       Text(
//                         'startTime : ${data!.startTime!.toString()}',
//                         style: AppTextStyles().primaryTextStyle(),
//                       ),
//                       Text(
//                         'endtime : ${data!.endTime!.toString()}',
//                         style: AppTextStyles().primaryTextStyle(),
//                       ),
//                       Text(
//                         'weekday : ${data!.weekday!.toString()}',
//                         style: AppTextStyles().primaryTextStyle(),
//                       ),
//                       Text(
//                         'mentor : ${data!.mentor!.toString()}',
//                         style: AppTextStyles().primaryTextStyle(),
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }

