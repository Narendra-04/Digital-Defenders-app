
class Slide {
  final String image;
  final String text;

  const Slide({
    required this.image,
    required this.text,
  });
}

class SlideData {
  static const List<Slide> slides = [
    Slide(
      image: "assets/images/slide1.png",
      text: "Never share your personal information online.",
    ),
    Slide(
      image: "assets/images/slide2.png",
      text: "Use strong and unique passwords for all accounts.",
    ),
    Slide(
      image: "assets/images/slide3.png",
      text: "Think before clicking on links or downloading files.",
    ),
    Slide(
      image: "assets/images/slide4.png",
      text: "Always ask an adult if something online confuses you.",
    ),
  ];
}
