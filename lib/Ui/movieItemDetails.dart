import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';


class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movieItem;

  const  MovieListViewDetails.name(this.movieName,this.movieItem);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("$movieName Movie Details"),
          centerTitle: true,
        ),

        body: ListView(
          children: [
            MovieDetailsThumbnail(movieItem.images[0]),
            MovieDetailsHeaderWithPoster(movieItem),
            HorizontalLine(),
            MovieDetaisCast(movieItem),
            HorizontalLine(),
            MovieDetailsExtraPosters(movieItem.images)

          ],
        )
    );
  }
}


class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  MovieDetailsThumbnail(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
        )
      ],
    );
  }
}


class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  MovieDetailsHeaderWithPoster(this.movie);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(movie.images[0].toString()),
          SizedBox(width: 20,),
          Expanded(child: MovieDetailsHeader(movie)

          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  MoviePoster(this.poster);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius ,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(poster ),
                fit: BoxFit.cover,
              )
          ),

        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {

  final Movie movie;

  MovieDetailsHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
            style:
            TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.cyan
            )
        ),
        Text("${movie.title}",
          style:TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 32

          )  ,
        ),

        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children:<TextSpan> [
              TextSpan(
                  text: "${movie.plot}"
              ),
              TextSpan(
                  text: "More...",
                  style: TextStyle(
                      color: Colors.indigoAccent
                  )
              )
            ]
        )
        )
      ],
    );
  }
}

class MovieDetaisCast extends StatelessWidget {
  final Movie movie;

  MovieDetaisCast(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MovieField("Cast",movie.actors),
          MovieField("Director",movie.director),
          MovieField("Awards",movie.awards),


        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;


  MovieField(this.field, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${field} : ",style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w300,

        ),
        ),

        Expanded(
          child: Text("${value}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w300
            ),
          ),
        )


      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Container(
        height: 0.5,
        color: Colors.grey,

      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> poster;

  MovieDetailsExtraPosters(this.poster);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("More Movie Posters",
          style: TextStyle(
              fontSize: 14,
              color: Colors.black26
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context,index)=>SizedBox(width: 8.0,),
              itemCount: poster.length,
              itemBuilder: (context,index){
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2 ,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(poster[index],),
                            fit: BoxFit.cover

                        )
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],

    );
  }
}