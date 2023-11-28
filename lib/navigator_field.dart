import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationField extends StatelessWidget {
  NavigationField({
    super.key,
  });
  double text_size = 11;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3333,
              height: MediaQuery.sizeOf(context).height * 0.18,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.linear_scale_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Length",
                          style: TextStyle(
                              color: Colors.white, fontSize: text_size))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3333,
              height: MediaQuery.sizeOf(context).height * 0.18,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.boy_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Mass",
                          style: TextStyle(
                              color: Colors.white, fontSize: text_size)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3333,
              height: MediaQuery.sizeOf(context).height * 0.18,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Time",
                          style: TextStyle(
                              color: Colors.white, fontSize: text_size)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3333,
              height: MediaQuery.sizeOf(context).height * 0.18,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.water_drop_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Volume",
                          style: TextStyle(
                              color: Colors.white, fontSize: text_size)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3333,
              height: MediaQuery.sizeOf(context).height * 0.18,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.attach_money_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Curncy",
                          style: TextStyle(
                              color: Colors.white, fontSize: text_size)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3333,
              height: MediaQuery.sizeOf(context).height * 0.18,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blueGrey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.thermostat_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Temp",
                          style: TextStyle(
                              color: Colors.white, fontSize: text_size)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
