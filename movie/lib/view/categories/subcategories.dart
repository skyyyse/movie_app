import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:movie/controller/subcategories_controller.dart';
import 'package:movie/view/home/movie.dart';
import 'package:movie/view/home/movie_id.dart';
import 'package:movie/view/loading.dart';

class subcategories_page extends StatefulWidget {
  var id,title;
  subcategories_page({super.key, required this.id,required this.title});

  @override
  State<subcategories_page> createState() => _subcategories_pageState();
}

class _subcategories_pageState extends State<subcategories_page> {
  final subcategories = Get.put(subcategories_controller());
  @override
  void initState() {
    subcategories.get(widget.id);
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff11202C),
        elevation: 0,
        title:  Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Obx(
          () => subcategories.loading.value
              ? isloading()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: subcategories.Subcategories.length,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    final data = subcategories.Subcategories[index];
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
                                  Get.to(movie_subcategories(id:data.id,title: data.title,));
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
                                        "http://10.0.2.2:8000/Image/Categories/img1.jpg",
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
                                    'Super/Man: The Christopher Reeve Story Movie Poste...',
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
                ),
        ),
      ),
    );
  }
}
