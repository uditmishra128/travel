class SliderModel {
  String? imageAssetPath;
  String? title;
  String? desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath!;
  }

  String getTitle() {
    return title!;
  }

  String getDesc() {
    return desc!;
  }
}

List<SliderModel> getSlides() {
  // ignore: deprecated_member_use
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  //Screen 1
  sliderModel.setDesc("Enjoy your ride for affordable fare through our app.");
  sliderModel.setTitle("Book a Ride");
  sliderModel.setImageAssetPath("assets/images/onBoard/bike_ride.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //Screen 2
  sliderModel
      .setDesc("Request a ride get picked up by nearby community driver.");
  sliderModel.setTitle("Book a Rickshaw");
  sliderModel.setImageAssetPath("assets/images/onBoard/rickshaw.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //Screen 3
  sliderModel.setDesc("Choose your destination, select can type,ready yo go.");
  sliderModel.setTitle("Book a Cab");
  sliderModel.setImageAssetPath("assets/images/onBoard/book_cab.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //Screen 4
  sliderModel.setDesc(
      "Select a place to visit for your vacation with family & friends.");
  sliderModel.setTitle("Choose Vacation Plan");
  sliderModel.setImageAssetPath("assets/images/onBoard/choose_vacation.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  //Screen 5
  sliderModel.setDesc(
      "Our executives will take parcel from your place to deliver with easy & convenient way.");
  sliderModel.setTitle("Book a Parcel");
  sliderModel.setImageAssetPath("assets/images/onBoard/book_parcel.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
