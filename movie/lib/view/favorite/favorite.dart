import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controller/favorite_cotroller.dart';
import 'package:movie/view/home/detail.dart';
import 'package:movie/view/loading.dart';

class favorite extends StatefulWidget {
  favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  final favoriteController=Get.put(favorite_cotroller());
  @override
  void initState() {
    favoriteController.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff11202C),
      ),
      body: Obx((){
        if(favoriteController.loading.value){
          return isloading();
        }else{
          return ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: favoriteController.Favorite.length,
            itemBuilder: (context, index) {
              final favorite=favoriteController.Favorite[index];
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 120,
                  color: Colors.black,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(detail_page(id: favorite.movie_id,title: favorite.movie.title,sub_id: favorite.movie.subcategories_id,));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    width: 180,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            'http://10.0.2.2:8000/Image/Movie/${favorite.movie.image}'
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      favoriteController.far_un(favorite.movie_id);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(Icons.delete_forever,color: Colors.red,),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8,left: 5),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        favorite.movie.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white,fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        favorite.movie.description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white,fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
