import 'package:get/get.dart';
import 'package:quotes_app/modules/screens/quote_page/model/font_model.dart';

class FontController extends GetxController {
  FontModel fontModel = FontModel(font: 'poppins', bgColor: '000000');

  changeFont(String family, String bgColor) {
    fontModel.font = family;
    fontModel.bgColor = bgColor;
    update();
  }
}
