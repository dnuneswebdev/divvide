import 'package:divvide/models/bill_models.dart';
import 'package:divvide/widgets/bill_list.dart';
import 'package:divvide/widgets/new_bill.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Bill> bills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIVVIDE'),
        centerTitle: true,
      ),
      body: bills.isEmpty ? _noBillsMessage() : BillList(bills: bills),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          _newBillModal(context);
        },
        child: Icon(Icons.add_circle_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  //WIDGETS
  //WIDGET TO SHOW A A MESSAGE WHEN THERE IS NO BILL ADDED YET.
  Widget _noBillsMessage() {
    return Center(
      child: Text(
        'Você ainda não possui nenhuma conta adicionada!',
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }

  //METHODS
  //SHOW BOTTOM MODAL TO ADD A NEW BILL
  void _newBillModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewBill(addNewBill: _addNewBill);
        });
  }

  //ADD A NEW BILL TO THE BILLS ARRAY
  void _addNewBill(String place, DateTime date) {
    final newBill = Bill(
      id: DateTime.now().toString(),
      place: place,
      date: date,
    );

    setState(() {
      bills.add(newBill);
    });
  }
}
