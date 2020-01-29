class Participants {
  String id;
  String name;
  List<Meals> meals;
  double totalParticipant;

  Participants({this.id, this.name, this.meals, this.totalParticipant});

  static double calcTotalBill() {
    List<Participants> participants = new List();

    double totalBill = 0.00;

    participants.forEach((participant) {
      totalBill += participant.totalParticipant;
    });

    return totalBill;
  }
}

class Meals {
  String name;
  double price;

  Meals({this.name, this.price});
}

//METHODS
