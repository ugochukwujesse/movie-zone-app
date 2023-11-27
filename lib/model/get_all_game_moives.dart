// To parse this JSON data, do
//
//     final getAllGameMovies = getAllGameMoviesFromJson(jsonString);

import 'dart:convert';

GetAllGameMovies getAllGameMoviesFromJson(String str) => GetAllGameMovies.fromJson(json.decode(str));

String getAllGameMoviesToJson(GetAllGameMovies data) => json.encode(data.toJson());

class GetAllGameMovies {
  List<D> d;
  String q;
  int v;

  GetAllGameMovies({
    required this.d,
    required this.q,
    required this.v,
  });

  factory GetAllGameMovies.fromJson(Map<String, dynamic> json) => GetAllGameMovies(
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
  I i;
  String id;
  String l;
  String s;
  String? q;
  String? qid;
  int? rank;
  int? y;
  String? yr;

  D({
    required this.i,
    required this.id,
    required this.l,
    required this.s,
    this.q,
    this.qid,
    this.rank,
    this.y,
    this.yr,
  });

  factory D.fromJson(Map<String, dynamic> json) => D(
    i: I.fromJson(json["i"]),
    id: json["id"],
    l: json["l"],
    s: json["s"],
    q: json["q"],
    qid: json["qid"],
    rank: json["rank"],
    y: json["y"],
    yr: json["yr"],
  );

  Map<String, dynamic> toJson() => {
    "i": i.toJson(),
    "id": id,
    "l": l,
    "s": s,
    "q": q,
    "qid": qid,
    "rank": rank,
    "y": y,
    "yr": yr,
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
