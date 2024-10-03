// import 'package:ecommerce/constand/color.dart';
// import 'package:ecommerce/controller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class changes_password extends StatefulWidget {
//   changes_password({super.key});
//
//   @override
//   State<changes_password> createState() => _changes_passwordState();
// }
//
// class _changes_passwordState extends State<changes_password> {
//   final  controller = Get.put(auth_controller());
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title:  Text("Confirm Passsword".tr),
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               height: MediaQuery.of(context).size.height*0.8,
//               width: double.infinity,
//               child:Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       obscureText: true,
//                       controller: controller.old,
//                       decoration: InputDecoration(
//                         hintText: 'Old Password'.tr,
//                         prefixIcon:  Icon(
//                           Icons.password,
//                           color: TColor.KPrimarykeycolor,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey.shade400),
//                         ),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       obscureText: controller.isHidden,
//                       controller: controller.password,
//                       decoration: InputDecoration(
//                         hintText: 'New Password'.tr,
//                         prefixIcon:  Icon(
//                           Icons.password,
//                           color: TColor.KPrimarykeycolor,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey.shade400),
//                         ),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       obscureText: controller.isHidden,
//                       controller: controller.confirm,
//                       decoration: InputDecoration(
//                         hintText: 'Confirm Password'.tr,
//                         prefixIcon:  Icon(
//                           Icons.password,
//                           color: TColor.KPrimarykeycolor,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey.shade400),
//                         ),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               controller.isHidden
//                                   ? controller.isHidden = false
//                                   : controller.isHidden = true;
//                             });
//                           },
//                           icon: controller.isHidden
//                               ? const Icon(Icons.visibility)
//                               : const Icon(
//                             Icons.visibility_off_outlined,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           controller.changes_password();
//                         });
//                       },
//                       child: Obx(
//                             () => controller.isLoading.value
//                             ? Container(
//                           height: 20,
//                           width: 20,
//                           child: const CircularProgressIndicator(),
//                         )
//                             : Text(
//                           'Savec Changes'.tr,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       color: Colors.cyan,
//                       minWidth: double.infinity,
//                       height: 50,
//                       elevation: 0,
//                       shape: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
