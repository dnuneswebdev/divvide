import 'package:divvide/models/participants_model.dart';
import 'package:divvide/shared/constants.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final List<Participants> participants;
  double _totalBill = 0.00;
  double _serviceTax;

  Order({@required this.participants});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Resumo do pedido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('SubTotal: ', style: defaultOrderTexts),
                Text('R\$ ${_calcTotalBill().toStringAsFixed(2)} '),
              ],
            ),
            // Divider(color: Theme.of(context).hintColor),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text('Entrada: ', style: defaultOrderTexts),
            //     Text('R\$ '),
            //   ],
            // ),
            Divider(color: Theme.of(context).hintColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Serviço (10%): ', style: defaultOrderTexts),
                Text('R\$ ${_serviceTax.toStringAsFixed(2)}'),
              ],
            ),
            Divider(color: Theme.of(context).hintColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total: ', style: defaultOrderTexts),
                Text('R\$ ${(_serviceTax + _totalBill).toStringAsFixed(2)}'),
              ],
            ),
            Divider(color: Theme.of(context).hintColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Dividido: ', style: defaultOrderTexts),
                Text(participants.length == 0
                    ? 'R\$ 0.00'
                    : 'R\$ ${((_serviceTax + _totalBill) / participants.length).toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //METHODS
  double _calcTotalBill() {
    // double totalBill = 0.00;

    participants.forEach((participant) {
      if (participant.meals.length == 0) {
        return _totalBill;
      } else {
        return _totalBill += participant.totalParticipant;
      }
    });

    _serviceTax = _totalBill * 0.1;

    return _totalBill;
  }
}
