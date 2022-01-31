import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: const Text(
          '7:15\nAM',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        title: const Text(
          'MIT Road',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Row(
          children: const [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: Colors.white,
            ),
            Icon(
              Icons.star,
              color: Colors.white,
            ),
          ],
        ),
        trailing: const Text(
          '85%',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
