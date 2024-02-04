import 'package:flutter/material.dart';

class MyGrassComponent extends StatelessWidget {
  const MyGrassComponent({super.key});

  //final MyGrass myGrass;

  //MyGrassComponent({this.myGrass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  //이전 달 잔디 보여줌
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-1.57),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 18,
                      height: 11.74,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: StarBorder.polygon(
                          sides: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Feb',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                ),
              ),
              GestureDetector(
                onTap: () {
                  //다음 달 잔디 보여줌
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 18,
                      height: 11.74,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: StarBorder.polygon(
                          sides: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
