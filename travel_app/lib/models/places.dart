class Places {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  int? selectedPeople;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;

  Places(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.people,
      this.selectedPeople,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    people = json['people'];
    selectedPeople = json['selected_people'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
