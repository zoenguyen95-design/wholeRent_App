class House {
  String name;
  String address;
  String imageUrl;

  House(this.name, this.address, this.imageUrl);

  static List<House> generateRecommended() {
    return [
      House('The Anthem House', '6230 Lougheed Hwy , Burnaby',
          'assets/images/house01.jpeg'),
      House('The Anthem House', '6230 Lougheed Hwy , Burnaby',
          'assets/images/house02.jpeg'),
    ];
  }

  static List<House> generateBestOffer() {
    return [
      House('The Anthem House', '6230 Lougheed Hwy , Burnaby',
          'assets/images/offer01.jpeg'),
      House('The Anthem House', '6230 Lougheed Hwy , Burnaby',
          'assets/images/offer02.jpeg'),
    ];
  }
}