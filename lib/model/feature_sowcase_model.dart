class FeatureShowcaseModel {
  final String imgSrc;
  final String title;
  final String subTitle;
  final String btnPrimaryTitle;
  final String btnSecondaryTitle;
  final Function onPrimaryBtnTap;
  final Function onSecondaryBtnTap;

  FeatureShowcaseModel(
      {required this.imgSrc,
      required this.btnPrimaryTitle,
      required this.btnSecondaryTitle,
      required this.subTitle,
      required this.title,
      required this.onPrimaryBtnTap,
      required this.onSecondaryBtnTap});
}
