import './friends_object.dart';
import './bills.dart';

class Talaa {
  final DateTime date;
  final bool hasBill;
  final String location;
  final String name;
  final List<Friend> friends;
  Talaa(
    this.date,
    this.friends,
    this.hasBill,
    this.location,
    this.name,
  );
}
