import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/modules/helpers/quote_helper.dart';
import 'package:quotes_app/modules/screens/quote_page/controller/font_controller.dart';
import 'package:quotes_app/modules/screens/quote_page/model/font_model.dart';
import 'package:quotes_app/modules/utils/fonts.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    FontController fontController = Get.put(FontController());
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GetBuilder<FontController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor:
                  Color(int.parse(fontController.fontModel.bgColor)),
              body: FutureBuilder(
                future: QuoteHelper.quoteHelper.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: h / 50,
                            ),
                            Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(20),
                              height: h / 2,
                              child: Text(
                                snapshot.data![index].quote,
                                style: GoogleFonts.getFont(
                                  fontController.fontModel.font,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.ios_share_rounded,
                                    size: 28,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    size: 28,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: h / 18,
                width: w / 4,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  elevation: 0,
                  icon: const Icon(
                    Icons.category,
                    size: 18,
                  ),
                  label: const Text("Category"),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: h / 18,
                    width: w / 8,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.bottomSheet(
                          BottomSheet(
                            dragHandleColor: Colors.white,
                            enableDrag: true,
                            shadowColor: Colors.white,
                            showDragHandle: true,
                            builder: (context) {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 3),
                                itemCount: allFonts.length,
                                itemBuilder: (context, index) {
                                  List<FontModel> font = allFonts
                                      .map(
                                        (e) => FontModel.fromGoogle(data: e),
                                      )
                                      .toList();
                                  return GestureDetector(
                                    onTap: () {
                                      fontController.changeFont(
                                          font[index].font,
                                          font[index].bgColor);
                                      Get.back();
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          int.parse(
                                            font[index].bgColor.toString(),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Abc",
                                        style: GoogleFonts.getFont(
                                          font[index].font.toString(),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            onClosing: () {},
                          ),
                        );
                      },
                      elevation: 0,
                      child: const Icon(
                        Icons.format_paint_outlined,
                        size: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 80,
                  ),
                  Container(
                    height: h / 18,
                    width: w / 8,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.changeTheme(Get.isDarkMode
                            ? ThemeData.light()
                            : ThemeData.dark());
                      },
                      elevation: 0,
                      child: const Icon(
                        Icons.sunny,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
