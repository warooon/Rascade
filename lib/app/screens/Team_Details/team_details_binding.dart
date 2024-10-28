import 'package:get/get.dart';
import 'package:rascade/app/screens/Team_Details/team_details_controller.dart';

class TeamDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamDetailsController>(
      () => TeamDetailsController(),
    );
  }
}
