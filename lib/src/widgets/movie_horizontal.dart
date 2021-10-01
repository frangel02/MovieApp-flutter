import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';


class MovieHorizontal extends StatelessWidget {



final List<Movie> movies;
final Function siguientePagina;



 MovieHorizontal({ @required this.movies, @required this.siguientePagina });

   final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );
    

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener( () {

      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ){
        siguientePagina();
      }

    });
  


    return Container(
      height: _screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _tarjetas(context),
        itemCount: movies.length,
        itemBuilder: ( context, i ) => _tarjeta(context, movies[i] ),
      ),
    );
  }



List<Widget> _tarjetas(BuildContext context) {

    return movies.map( (pelicula) {

      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage( pelicula.getPosterImg() ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );


    }).toList();

  }


  Widget _tarjeta(BuildContext context, Movie movie) {
    
    movie.uniqueId = '${ movie.id }-poster';

    final tarjeta = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: movie.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage( movie.getPosterImg() ),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 225.0,
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );

    return GestureDetector(
      child: tarjeta,
      onTap: (){

        Navigator.pushNamed(context, 'detalle', arguments: movie );

      },
    );

  }

}