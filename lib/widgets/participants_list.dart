import 'package:divvide/models/participants_model.dart';
import 'package:flutter/material.dart';

class ParticipantsList extends StatefulWidget {
  final List<Participants> participants;

  final Function addNewMeal;

  ParticipantsList({@required this.participants, @required this.addNewMeal});

  @override
  _ParticipantsListState createState() => _ParticipantsListState();
}

class _ParticipantsListState extends State<ParticipantsList> {
  final TextEditingController _newMealNameCtrl = TextEditingController();
  final TextEditingController _newMealPriceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: widget.participants.length,
        itemBuilder: (context, index) {
          if (widget.participants.isEmpty) {
            return Center(child: Text('Nenhum participante adicionado...'));
          } else {
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
                          widget.participants[index].name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        widget.participants[index].meals.length == 0
                            ? Text('Adicione uma comida')
                            : Column(
                                children: widget.participants[index].meals
                                    .map((meal) {
                                  return Row(
                                    children: <Widget>[
                                      Text(meal.name),
                                      Text(
                                          '  R\$${meal.price.toStringAsFixed(2)}'),
                                    ],
                                  );
                                }).toList(),
                              ),
                        FlatButton(
                          child: Icon(Icons.add),
                          onPressed: () => _newMealDialog(context, index),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      widget.participants[index].meals.isEmpty
                          ? 'R\$ 0.00'
                          : 'Total: R\$ ${_getTotalPerParticipant(index).toStringAsFixed(2)}',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  double _getTotalPerParticipant(int index) {
    double totalPerParticipant = 0.0;

    widget.participants[index].meals.map((meal) {
      totalPerParticipant += meal.price;
    }).toString();

    widget.participants[index].totalParticipant = totalPerParticipant;

    return totalPerParticipant;
  }

  void _newMealDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar nova comida', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _newMealNameCtrl,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.fastfood),
                  labelText: 'Comida/Bebida',
                ),
              ),
              TextField(
                controller: _newMealPriceCtrl,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on),
                  labelText: 'Preço',
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add +'),
              color: Colors.deepOrange,
              onPressed: () => _submitMealData(index),
            ),
          ],
        );
      },
    );
  }

  void _submitMealData(int index) {
    widget.addNewMeal(
      _newMealNameCtrl.text,
      double.parse(_newMealPriceCtrl.text),
      index,
    );
    _newMealNameCtrl.clear();
    _newMealPriceCtrl.clear();

    Navigator.of(context).pop();
  }
}
