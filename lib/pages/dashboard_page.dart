import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/dashboard_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20.0,
                            child: Container(
                              height: 33.0,
                              width: 33.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Positioned(
                            right: 0.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 6.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Chip(
                        label: Text('Today'),
                      ),
                      Chip(
                        label: Text('Week'),
                      ),
                      Chip(
                        label: Text('Month'),
                      ),
                      Chip(
                        label: Text('All time'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 100.0,
                    color: Colors.white,
                    padding: const EdgeInsets.all(2.0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      shrinkWrap: true,
                      childAspectRatio: ((MediaQuery.of(context).size.width -
                                  (20.0 * 2) -
                                  (2.0 * 4)) /
                              3) /
                          (100.0 - (2.0 * 2)),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.center,
                          child: const Text(
                            '22\nStops',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.center,
                          child: const Text(
                            '11 hrs\nOnline',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.center,
                          child: const Text(
                            '500\nPickups',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://assets.website-files.com/5e832e12eb7ca02ee9064d42/5f7db426b676b95755fb2844_Group%20805.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: ListView(
                    padding: const EdgeInsets.all(20.0),
                    children: const [
                      Text(
                        'Next Stops',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                      SizedBox(height: 20.0),
                      DashboardTile(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
