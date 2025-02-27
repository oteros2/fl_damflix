import 'dart:convert';

class MovieResponse {
    Dates dates;
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    MovieResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieResponse.fromJson(String str) => MovieResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "dates": dates.toMap(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toMap() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

class Result {
    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    DateTime releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    get fullPosterImg {
      if (this.posterPath != null) {
        return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
      } return 'https://www.creativefabrica.com/wp-content/uploads/2022/11/26/404-error-not-found-logo-Graphics-48584243-1.jpg';
    }

    get backDropImg {
      if (this.backdropPath != null) {
        return 'https://image.tmdb.org/t/p/w500${this.backdropPath}';
      } return 'https://www.creativefabrica.com/wp-content/uploads/2022/11/26/404-error-not-found-logo-Graphics-48584243-1.jpg';
    }

    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum OriginalLanguage {
    EN,
    ES,
    FR,
    LV
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "es": OriginalLanguage.ES,
    "fr": OriginalLanguage.FR,
    "lv": OriginalLanguage.LV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}