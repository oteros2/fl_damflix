import 'dart:convert';
import 'package:fl_damflix/models/models.dart';

class PopularResponse {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    PopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}