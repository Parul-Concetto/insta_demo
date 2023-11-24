import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:insta_demo/models/UserData.dart';
import 'package:insta_demo/ui/common/asset_images.dart';

class UserPostController extends GetxController {
  RxInt current = 0.obs;
  final CarouselController carouselController = CarouselController();
  final count = 0.obs;
  List<UserData> userCommentList = [
    UserData(
        name: 'Jessica Smith',
        comment: 'I remember that day 🔥',
        image: PNGPath.jessica,
        minutes: '10 minutes ago'),
    UserData(
        name: 'Brian Robson',
        comment: 'I love your shirt buddy 😍',
        image: PNGPath.user1,
        minutes: '16m ago'),
    UserData(
        name: 'David Morel',
        comment:
            "Would you believe me if you said you didn't\n really exist and this is all just for a design?",
        image: PNGPath.user2,
        minutes: '30m ago'),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
