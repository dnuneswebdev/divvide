import 'package:flutter/material.dart';

class ParticipantsList extends StatelessWidget {
  final List participants = [
    {
      'id': 1,
      'name': 'Daniel',
      'meal': ['Lanche 1', 'Lanche 2'],
      'price': 40.00,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Participantes: ${participants.length}',
                style: TextStyle(fontSize: 18),
              ),
              FlatButton(
                child: Text('Add participantes +'),
                textColor: Theme.of(context).hintColor,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Card(
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  participants[0]['name'],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          FlatButton(child: Text('Add Comida +'), onPressed: () {}),
          Divider(),
        ],
      ),
    );
  }
}
// SizedBox(height: 20),

//         ListView.builder(
//           itemCount: participants.length,
//           itemBuilder: (context, index) {
//             return Text(participants[index]['name']);
//           },
//         ),
