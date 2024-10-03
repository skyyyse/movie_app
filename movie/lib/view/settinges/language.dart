// import 'package:ecommerce/controller/SharedPreferences.dart';
// import 'package:ecommerce/model/translations_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
//
// class language extends StatelessWidget {
//   language({super.key});
//   final prefsController = Get.put(SharedPreferences_controller());
//   List<languages> list = [
//     languages(name: "khmer", img: "assets/language/cambodia.png", key: "KH"),
//     languages(name: "English", img: "assets/language/usa.png", key: "US"),
//     languages(name: "China", img: "assets/language/china.png", key: "CH"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Color(0XFFe5e5e5),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text("Language".tr),
//         centerTitle: true,
//       ),
//       body: ListView.builder(physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),itemCount: list.length,itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: InkWell(
//             onTap: (){
//               Get.updateLocale(Locale(list[index].key));
//               prefsController.setLanguages(list[index].key);
//               Get.back();
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//               ),
//               height: 60,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Image(
//                           image: AssetImage(list[index].img),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(list[index].name.tr),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(Icons.arrow_forward_ios_sharp),
//                   ),
//                 ],
//               )
//             ),
//           ),
//         );
//       },),
//     );
//   }
// }
