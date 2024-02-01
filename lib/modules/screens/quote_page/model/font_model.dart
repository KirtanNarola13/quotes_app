class FontModel {
  String font;
  String bgColor;

  FontModel({required this.font, required this.bgColor});

  factory FontModel.fromGoogle({required Map data}) {
    return FontModel(font: data['font'], bgColor: data['bgColor']);
  }
}
