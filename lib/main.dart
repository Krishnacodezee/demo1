import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern_insert_delete/api/api_calling.dart';
import 'package:pattern_insert_delete/api/api_controller.dart';
import 'package:pattern_insert_delete/api/country_api_data.dart';
import 'package:pattern_insert_delete/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_config/flutter_config.dart';
import 'intl/date_symbol_data_local.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // FlutterConfig.loadValueForTesting(
  //     {'BASE_URL': 'https://api.nationalize.io/?name=nathaniel'});

  // await FlutterConfig.loadEnvVariables();
//
//   TimeOfDay noonTime = TimeOfDay(hour: 15, minute: 0); // 3:00 PM
//   TimeOfDay morningTime = TimeOfDay(hour: 5, minute: 0); // 5:00 AM
//
//   print(noonTime.period); // gives DayPeriod.pm
//   print(morningTime.period); // gives DayPeriod.am

  //example 1
  // if (noonTime.period == DayPeriod.am)
  //   print("$noonTime is AM");
  // else
  //   print("$noonTime is PM");
  //
  // //example 2
  // if (morningTime.period == DayPeriod.am)
  //   print("$morningTime is AM");
  // else
  //   print("$morningTime is PM");
  //
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<countryDataProvider>(
        create: (_) => countryDataProvider()),
  ];
  initializeDateFormatting()
      .then((_) => runApp(MultiProvider(providers: providers, child: MyApp())));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return MaterialApp(
//         // localizationsDelegates: GlobalMaterialLocalizations.delegates,
//         supportedLocales: [
//           const Locale('en', 'US'), // American English
//           const Locale('ja', ''), // japanese
//           // ...
//         ],
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.teal,
//         ),
//         home: HomePage(),
//       );
//     });
//   }
// }
//--- random color

// Color.fromARGB(_random.nextInt(256), _random.nextInt(256),
// _random.nextInt(256), _random.nextInt(256))

// ------ text make available size wise
//

// Flexible(
// child: Padding(
// padding: EdgeInsets.all(16.0),
// child: Text(
// 'texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext',
// style: TextStyle(color: Colors.black, fontSize: 12),
// ),
// ),
// ),

//----- app localizatiioon-------

// Scaffold(
// body: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(child: Text('日本語のテキスト翻訳')),
// ],
// ),
// ),

//------

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _random = Random();

  final List _gridItems = List.generate(1000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: GridView.builder(
        itemCount: _gridItems.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (_, index) {
          return Column(
            children: [
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
              Card(
                elevation: 6,
                color: Color.fromARGB(
                    _random.nextInt(256),
                    _random.nextInt(256),
                    _random.nextInt(256),
                    _random.nextInt(256)),
                child: Container(
                    alignment: Alignment.center,
                    child: Text(_gridItems[index])),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterViewModel>(
      create: (BuildContext context) => CounterViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ApiUI(),
        // home: MyHomePage(title: 'Flutter Provider Tutorial'),
      ),
    );
  }
}

// shared pref store data
//Future<String> checkToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String isToken = prefs.getString('isToken') ?? '';
//     print("isToken : " + isToken);
//     return isToken;
//   }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(this.title!),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Consumer<CounterViewModel>(builder: (context, viewModel, child) {
//               return Text(
//                 '${viewModel.counter}',
//                 style: Theme.of(context).textTheme.headline4,
//               );
//             }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: Provider.of<CounterViewModel>(context, listen: false)
//             .incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
