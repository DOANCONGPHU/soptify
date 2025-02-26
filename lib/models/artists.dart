class SeveralArtists{
  SeveralArtists({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Results> results;
  late final int totalPages;
  late final int totalResults;
  
  SeveralArtists.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = results.map((e)=>e.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Results {
  Results({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.mediaType,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
     this.profilePath,
    required this.knownFor,
  });
  late final bool adult;
  late final int id;
  late final String name;
  late final String originalName;
  late final String mediaType;
  late final double popularity;
  late final int gender;
  late final String knownForDepartment;
  late final String? profilePath;
  late final List<KnownFor> knownFor;
  
  Results.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    mediaType = json['media_type'];
    popularity = json['popularity'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    knownFor = List.from(json['known_for']).map((e)=>KnownFor.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['media_type'] = mediaType;
    data['popularity'] = popularity;
    data['gender'] = gender;
    data['known_for_department'] = knownForDepartment;
    data['profile_path'] = profilePath;
    data['known_for'] = knownFor.map((e)=>e.toJson()).toList();
    return data;
  }
}

class KnownFor {
  KnownFor({
    required this.adult,
     this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
     this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String? backdropPath;
  late final int id;
  late final String? title;
  late final String originalLanguage;
  late final String? originalTitle;
  late final String overview;
  late final String? posterPath;
  late final String mediaType;
  late final List<int> genreIds;
  late final double popularity;
  late final String? releaseDate;
  late final bool? video;
  late final double? voteAverage;
  late final int voteCount;
  
  KnownFor.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = null;
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = null;
    mediaType = json['media_type'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}