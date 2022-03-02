import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simpe/app/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(homewidget(context));
    if (true) children.add(_buildCard(context));

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: children,
        ),
      ),
    );
  }

  Widget homewidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            color: kBlueColor,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  const Text(
                    "Valor disponível",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        "R\$ 875,21",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 35,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isvisible = true;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Últimas transações',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Center(
                    child: Text(
                      'Últimas transações',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  tile("@julia.belem", "@julia.belem", "- R\$329,47",
                      Colors.black),
                  SizedBox(
                    height: 20.h,
                  ),
                  tile("@rafael.silva", "@rafael.silva", "+ R\$124,13",
                      Colors.black),
                  SizedBox(
                    height: 20.h,
                  ),
                  tile("@gustavo.alves", "@gustavo.alves", "- R\$412,24",
                      Colors.green),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 45,
                          left: 20,
                          right: 20,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: kBlueColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 70,
                            ),
                          ),
                        ),
                        Container(
                          height: 100.h,
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: kBlueColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: ListTile(
                              leading: Icon(
                                Icons.person_add,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Ganhe R\$ 29,99 ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Basta convidar seus amigos. Oferta limitada!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  tile("@gustavo.alves", "@gustavo.alves", "- R\$412,24",
                      Colors.green),
                  SizedBox(
                    height: 20.h,
                  ),
                  tile("@gustavo.alves", "@gustavo.alves", "- R\$412,24",
                      Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) => Visibility(
        visible: isvisible,
        child: Center(
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      child: Divider(
                        height: 2,
                        thickness: 5,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Text(
                    'Adicionar saldo',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 53.h,
                  ),
                  Text(
                    'Escolha como você quer adicionar dinheiro a sua conta Simpe',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  tile2(),
                  SizedBox(
                    height: 24.h,
                  ),
                  tile2(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Spacer(),
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: kBlueColor,
                      // borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Center(
                      child: Text(
                        'Continuar',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(252, 252, 252, 1),
                            fontSize: 14.sp,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget tile2() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: ListTile(
          style: ListTileStyle.list,
          leading: Container(
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipOval(
                child: Icon(
              Icons.account_tree_sharp,
              color: kBlueColor,
            )),
          ),
          title: Text(
            "Transferência bancária",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "Disponível de acordo com os horários do banco escolhido.",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.check_circle,
            color: kBlueColor,
          )),
    );
  }

  Widget tile(String title, String subtitle, String trail, Color color) {
    return Container(
      child: ListTile(
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipOval(child: Image.asset('assets/icons/man.jpg')),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          trail,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, color: color),
        ),
      ),
    );
  }
}
