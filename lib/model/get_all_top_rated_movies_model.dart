// To parse this JSON data, do
//
//     final getAllTopRatedMovies = getAllTopRatedMoviesFromJson(jsonString);

import 'dart:convert';

GetAllTopRatedMovies getAllTopRatedMoviesFromJson(String str) => GetAllTopRatedMovies.fromJson(json.decode(str));

String getAllTopRatedMoviesToJson(GetAllTopRatedMovies data) => json.encode(data.toJson());

class GetAllTopRatedMovies {
  List<D> d;
  String q;
  int v;

  GetAllTopRatedMovies({
    required this.d,
    required this.q,
    required this.v,
  });

  factory GetAllTopRatedMovies.fromJson(Map<String, dynamic> json) => GetAllTopRatedMovies(
    d: List<D>.from(json["d"].map((x) => D.fromJson(x))),
    q: json["q"],
    v: json["v"],
  );

  Map<String, dynamic> toJson() => {
    "d": List<dynamic>.from(d.map((x) => x.toJson())),
    "q": q,
    "v": v,
  };
}

class D {
  I? i;
  String id;
  String l;
  String s;
  String? q;
  String? qid;
  int? rank;
  int? y;

  D({
    this.i,
    required this.id,
    required this.l,
    required this.s,
    this.q,
    this.qid,
    this.rank,
    this.y,
  });

  factory D.fromJson(Map<String, dynamic> json) => D(
    i: json["i"] == null ? null : I.fromJson(json["i"]),
    id: json["id"],
    l: json["l"],
    s: json["s"],
    q: json["q"],
    qid: json["qid"],
    rank: json["rank"],
    y: json["y"],
  );

  Map<String, dynamic> toJson() => {
    "i": i?.toJson(),
    "id": id,
    "l": l,
    "s": s,
    "q": q,
    "qid": qid,
    "rank": rank,
    "y": y,
  };
}

class I {
  int height;
  String imageUrl;
  int width;

  I({
    required this.height,
    required this.imageUrl,
    required this.width,
  });

  factory I.fromJson(Map<String, dynamic> json) => I(
    height: json["height"],
    imageUrl: json["imageUrl"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "imageUrl": imageUrl,
    "width": width,
  };
}
