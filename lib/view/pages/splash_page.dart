import 'package:coffee/constant/colors.dart';
import 'package:coffee/view/pages/btn_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) {
              return const BtnNav();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsItem,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'C ',
              style: GoogleFonts.acme(
                fontSize: 60,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'O ',
              style: GoogleFonts.acme(
                fontSize: 60,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'F ',
              style: GoogleFonts.acme(
                fontSize: 60,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'F ',
              style: GoogleFonts.acme(
                fontSize: 60,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'E ',
              style: GoogleFonts.acme(
                fontSize: 60,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'E ',
              style: GoogleFonts.acme(
                fontSize: 60,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
