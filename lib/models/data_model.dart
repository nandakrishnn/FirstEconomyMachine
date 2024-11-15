class BannerImages {
  final String bannerImage;
  BannerImages({required this.bannerImage});

  factory BannerImages.fromJson(Map<String, dynamic> json) {
    return BannerImages(
      bannerImage: json['banner_image'],
    );
  }
}
