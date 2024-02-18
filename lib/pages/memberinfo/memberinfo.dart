import 'package:flutter/material.dart';
import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/service/user_service.dart';

class MemberInfoForm extends StatefulWidget {
  static const String url = '/memberinfo';

  const MemberInfoForm({super.key});
  @override
  _MemberInfoFormState createState() => _MemberInfoFormState();
}

class _MemberInfoFormState extends State<MemberInfoForm> {
  final bool _bottomSheetVisible = false;
  final nicknameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF278740), // 그라데이션 시작 색
                  Color(0xFF7EB78D), // 그라데이션 종료 색
                ],
                stops: [0.5, 1.0], // 그라데이션 위치
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '회원 정보 입력',
                    style: TextStyle(
                      fontFamily: 'Kantumruy',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // 이미지 추가 기능 구현
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '닉네임',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 341,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20), // 패딩 설정
                        child: TextField(
                          controller: nicknameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '닉네임을 입력하세요',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '거주 지역',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 341,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20), // 패딩 설정
                        child: TextField(
                          controller: addressController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '서울시는 구까지, 그 외는 시까지 입력하세요',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // 화면 가운데 정렬을 위해 추가
                  Container(
                    width: 341,
                    height: 68,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE3A0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        String nickname = nicknameController.text; // 가입하기 버튼 클릭 시 동작
                        String address = addressController.text; // 사용자가 입력한 주소
                        String uid = UserService.instance.uid; // 사용자 uid

                        getUserInfo(nickname, uid, address); // 사용자 정보 저장 함수 호출
                      },
                      child: const Text(
                        '가입하기',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BottomSheetWidget extends StatefulWidget {
//   const BottomSheetWidget({super.key});

//   @override
//   _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
// }

// class _BottomSheetWidgetState extends State<BottomSheetWidget> {
//   String selectedCity = '서울시'; // 초기 선택 시 서울시로 설정

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 20),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               '지역 선택',
//               style: TextStyle(
//                 fontFamily: 'Kantumruy',
//                 fontSize: 24,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           const Divider(thickness: 1),
//           // 지역 리스트 넣기
//           Center(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columnSpacing: 10,
//                 columns: const [
//                   DataColumn(
//                     label: SizedBox(
//                       width: 115,
//                       height: 49,
//                       child: Center(child: Text('시')),
//                     ),
//                   ),
//                   DataColumn(
//                     label: SizedBox(
//                       width: 240,
//                       height: 49,
//                       child: Center(child: Text('구')),
//                     ),
//                   ),
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     DataCell(
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedCity = '서울시';
//                           });
//                         },
//                         child: const SizedBox(
//                           width: 115,
//                           height: 49,
//                           child: Center(child: Text('서울')),
//                         ),
//                       ),
//                     ),
//                     DataCell(
//                       SizedBox(
//                         width: 240,
//                         height: 49,
//                         child: Center(child: buildRightColumn(selectedCity)),
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedCity = '경기도';
//                           });
//                         },
//                         child: const SizedBox(
//                           width: 115,
//                           height: 49,
//                           child: Center(child: Text('경기')),
//                         ),
//                       ),
//                     ),
//                     DataCell(
//                       SizedBox(
//                         width: 240,
//                         height: 49,
//                         child: Center(child: buildRightColumn(selectedCity)),
//                       ),
//                     ),
//                   ]),
//                   // 나머지 시 추가
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // 오른쪽 칸의 내용을 동적으로 생성하는 함수
//   Widget buildRightColumn(String city) {
//     switch (city) {
//       case '서울':
//         return const Text('서울시 관련 내용');
//       case '경기':
//         return const Text('경기도 관련 내용');
//       case '인천':
//         return const Text('인천 관련 내용');
//       // 나머지 시에 대한 내용 추가
//       default:
//         return const Text('선택된 지역의 내용');
//     }
//   }
// }
