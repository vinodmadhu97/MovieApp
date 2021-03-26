import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'movieItemDetails.dart';

class MovieListView extends StatelessWidget {
  //taking movie data from model class static function
  final List<Movie> movieList = Movie.getmMovieList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),

      body: Container(
        color: Colors.blueGrey.shade900,
        child: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context,index){
              return Stack(
                  children: [
                    Positioned(

                        child: movieCard(context, movieList[index])
                    ),
                    Positioned(
                      top: 10,left: 10,
                        child: movieCardImage(movieList[index].images[0])
                    ),


                  ]);


              /*return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Container(
                      //width: 300,
                      //height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),

                        image: DecorationImage(
                          image: NetworkImage(movieList[index].images[0]),
                          fit: BoxFit.fill,

                        )
                      ),
                    ),
                  ),
                  title: Text("${movieList[index].title}"),
                  subtitle: Text("${movieList[index].director}"),
                  trailing: Icon(Icons.play_circle_outline),

                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context){
                          return MovieListViewDetails.name(movieList[index].title,movieList[index]);
                        }
                        ),
                    );
                  },
                ),
              );*/
            }),
      ),
    );
  }

  Widget movieCard(BuildContext context,Movie movieItem){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,

        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(left: 54.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(movieItem.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text("Rating : ${movieItem.imdbRating} / 10",
                    style: mainTextStyle(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Released ${movieItem.released}",
                    style: mainTextStyle(),
                    ),
                    Text(movieItem.runtime,
                      style: mainTextStyle(),
                    ),
                    Text(movieItem.rated,
                      style: mainTextStyle(),)
                  ],
                )

              ],
            ),
          ),
        ),
      ) ,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context){
              return MovieListViewDetails.name(movieItem.title, movieItem);
            }

            ),
        );
      } ,
    );
  }

  Widget movieCardImage(String imgUrl){

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          //passed the default image if original is doent loaded
          image: NetworkImage(imgUrl ?? "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg"),
          fit: BoxFit.cover
        )
      ),
    );
  }

  TextStyle mainTextStyle(){
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
  }
}















