import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:movie/controller/movie_controller.dart';
import 'package:movie/view/home/detail.dart';
import 'package:movie/view/loading.dart';

class movie_subcategories extends StatefulWidget {
  var id,title;
  movie_subcategories({super.key,required this.id,required this.title});

  @override
  State<movie_subcategories> createState() => _movie_subcategoriesState();
}

class _movie_subcategoriesState extends State<movie_subcategories> {
  final movie=Get.put(movie_controller());
  @override
  void initState() {
    movie.movie_subcategories(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: Obx((){
        if(movie.loading.value){
          return isloading();
        }else{
          return CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: movie.Movie.length, (context, index) {
                    final data=movie.Movie[index];
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
                                  Get.to(detail_page(id:data.id ,title: data.title,sub_id: data.subcategories_id));
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
                                        "http://10.0.2.2:8000/Image/Movie/${movie.Movie[index].image}",
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.55,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
