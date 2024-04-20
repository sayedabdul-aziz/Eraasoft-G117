class OnboardingModel {
  final String image;
  final String title;
  final String description;
  const OnboardingModel(
      {required this.image, required this.title, required this.description});
}

List<OnboardingModel> pages = [
  const OnboardingModel(
      image: 'assets/on1.svg',
      title: 'ابحث عن دكتور متخصص',
      description:
          'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
  const OnboardingModel(
      image: 'assets/on2.svg',
      title: 'سهولة الحجز',
      description: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.'),
  const OnboardingModel(
      image: 'assets/on3.svg',
      title: 'آمن وسري',
      description: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.')
];
