import 'package:flutter/material.dart';

class NewBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Adicionar nova conta',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.place),
                labelText: 'Lugar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
