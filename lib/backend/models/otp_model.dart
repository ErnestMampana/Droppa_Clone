class OtpModel {
  String? pinKey;
  OtpModel(this.pinKey);
  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(json["PinKey"]);
  }
}