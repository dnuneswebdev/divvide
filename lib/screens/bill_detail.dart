import 'package:divvide/models/bill_models.dart';
import 'package:flutter/material.dart';

class BillDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bill bill = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da conta'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(bill.place),
            SizedBox(height: 20),
            Text(bill.date.toString()),
            SizedBox(height: 20),
            Text(bill.totalBill.toString()),
          ],
        ),
      ),
    );
  }
}
