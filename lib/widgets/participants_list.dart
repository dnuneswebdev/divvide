import 'package:divvide/models/participants_model.dart';
import 'package:flutter/material.dart';

class ParticipantsList extends StatelessWidget {
  final List<Participants> participants;

  ParticipantsList({@required this.participants});

  final TextEditingController _newMealNameCtrl = TextEditingController();
  final TextEditingController _newMealPriceCtrl = TextEditingController();

  final double _totalParticipant = 00.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: participants.map((participant) {
            return Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          participant.name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        _buildMealsColumn(),
                        FlatButton(
                          child: Icon(Icons.add),
                          onPressed: () => _newMealDialog(context),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Total: \$ $_totalParticipant',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }

  //WIDGETS
  //ADD A NEW ROW FOR MEALS AND PRICE
  Widget _buildMealsColumn() {
    return Column(
        children: participants.map((participant) {
      if (participant.meals == null) {
        return Text('No meals added yet', style: TextStyle(fontSize: 16));
      } else {
        return Row(
          children: <Widget>[
            Text(participant.meals.meal, style: TextStyle(fontSize: 16)),
            Text('  \$' + participant.meals.price.toString(),
                style: TextStyle(fontSize: 16)),
          ],
        );
      }
    }).toList());
  }

  //METHODS
  //ADD NEW MEAL TO THE PARTICIPANT
  void _newMealDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Meal', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _newMealNameCtrl,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.fastfood),
                  labelText: 'Meal',
                ),
              ),
              TextField(
                controller: _newMealPriceCtrl,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on),
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add +'),
              color: Colors.deepOrange,
              onPressed: () => _createNewMeal(context, _newMealNameCtrl.text,
                  _newMealPriceCtrl.text as double),
            )
          ],
        );
      },
    );
  }

  //METHODS
  void _createNewMeal(BuildContext context, String meal, double price) {
    if (meal == null || price == null) {
      return;
    }

    final newMeal = Meals(
      meal: meal,
      price: price,
    );

    Navigator.of(context).pop();
  }
}
