import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:movie/controller/categories_controller.dart';
import 'package:movie/view/categories/subcategories.dart';
import 'package:movie/view/loading.dart';
class categories extends StatefulWidget {
  categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  final Categoriescontroller=Get.put(categories_controller());
  @override
  void initState() {
    Categoriescontroller.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff11202C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Obx(()=>Categoriescontroller.loading.value?const isloading():GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.55,
          ),
          itemCount: Categoriescontroller.Categories.length,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) {
            final categories=Categoriescontroller.Categories[index];
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){
                          Get.to(subcategories_page(id: categories.id,title:categories.title));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                "http://10.0.2.2:8000/Image/Categories/${categories.image}",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          child: Text(
                            categories.title,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),),
      ),
    );
  }
}
