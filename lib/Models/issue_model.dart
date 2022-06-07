
import 'dart:convert';


IssueModel issuesModelFromJson(String str) => IssueModel.fromJson(json.decode(str));


class IssueModel {
    IssueModel({
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
    Results results;
    String version;

         
         
    factory IssueModel.fromJson(String str) => IssueModel.fromJson(json.decode(str));
    factory IssueModel.fromMap(Map<String, dynamic> json) => IssueModel(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: Results.fromMap(json["results"]),
        version: json["version"],
    );

    
}

class Results {
    Results({
        required this.aliases,
        required this.apiDetailUrl,
        required this.associatedImages,
        required this.characterCredits,
        required this.characterDiedIn,
        required this.conceptCredits,
        required this.coverDate,
        required this.dateAdded,
        required this.dateLastUpdated,
        required this.deck,
        required this.description,
        required this.firstAppearanceCharacters,
        required this.firstAppearanceConcepts,
        required this.firstAppearanceLocations,
        required this.firstAppearanceObjects,
        required this.firstAppearanceStoryarcs,
        required this.firstAppearanceTeams,
        required this.hasStaffReview,
        required this.id,
        required this.image,
        required this.issueNumber,
        required this.locationCredits,
        required this.name,
        required this.objectCredits,
        required this.personCredits,
        required this.siteDetailUrl,
        required this.storeDate,
        required this.storyArcCredits,
        required this.teamCredits,
        required this.teamDisbandedIn,
        required this.volume,
    });

    dynamic aliases;
    String apiDetailUrl;
    List<AssociatedImage> associatedImages;
    List<Volume> characterCredits;
    List<dynamic> characterDiedIn;
    List<Volume> conceptCredits;
    DateTime? coverDate;
    DateTime dateAdded;
    DateTime dateLastUpdated;
    dynamic deck;
    String description;
    dynamic firstAppearanceCharacters;
    dynamic firstAppearanceConcepts;
    dynamic firstAppearanceLocations;
    dynamic firstAppearanceObjects;
    dynamic firstAppearanceStoryarcs;
    dynamic firstAppearanceTeams;
    bool hasStaffReview;
    int id;
    Image image;
    String issueNumber;
    List<Volume> locationCredits;
    String name;
    List<dynamic> objectCredits;
    List<Volume> personCredits;
    String siteDetailUrl;
    dynamic storeDate;
    List<dynamic> storyArcCredits;
    List<dynamic> teamCredits;
    List<dynamic> teamDisbandedIn;
    Volume volume;

    factory Results.fromMap(Map<String, dynamic> json) => Results(
        aliases: json["aliases"]??"",
        apiDetailUrl: json["api_detail_url"]??"",
        associatedImages: List<AssociatedImage>.from(json["associated_images"].map((x) => AssociatedImage.fromMap(x))),
        characterCredits: List<Volume>.from(json["character_credits"].map((x) => Volume.fromMap(x))),
        characterDiedIn: List<dynamic>.from(json["character_died_in"].map((x) => x)),
        conceptCredits: List<Volume>.from(json["concept_credits"].map((x) => Volume.fromMap(x))),
        coverDate: json["cover_date"] == null ? DateTime(0) : DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"]??"",
        description: json["description"]??"",
        firstAppearanceCharacters: json["first_appearance_characters"]??"",
        firstAppearanceConcepts: json["first_appearance_concepts"]??"",
        firstAppearanceLocations: json["first_appearance_locations"]??"",
        firstAppearanceObjects: json["first_appearance_objects"]??"",
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"]??"",
        firstAppearanceTeams: json["first_appearance_teams"]??"",
        hasStaffReview: json["has_staff_review"]??"",
        id: json["id"]??"",
        image: Image.fromMap(json["image"]),
        issueNumber: json["issue_number"]??"",
        locationCredits: List<Volume>.from(json["location_credits"].map((x) => Volume.fromMap(x))),
        name: json["name"]??"",
        objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),
        personCredits: List<Volume>.from(json["person_credits"].map((x) => Volume.fromMap(x))),
        siteDetailUrl: json["site_detail_url"]??"",
        storeDate: json["store_date"]??"",
        storyArcCredits: List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        teamCredits: List<dynamic>.from(json["team_credits"].map((x) => x)),
        teamDisbandedIn: List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
        volume: Volume.fromMap(json["volume"]),
    );

   factory Results.fromJson(String str) => Results.fromJson(json.decode(str));
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
    String imageTags;

    factory AssociatedImage.fromMap(Map<String, dynamic> json) => AssociatedImage(
        originalUrl: json["original_url"]??"",
        id: json["id"]??"",
        caption: json["caption"]??"",
        imageTags: json["image_tags"]??"",
    );

  
   factory AssociatedImage.fromJson(String str) => AssociatedImage.fromJson(json.decode(str));
}

class Volume {
    Volume({
        required this.apiDetailUrl,
        required this.id,
        required this.name,
        required this.siteDetailUrl,
        required this.role,
    });

    String apiDetailUrl;
    int id;
    String name;
    String siteDetailUrl;
    String role;

    factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"]??"",
        id: json["id"]??"",
        name: json["name"]??"",
        siteDetailUrl: json["site_detail_url"]??"",
        role: json["role"] ?? "",
    );

  factory  Volume.fromJson(String str) =>  Volume.fromJson(json.decode(str));
   
}

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
    String imageTags;

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"]??"",
        mediumUrl: json["medium_url"]??"",
        screenUrl: json["screen_url"]??"",
        screenLargeUrl: json["screen_large_url"]??"",
        smallUrl: json["small_url"]??"",
        superUrl: json["super_url"]??"",
        thumbUrl: json["thumb_url"]??"",
        tinyUrl: json["tiny_url"]??"",
        originalUrl: json["original_url"]??"",
        imageTags: json["image_tags"]??"",
    );
    factory  Image.fromJson(String str) => Image.fromJson(json.decode(str));

}
