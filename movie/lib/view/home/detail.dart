import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:movie/controller/favorite_cotroller.dart';
import 'package:movie/controller/movie_controller.dart';
import 'package:movie/view/favorite/favorite.dart';
import 'package:movie/view/home/play.dart';
import 'package:movie/view/loading.dart';

import '../test.dart';

class detail_page extends StatefulWidget {
  var id, title, sub_id;
  detail_page(
      {super.key, required this.id, required this.title, required this.sub_id});
  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  final movie = Get.put(movie_controller());
  final favorite=Get.put(favorite_cotroller());
  @override
  void initState() {
    movie.detail(widget.id);
    movie.movie_subcategories(widget.sub_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff11202C),
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(()=>movie.loading.value?isloading():CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList.builder(
            itemCount: movie.MovieDetail.length,
            itemBuilder: (context, index) {
              final data = movie.MovieDetail[index];
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                'http://10.0.2.2:8000/Image/Movie/${data.image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap:(){
                                favorite.far_un(data.id);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: data.favorite.length==0?Icon(Icons.favorite_border):Icon(Icons.favorite,color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                    child: MaterialButton(
                      onPressed: () {
                        String videoUrl = 'http://10.0.2.2:8000/Video/video1.mp4';
                        // Get.to(MyScreen(movie:videoUrl));
                        print(data.video);
                      },
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      minWidth: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Release Date: January 1, 2024',
                          style:
                          TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Rating: ⭐ 8.5/10',
                          style:
                          TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          data.description,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),),
    );
  }
}
