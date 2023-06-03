class RandomJokesModel {
  RandomJokesModel({
    required this.id,
    required this.joke,
  });

  int id;
  String joke;

  factory RandomJokesModel.fromJson(Map<String, dynamic> json) =>
      RandomJokesModel(
        id: json["id"],
        joke: json["joke"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "joke": joke,
      };
}
