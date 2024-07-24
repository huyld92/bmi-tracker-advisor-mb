import 'package:flutter/material.dart';

class MemberInfoCard extends StatelessWidget {
  const MemberInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).primaryColor.withAlpha(50),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('165 cm', style: Theme.of(context).textTheme.titleLarge),
                  const Text(
                    'Height',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 55,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '65 kg',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text(
                    'Weight',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 55,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                children: [
                  Text('26.6', style: Theme.of(context).textTheme.titleLarge),
                  const Text(
                    'BMI',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
