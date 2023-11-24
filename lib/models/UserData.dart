class UserData {
  final String? name;
  final String? comment;
  final String? minutes;
  final String? image;

  UserData({
    this.name,
    this.comment,
    this.minutes,
    this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      comment: json['comment'],
      minutes: json['minutes'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'comment': comment,
        'minutes': minutes,
        'image': image,
      };
}
