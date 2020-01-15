import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:divvide/models/bill_models.dart';

class BillList extends StatelessWidget {
  final List<Bill> bills;

  BillList({@required this.bills});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bills[index].place,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(DateFormat('dd/MM/yyyy').format(bills[index].date)),
                    ],
                  ),
                  Text(
                    bills[index].totalBill == null
                        ? 'R\$ 0.00'
                        : 'R\$' + bills[index].totalBill.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'bill-detail',
                arguments: bills[index]);
          },
        );
      },
    );
  }
}
