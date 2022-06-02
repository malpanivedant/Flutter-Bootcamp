class BirdModel {
  final int id;
  final String name;
  final String scientificName;
  final String imageUrl;
  final String info;

// to tak a map and return a strongly typed model
  factory BirdModel.fromJSON(Map<String, dynamic> birdData) {
    return BirdModel(
        id: birdData["id"],
        name: birdData["name"],
        scientificName: birdData["scientificName"],
        info: birdData["info"],
        imageUrl: birdData["imageUrl"]);
  }

  BirdModel(
      {this.id, this.name, this.scientificName, this.imageUrl, this.info});
}
