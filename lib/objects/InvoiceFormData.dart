import 'BillToParty.dart';
import 'Ledger.dart';
import 'ShipToParty.dart';
import 'Total.dart';

class InvoiceFormData{

  var transportModes = ['Road','Railway','Air','Ship'];

  String invoiceNumber;
  String invoiceDate;
  bool sameAsAbove = true;
  String supplyDate;
  String transportMode;
  bool reverseCharge = false;
  String state;
  int stateCode;
  String placeOfSupply;
  bool billSameShip = true;
  BillToParty billToParty;
  ShipToParty shipToParty;
  List<Ledger> ledger;
  int ewayBill;
  String note;
  String gstNumber;
  Total total;
  }
