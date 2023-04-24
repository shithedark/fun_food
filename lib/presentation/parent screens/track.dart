import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fun_food/classes/api.dart';
import 'package:fun_food/main.dart';
import 'package:fun_food/presentation/parent%20screens/main_screen.dart';
import 'package:graphic/graphic.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
    Future<List<dynamic>?>? items;
@override
  void initState() {
    items = API.getMealsByDay(user!.userID, DateTime.now().month.toString(),
        DateTime.now().day.toString(), DateTime.now().year.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.6),
            ),
            child: SafeArea(
                child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
                Text(
                  "Track Servings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                )
              ],
            )),
          ),
        
          Expanded(
                  child: FutureBuilder<List<dynamic>?>(
                future: items,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return  Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 4,
                                      offset: Offset(1, 3),
                                      color: Colors.grey)
                                ],
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      snapshot.data![index]["image_url"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.07,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: snapshot.data![index]
                                                  ["confirmed"].toString() ==
                                              "1"
                                          ? Colors.green.withOpacity(0.8)
                                          : Colors.red.withOpacity(0.8),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data![index]["name"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                      
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(18),
                          width: size.width * 0.5,
                          alignment: Alignment.center,
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 0),
                                    blurRadius: 4,
                                    spreadRadius: 4,
                                    color: Colors.grey)
                              ]),
                          child: const Text(
                            "No Servings Yet !, Add some servings !",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )));
                },
              ))
        ],
      ),
    );
  }
}
