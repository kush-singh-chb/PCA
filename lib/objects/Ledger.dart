import 'IGST.dart';


class Ledger{
  String productDescription;
  int hsnCode;
  int measureUnits;
  static int qty = 0;
  static int rate = 0;
  int amount;
  int taxableValue = qty * rate;
  IGST igst;
  int total;
}