import 'package:flutter/material.dart';
import 'package:untitled/common/const/colors.dart';
import 'package:untitled/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/logo/logo.png', width: MediaQuery.of(context).size.width/2,),
            const SizedBox(
              height: 16.0,
            ),
            const CircularProgressIndicator(color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
