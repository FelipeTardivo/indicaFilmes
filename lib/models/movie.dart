class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String relaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.relaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      relaseDate: json["release_date"],
      voteAverage: json["vote_average"],
    );
  }


}


/* REFERÊNCIAS DO FORMATO DA API TMDB

            "backdrop_path": "/nA0RDmSDqpN5tLun4sCqdPekObD.jpg",
            "id": 592831,
            "title": "Megalopolis",
            "original_title": "Megalopolis",
            "overview": "Genius artist Cesar Catilina seeks to leap the City of New Rome into a utopian, idealistic future, while his opposition, Mayor Franklyn Cicero, remains committed to a regressive status quo, perpetuating greed, special interests, and partisan warfare. Torn between them is socialite Julia Cicero, the mayor’s daughter, whose love for Cesar has divided her loyalties, forcing her to discover what she truly believes humanity deserves.",
            "poster_path": "/8Sok3HNA3r1GHnK2lCytHyBz1A.jpg",
            "media_type": "movie",
            "adult": false,
            "original_language": "en",
            "genre_ids": [
                878,
                18
            ],
            "popularity": 74.879,
            "release_date": "2024-09-25",
            "video": false,
            "vote_average": 5.6,
            "vote_count": 379

*/