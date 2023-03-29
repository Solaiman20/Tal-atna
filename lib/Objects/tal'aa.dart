import './friends_object.dart';
import './bills.dart';

class Talaa {
  final Bill bill;
  final DateTime date;
  final String Description;
  final bool hasBill;
  final String location;
  final String name;
  final List<Friends> friends;
  Talaa(
    this.Description,
    this.bill,
    this.date,
    this.friends,
    this.hasBill,
    this.location,
    this.name,
  );
}
