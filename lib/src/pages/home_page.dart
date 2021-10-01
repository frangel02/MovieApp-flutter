import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper_widgets.dart';
import 'package:movies/src/widgets/movie_horizontal.dart';


class HomePage extends StatelessWidget {
  

  final moviesProvider  = new MoviesProvider();

  

  @override
  Widget build(BuildContext context) {

moviesProvider.getPopulares();

     return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.search ),
            onPressed: () => {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
            _footer(context)
            //_footer(context)
          ],
        ),
      )
       
    );
  }
  

Widget _swiperCards() {

    
return FutureBuilder(
      future: moviesProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          //return CardSwiper( movies: snapshot.data );
          return CardSwiper( movies: snapshot.data );
        } else {
          return Container(
            height: 200.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    );

  }


   Widget _footer(BuildContext context){

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.bodyText1  )
          ),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: moviesProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              if ( snapshot.hasData ) {
                return MovieHorizontal( 
                  movies: snapshot.data,
                  siguientePagina: moviesProvider.getPopulares,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ],
      ),
    );


  }
}