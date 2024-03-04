import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/modules/helpers/db_helper.dart';
import 'package:quotes_app/modules/utils/fonts.dart';

class FavQuote extends StatefulWidget {
  const FavQuote({Key? key}) : super(key: key);

  @override
  State<FavQuote> createState() => _FavQuoteState();
}

class _FavQuoteState extends State<FavQuote> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fav Quotes"),
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchQuote(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(int.parse(allFonts[index]['bgColor']!)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  height: h / 3,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          snapshot.data![index].quote,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                          ),
                          IconButton(
                            onPressed: () async {
                              await DBHelper.dbHelper.deleteStudentData(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
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
  }
}
