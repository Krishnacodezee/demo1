// Stack(
// children: [
// TextFormField(
// // focusNode: formFocusNodes['country'],
//
// autofocus: false,
// readOnly: true,
// validator: (value) {
// if (countryData.containsKey(value) == false) {
// formFocusNodes['country']!.requestFocus();
// return 'Select a Valid Country Name';
// }
// return null;
// },
// controller: countryController,
// style: formFieldStyle(primaryColor),
// decoration: formFieldDecoration(
// context,
// 'Country',
// suffixIcon: buildCountryPopup(),
// ),
// ),
// Container(
// height: 50,
// width: MediaQuery.of(context).size.width,
// color: Colors.transparent,
// child: buildCountryPopup(hideColor: true),
// ),
// ],
// ),

//
// Widget buildCountryPopup({bool hideColor=false}) {
//   TextEditingController countryController =
//   TextEditingController(text: ConfigProvider.get(context).country);
//   String countryValue = countryController.text;
//   final matchingCountries = countryData.keys.where((country) =>
//       country.toLowerCase().contains(countryValue.toLowerCase()));
//   return PopupMenuButton(
//       icon:  Icon(Icons.arrow_drop_down,color: hideColor?Colors.transparent:Colors.black,),
//       onSelected: (String value) {
//         countryController.text = value;
//       },
//       itemBuilder: (BuildContext context) {
//         return matchingCountries.map((country) {
//           return PopupMenuItem(child: Text(country), value: country);
//         }).toList();
//       });
// }
