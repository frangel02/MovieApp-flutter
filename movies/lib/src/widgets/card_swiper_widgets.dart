import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/models/movies_model.dart';


class CardSwiper extends StatelessWidget {
  //const CardSwiper({ Key? key }) : super(key: key);

  final List<Movie> movies;


  CardSwiper({ @required this.movies});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
    padding: EdgeInsets.only(top: 10.0),
    
      child: new Swiper(
          itemBuilder: (BuildContext context, int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0) ,
              child: FadeInImage(
                placeholder: AssetImage("assets/img/no-image.jpg"),
                fit: BoxFit.cover,
                image: NetworkImage(movies[index].getPosterImg()
                )
              ) 
            );
             
          },
          itemCount: movies.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
          itemWidth: _screenSize.width * 0.07,
          itemHeight: _screenSize.height * 0.5,
          layout: SwiperLayout.STACK,
        ),
    );
  }
}