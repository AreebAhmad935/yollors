class Onboarding {
  String image;
  String title;
  String description;

  Onboarding(
      {required this.description, required this.image, required this.title});
}

List<Onboarding> contents = [
  Onboarding(
      description:
          'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the',
      image: 'assets/1.png',
      title: 'Shopping'),
       Onboarding(
      description:
          'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the',
      image: 'assets/2.png',
      title: 'Fast Delivery'),
       Onboarding(
      description:
          'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the',
      image: 'assets/3.png',
      title: 'Online order')
];
