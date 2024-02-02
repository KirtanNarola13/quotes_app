import 'package:get/get.dart';
import 'package:quotes_app/modules/screens/quote_page/model/bg_model.dart';

class BgController extends GetxController {
  BgModel bgModel = BgModel(bgColor: '0xffffffff');

  changeColor(String bgColor) {
    bgModel.bgColor = bgColor;
    update();
  }
}
