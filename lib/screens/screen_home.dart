import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextflix_app/styles/color.dart';
import 'package:nextflix_app/styles/text_color.dart';

import '../widgets/carouse_slider.dart';
import '../widgets/popular_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropDownButton = 'Categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2C2B3B),
          title: const Text('My Nextflix', style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600),),
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.airplay,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: null,
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(gradient: AppColors.mainColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.white)),
                          child: const Center(
                            child: Text(
                              'Series',
                              style: TextApp.textSecon,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 36,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.white)),
                          child: const Center(
                            child: Text(
                              'Series',
                              style: TextApp.textSecon,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 36,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              dropdownColor: const Color(0xff2C2B3B),
                              borderRadius: BorderRadius.circular(10),
                              hint: const Center(
                                  child: Text(
                                'Categories',
                                style: TextStyle(color: Colors.white),
                              )),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              elevation: 0,
                              underline: Container(),
                              value: dropDownButton,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownButton = newValue!;
                                });
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  child: const Text(
                                    'Categories',
                                    style: TextApp.textSecon,
                                  ),
                                  value: 'Categories',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'Anime',
                                    style: TextApp.textSecon,
                                  ),
                                  value: 'Anime',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'Story',
                                    style: TextApp.textSecon,
                                  ),
                                  value: 'Story',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'Honnor',
                                    style: TextApp.textSecon,
                                  ),
                                  value: 'Honnor',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text(
                                    'Science fiction',
                                    style: TextApp.textSecon,
                                  ),
                                  value: 'Science fiction',
                                ),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const screem_CarouseSlider(),
                    const SizedBox(height: 16,),
                    // Popular on nextflix ------------------
                    const Row(
                      children: [
                        Text('Popular on Nextfllx', style: TextApp.title,),
                        SizedBox(width: 99,),
                        Text('View more ', style: TextApp.textSecon,),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 14,),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    const PopularScreen(),
                    const SizedBox(height: 16,),
                    // Retro TV -------------------------------
                    const Row(
                      children: [
                        Text('Retro TV', style: TextApp.title,),
                        SizedBox(width: 194,),
                        Text('View more ', style: TextApp.textSecon,),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 14,),
                      ],
                    ),
                    const PopularScreen(),

                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
