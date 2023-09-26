// ignore_for_file: must_be_immutable

import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  List listAccout = [
    [
      Icon(
        Icons.lock_outline,
        size: 30,
        color: colorsItem,
      ),
      'Password',
      Icon(
        Icons.arrow_forward,
        size: 30,
        color: colorsItem,
      ),
    ],
    [
      Icon(
        Icons.email_outlined,
        size: 30,
        color: colorsItem,
      ),
      'Email Address',
      Icon(
        Icons.arrow_forward,
        size: 30,
        color: colorsItem,
      ),
    ],
    [
      Icon(
        Icons.fingerprint,
        size: 30,
        color: colorsItem,
      ),
      'FingerPrint',
      Icon(
        Icons.arrow_forward,
        size: 30,
        color: colorsItem,
      ),
    ],
    [
      Icon(
        Icons.phone_callback_sharp,
        size: 30,
        color: colorsItem,
      ),
      'Support',
      Icon(
        Icons.arrow_forward,
        size: 30,
        color: colorsItem,
      )
    ],
    [
      Icon(
        Icons.logout,
        size: 30,
        color: colorsItem,
      ),
      'Logout',
      Icon(
        Icons.arrow_forward,
        size: 30,
        color: colorsItem,
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: colorBackground,
            expandedHeight: 850,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorsItem,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        //profile
                        Container(
                          alignment: Alignment.bottomRight,
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: colorBackground,
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                              ),
                            ],
                            image: const DecorationImage(
                              image: AssetImage('assets/img/popeye.jpg'),
                            ),
                          ),
                          //change photo
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                        //name accout
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'POPEYE',
                            style: fontTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: List.generate(
                        listAccout.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            //container list
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        //leading icon

                                        listAccout[index][0],
                                        //title

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            listAccout[index][1],
                                            style: fontMenu,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //end icon
                                    listAccout[index][2],
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
