import 'package:divvide/models/bill_models.dart';
import 'package:divvide/widgets/bill_list.dart';
import 'package:divvide/widgets/new_bill.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Bill> bills = [
    Bill(id: 1, place: 'Outback', date: DateTime.now(), totalBill: 190.00),
    Bill(id: 2, place: 'Good Fellas', date: DateTime.now(), totalBill: 120.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIVVIDE'),
        centerTitle: true,
      ),
      body: bills.isEmpty ? _noBillsMessage() : BillList(bills: bills),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _newBillModal(context);
        },
        child: Icon(Icons.add_circle_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _noBillsMessage() {
    //When there are no bills added yet.
    return Center(
      child: Text(
        'Você ainda não possui nenhuma conta adicionada!',
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _newBillModal(BuildContext context) {
    //SHOW BOTTOM MODAL TO ADD A NEW BILL
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewBill();
        });
  }
}
