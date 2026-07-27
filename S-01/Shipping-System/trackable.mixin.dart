mixin Trackable {
  double latitude = 0.0;
  double longitude = 0.0;
  String trackingStatus = "Pending";

  void trackLocation() => print("Tracking location...");
}
