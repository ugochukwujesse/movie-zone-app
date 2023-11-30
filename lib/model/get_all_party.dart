// To parse this JSON data, do
//
//     final getAllParty = getAllPartyFromJson(jsonString);

import 'dart:convert';

GetAllParty getAllPartyFromJson(String str) => GetAllParty.fromJson(json.decode(str));

String getAllPartyToJson(GetAllParty data) => json.encode(data.toJson());

class GetAllParty {
  List<D> d;
  String q;
  int v;

  GetAllParty({
    required this.d,
    required this.q,
    required this.v,
  });

  factory GetAllParty.fromJson(Map<String, dynamic> json) => GetAllParty(
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
  String q;
  String qid;
  int rank;
  String s;
  int y;
  String? yr;

  D({
    required this.i,
    required this.id,
    required this.l,
    required this.q,
    required this.qid,
    required this.rank,
    required this.s,
    required this.y,
    this.yr,
  });

  factory D.fromJson(Map<String, dynamic> json) => D(
    i: I.fromJson(json["i"]),
    id: json["id"],
    l: json["l"],
    q: json["q"],
    qid: json["qid"],
    rank: json["rank"],
    s: json["s"],
    y: json["y"],
    yr: json["yr"],
  );

  Map<String, dynamic> toJson() => {
    "i": i.toJson(),
    "id": id,
    "l": l,
    "q": q,
    "qid": qid,
    "rank": rank,
    "s": s,
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
