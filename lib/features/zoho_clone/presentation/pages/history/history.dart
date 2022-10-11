import 'package:flutter/material.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/constants/color_constants.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Column(
          children: const [
            Text(
              "DATE",
              style: TextStyle(color: kLightestGrey),
            ),
            Text(
              
              "Present",
              style: TextStyle(color: kLightestGrey, fontSize: 15),
            ),
          ],
        ),
      ),
      backgroundColor: kBlack,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "date",
                              style: TextStyle(color: kLightestGrey),
                            ),
                            Icon(
                              Icons.phone,
                              color: kLightestGrey,
                            ),
                          ],
                        ),
                        const Text(
                          "check-IN time",
                          style: TextStyle(
                              color: kGreen, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Pune",
                          style: TextStyle(
                              color: kLightestGrey,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "date",
                              style: TextStyle(color: kLightestGrey),
                            ),
                            Icon(
                              Icons.location_on,
                              color: kLightestGrey,
                            ),
                          ],
                        ),
                        const Text(
                          "check-OUT time",
                          style: TextStyle(
                              color: kRed, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Pune",
                          style: TextStyle(
                              color: kLightestGrey,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }),
      ),
    );
  }
}
