import 'package:divvide/models/bill_models.dart';
import 'package:divvide/models/participants_model.dart';
import 'package:divvide/shared/constants.dart';
import 'package:divvide/widgets/participants_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillDetail extends StatefulWidget {
  @override
  _BillDetailState createState() => _BillDetailState();
}

class _BillDetailState extends State<BillDetail> {
  final List<Participants> participants = [
    // Participants(
    //   id: '1',
    //   name: 'Daniel',
    //   meals: Meals(
    //     meal: '1x Hamburgão',
    //     price: 19.99,
    //   ),
    // ),
  ];

  final TextEditingController _newParticipantCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Bill bill = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _customAppBar(bill),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20),
              _participantsRow(context),
              ParticipantsList(participants: participants),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _customAppBar(Bill bill) {
    return SliverAppBar(
      title: Text(
        bill.place,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: circularBorderAppBar,
      elevation: 10,
      forceElevated: true,
      centerTitle: true,
      expandedHeight: 100,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          DateFormat('dd/MM/yyyy').format(bill.date),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        // title: Text(bill.place),
      ),
    );
  }

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
    );

    setState(() {
      participants.add(newParticipant);
    });

    Navigator.of(context).pop();
  }
}
