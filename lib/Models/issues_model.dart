


import 'dart:convert';

IssuesModel issuesModelFromJson(String str) => IssuesModel.fromJson(json.decode(str));

class IssuesModel {
    IssuesModel({
        required this.error,
        required this.limit,
        required this.offset,
        required this.numberOfPageResults,
        required this.numberOfTotalResults,
        required this.statusCode,
        required this.results,
        required this.version,
    });

    String error;
    int limit;
    int offset;
    int numberOfPageResults;
    int numberOfTotalResults;
    int statusCode;
    List<Result> results;
    String version;
    
    

     factory IssuesModel.fromJson(String str) => IssuesModel.fromJson(json.decode(str));
    factory IssuesModel.fromMap(Map<String, dynamic> json) => IssuesModel(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        version: json["version"],
    );


}

class Result {
    Result({
        required this.aliases,
        required this.apiDetailUrl,
        required this.coverDate,
        required this.dateAdded,
        required this.dateLastUpdated,
        required this.deck,
        required this.description,
        required this.hasStaffReview,
        required this.id,
        required this.image,
        required this.associatedImages,
        required this.issueNumber,
        required this.name,
        required this.siteDetailUrl,
        required this.storeDate,
        required this.volume,
    });

    dynamic aliases;
    String apiDetailUrl;
    DateTime? coverDate;
    DateTime dateAdded;
    DateTime? dateLastUpdated;
    dynamic deck;
    String description;
    bool hasStaffReview;
    int id;
    Image image;
    List<AssociatedImage> associatedImages;
    String issueNumber;
    String name;
    String siteDetailUrl;
    DateTime? storeDate;
    Volume volume;

   factory Result.fromJson(String str) => Result.fromJson(json.decode(str));
    factory Result.fromMap(Map<String, dynamic> json) => Result(
        aliases: json["aliases"]?? "",
        apiDetailUrl: json["api_detail_url"]?? "",
        coverDate: json["cover_date"] == null ? DateTime(0) : DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"]?? "",
        description: json["description"] ?? "",
        hasStaffReview: json["has_staff_review"],
        id: json["id"]?? "",
        image: Image.fromMap(json["image"]),
        associatedImages: List<AssociatedImage>.from(json["associated_images"].map((x) => AssociatedImage.fromMap(x))),
        issueNumber: json["issue_number"],
        name: json["name"] ?? "",
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"] == null ?DateTime(0): DateTime.parse(json["store_date"]),
        volume: Volume.fromMap(json["volume"]),
    );

  
}

class AssociatedImage {
    AssociatedImage({
        required this.originalUrl,
        required this.id,
        required this.caption,
        required this.imageTags,
    });

    String originalUrl;
    int id;
    dynamic caption;
    ImageTags? imageTags;

    factory AssociatedImage.fromJson(String str) =>  AssociatedImage.fromJson(json.decode(str));

    factory AssociatedImage.fromMap(Map<String, dynamic> json) => AssociatedImage(
        originalUrl: json["original_url"]?? "",
        id: json["id"]?? "",
        caption: json["caption"]?? "",
        imageTags: imageTagsValues.map[json["image_tags"]],
    );

  
}

// ignore: constant_identifier_names
enum ImageTags { ALL_IMAGES }

final imageTagsValues = EnumValues({
    "All Images": ImageTags.ALL_IMAGES
});

class Image {
    Image({
        required this.iconUrl,
        required this.mediumUrl,
        required this.screenUrl,
        required this.screenLargeUrl,
        required this.smallUrl,
        required this.superUrl,
        required this.thumbUrl,
        required this.tinyUrl,
        required this.originalUrl,
        required this.imageTags,
    });

    String iconUrl;
    String mediumUrl;
    String screenUrl;
    String screenLargeUrl;
    String smallUrl;
    String superUrl;
    String thumbUrl;
    String tinyUrl;
    String originalUrl;
    ImageTags? imageTags;

    factory Image.fromJson(String str) => Image.fromJson(json.decode(str));

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"]?? "",
        mediumUrl: json["medium_url"]?? "",
        screenUrl: json["screen_url"]?? "",
        screenLargeUrl: json["screen_large_url"]?? "",
        smallUrl: json["small_url"]?? "",
        superUrl: json["super_url"]?? "",
        thumbUrl: json["thumb_url"]?? "",
        tinyUrl: json["tiny_url"]?? "",
        originalUrl: json["original_url"]?? "",
        imageTags: imageTagsValues.map[json["image_tags"]],
    );

   
}

class Volume {
    Volume({
        required this.apiDetailUrl,
        required this.id,
        required this.name,
        required this.siteDetailUrl,
    });

    String apiDetailUrl;
    int id;
    String name;
    String siteDetailUrl;
    
    factory Volume.fromJson(String str) => Volume .fromJson(json.decode(str));
    factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"]?? "",
        id: json["id"]?? "",
        name: json["name"]?? "",
        siteDetailUrl: json["site_detail_url"]?? "",
    );

   
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        // ignore: prefer_conditional_assignment
        if (reverseMap == null) {
            reverseMap = map.map((k, v) =>  MapEntry(v, k));
        }
        return reverseMap;
    }
}
