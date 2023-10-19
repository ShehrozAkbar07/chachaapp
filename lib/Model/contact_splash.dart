class contactus {
  String? logo;
  String? slogan;
  String? appName;
  String? commission;
  String? address;
  String? number;
  String? email;
  String? imageUrl;

  contactus(
      {this.logo,
      this.slogan,
      this.appName,
      this.commission,
      this.address,
      this.number,
      this.email,
      this.imageUrl});

  contactus.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    slogan = json['slogan'];
    appName = json['appName'];
    commission = json['commission'];
    address = json['address'];
    number = json['number'];
    email = json['email'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['slogan'] = this.slogan;
    data['appName'] = this.appName;
    data['commission'] = this.commission;
    data['address'] = this.address;
    data['number'] = this.number;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
