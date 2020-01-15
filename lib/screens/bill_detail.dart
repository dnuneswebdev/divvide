import 'package:divvide/models/bill_models.dart';
import 'package:divvide/widgets/participants_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bill bill = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _customAppBar(bill),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 15),
              ParticipantsList(),
            ]),
          ),
        ],
      ),
    );
  }

  //WIDGETS
  //CREATE CUSTOM SLIVER APPBAR
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
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

  //CREATE LIST OF PARTICIPANTS
  Widget _participantsList(Bill bill) {}
}

// Text(
//   bill.totalBill == null
//     ? 'R\$ 0.00'
//     : bill.totalBill.toStringAsFixed(2),
//),
