class VideoMovies {
  VideoMovies({
    required this.id,
    required this.results,
  });
  late final int id;
  late final List<Results> results;
  
  VideoMovies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  get id1 => null;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['results'] = results.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Results {
  Results({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });
  late final String iso_639_1;
  late final String iso_3166_1;
  late final String name;
  late final String key;
  late final String site;
  late final int size;
  late final String type;
  late final bool official;
  late final String publishedAt;
  late final String id;
  
  Results.fromJson(Map<String, dynamic> json){
    iso_639_1 = json['iso_639_1'];
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['iso_639_1'] = iso_639_1;
    data['iso_3166_1'] = iso_3166_1;
    data['name'] = name;
    data['key'] = key;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['published_at'] = publishedAt;
    data['id'] = id;
    return data;
  }
}