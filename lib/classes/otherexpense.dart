import '../database.dart';

class OtherExpense {
  final int tripid;
  final int serial_number;
  final String type;
  final String details;
  final double amount_paid;
  final String receipt_details;
  final String receipt_address;
  final String receipt_location;

  OtherExpense(
      {this.tripid,
      this.serial_number,
      this.type,
      this.details,
      this.amount_paid,
      this.receipt_details,
      this.receipt_address,
      this.receipt_location});

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["tripid"] = tripid;
    // map["serial_number"] = serial_number;
    map["type"] = type;
    map["details"] = details;
    map["amount_paid"] = amount_paid;
    map["receipt_details"] = receipt_details;
    map["receipt_address"] = receipt_address;
    map["receipt_location"] = receipt_location;
    return map;
  }

  fromMap(Map<String, dynamic> data) => new OtherExpense(
      tripid: data['tripid'],
      serial_number: data['serial_number'],
      type: data["type"],
      details: data["details"],
      amount_paid: data["amount_paid"],
      receipt_details: data["receipt_details"],
      receipt_address: data["receipt_address"],
      receipt_location: data["receipt_location"]);
}

DatabaseHelper _databaseHelper = Injection.injector.get();

Future<int> insertOtherExpense(
    int tripid,
    String type,
    String details,
    double amount_paid,
    String receipt_details,
    String receipt_address,
    String receipt_location) async {
  final todo = new OtherExpense(
      tripid: tripid,
      type: type,
      details: details,
      amount_paid: amount_paid,
      receipt_details: receipt_details,
      receipt_address: receipt_address,
      receipt_location: receipt_location);
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('otherexpense', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<OtherExpense> getItemByIdOtherExpense(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from otherexpense where serial_number = ?", [id]);
  if (list.length > 0) {
    return OtherExpense().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getElementsOtherExpense(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from otherexpense where tripid = ?", [id]);
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteItemOtherExpense(int id) async {
  return await _databaseHelper.db
      .delete("otherexpense", where: "serial_number = ?", whereArgs: [id]);
}

Future<int> updateOtherExpense(
    int id,
    int tripid,
    String type,
    String details,
    double amount_paid,
    String receipt_details,
    String receipt_address,
    String receipt_location) async {
  final todo = new OtherExpense(
      tripid: tripid,
      type: type,
      details: details,
      amount_paid: amount_paid,
      receipt_details: receipt_details,
      receipt_address: receipt_address,
      receipt_location: receipt_location);
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.update('OtherExpense', todo.toMap(),
      where: "serial_number = ?", whereArgs: [id]);
  print('Inserted');
  print(sn);
  return sn;
}