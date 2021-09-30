import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper_widgets.dart';


class HomePage extends StatelessWidget {
  

  final moviesProvider  = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Movies en cines"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), 
          onPressed: (){}
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
          _swiperCards()
          ],
        ),
        )
    );
  }

  Widget _swiperCards() {

    

    moviesProvider.getInCines();

    return FutureBuilder(
      future: moviesProvider.getInCines(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if (snapshot.hasData) {
          return CardSwiper(movies: snapshot.data,);
        }
        else{

          return Container(
            height: 400.0,
            child: Center( 
              child: CircularProgressIndicator()
              )
            );

        }
        
      },
    );

    /*return CardSwiper(
      movies: [1,2,3,4,5,6],
    );*/

  }
}