class Parcel {
  double? mass;
  double? height;
  double? length;
  double? width;

  Parcel({this.height, this.length, this.mass, this.width});

  Map<String, dynamic> toMap() {
    return {
      "mass":mass,
      "height":height,
      "length":length,
      "width":width
    };
  }
}
