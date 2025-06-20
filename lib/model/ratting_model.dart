// lib/model/rating_model.dart
import 'dart:convert';

class RatingResponse {
  final int totalRatings;
  final Map<String, dynamic> ratingSummary;
  final List<Rating> ratings;
  final int currentPage;
  final int totalPages;
  final double averageRating;

  RatingResponse({
    required this.totalRatings,
    required this.ratingSummary,
    required this.ratings,
    required this.currentPage,
    required this.totalPages,
    required this.averageRating,
  });

  factory RatingResponse.fromJson(Map<String, dynamic> json) {
    final ratingsJson = json['ratings'] as List;
    Map<String, dynamic> ratingSummary = json['ratingSummary'] as Map<String, dynamic>;

    // Calculate average rating
    double totalScore = 0;
    int totalCount = 0;

    ratingSummary.forEach((key, value) {
      double rating = double.tryParse(key) ?? 0;
      totalScore += rating * (value as int);
      totalCount += value as int;
    });

    double averageRating = totalCount > 0 ? totalScore / totalCount : 0.0;

    return RatingResponse(
      totalRatings: json['totalRatings'] as int,
      ratingSummary: ratingSummary,
      ratings: ratingsJson.map((rating) => Rating.fromJson(rating)).toList(),
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
      averageRating: averageRating,
    );
  }

  Map<String, dynamic> toJson() => {
    'totalRatings': totalRatings,
    'ratingSummary': ratingSummary,
    'ratings': ratings.map((rating) => rating.toJson()).toList(),
    'currentPage': currentPage,
    'totalPages': totalPages,
    'averageRating': averageRating,
  };
}

class Rating {
  final String id;
  final String name;
  final String email;
  final String comments;
  final double rating;
  final String serviceType;
  final DateTime createdAt;
  final DateTime updatedAt;

  Rating({
    required this.id,
    required this.name,
    required this.email,
    required this.comments,
    required this.rating,
    required this.serviceType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      comments: json['comments'] as String,
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'] as double,
      serviceType: json['serviceType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'email': email,
    'comments': comments,
    'rating': rating,
    'serviceType': serviceType,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

RatingResponse ratingResponseFromJson(String str) => RatingResponse.fromJson(json.decode(str));
String ratingResponseToJson(RatingResponse data) => json.encode(data.toJson());