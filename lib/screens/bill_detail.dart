import 'package:divvide/models/bill_models.dart';
import 'package:divvide/models/participants_model.dart';
import 'package:divvide/widgets/order.dart';
import 'package:divvide/widgets/participants_list.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class BillDetail extends StatefulWidget {
  @override
  _BillDetailState createState() => _BillDetailState();
}

class _BillDetailState extends State<BillDetail> {
  final List<Participants> participants = [];

  final TextEditingController _newParticipantCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Bill bill = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(bill.place),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _participantsRow(context),
            ParticipantsList(
              participants: participants,
              addNewMeal: _addNewMeal,
            ),
            // _entrieMeal(context),
            Order(participants: participants),
          ],
        ),
      ),
    );
  }

  //WIDGETS
  Widget _participantsRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Participantes: ${participants.length}',
            style: TextStyle(fontSize: 18),
          ),
          FlatButton(
            child: Text('Add participantes +'),
            textColor: Theme.of(context).hintColor,
            onPressed: () => _newParticipantDialog(context),
          ),
        ],
      ),
    );
  }

  // Widget _entrieMeal(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Card(
  //       margin: EdgeInsets.symmetric(horizontal: 16),
  //       child: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: TextField(
  //           decoration: InputDecoration(
  //             labelText: 'Adicionar Entrada',
  //             suffix: IconButton(
  //               icon: Icon(Icons.save),
  //               onPressed: () {},
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  //METHODS
  void _newParticipantDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Participant', textAlign: TextAlign.center),
          content: TextField(
            controller: _newParticipantCtrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_add),
              labelText: 'Participant',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add+'),
              color: Colors.deepOrange,
              onPressed: () => _createNewParticipant(_newParticipantCtrl.text),
            )
          ],
        );
      },
    );
  }

  void _createNewParticipant(String name) {
    if (name.isEmpty) {
      return null;
    }

    final newParticipant = Participants(
      id: DateTime.now().toString(),
      name: name,
      meals: List<Meals>(),
    );

    setState(() {
      participants.add(newParticipant);
    });

    _newParticipantCtrl.clear();

    Navigator.of(context).pop();
  }

  void _addNewMeal(String meal, double price, int index) {
    if (meal.isEmpty || price == null) {
      return;
    }

    final newMeal = Meals(
      name: meal,
      price: price,
    );

    setState(() {
      participants[index].meals.add(newMeal);
    });
  }
}
