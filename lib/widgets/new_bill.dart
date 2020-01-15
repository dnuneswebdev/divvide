import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewBill extends StatefulWidget {
  final Function addNewBill;

  NewBill({@required this.addNewBill});

  @override
  _NewBillState createState() => _NewBillState();
}

class _NewBillState extends State<NewBill> {
  final TextEditingController placeCtrl = TextEditingController();

  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Adicionar nova conta',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 20),
            TextField(
              controller: placeCtrl,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.place),
                labelText: 'Lugar',
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text(selectedDate == null
                    ? ''
                    : DateFormat('dd/MM/yyyy').format(selectedDate)),
                FlatButton(
                  child: Text('Selecionar data'),
                  textColor: Colors.deepOrange,
                  onPressed: () {
                    _datePicker(context);
                  },
                )
              ],
            ),
            RaisedButton(
              child: Text('Salvar'),
              color: Colors.blueGrey,
              textColor: Colors.white,
              onPressed: (placeCtrl.text.isEmpty || selectedDate == null)
                  ? null //DISABLE THE BUTTON
                  : () {
                      return _submitBillData();
                    },
            ),
          ],
        ),
      ),
    );
  }

  //METHODS
  //SHOW DATE PICKER
  void _datePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  //CREATE A NEW BILL
  void _submitBillData() {
    widget.addNewBill(placeCtrl.text, selectedDate);
    Navigator.of(context).pop();
  }
}
