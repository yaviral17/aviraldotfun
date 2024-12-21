import 'dart:developer';

class TransactionModel {
  final String trnxId;
  final String fromAccount;
  final String toAccount;
  final DateTime date;
  final String amount;
  final bool isLocked;
  final String rname;
  final String sname;

  TransactionModel({
    required this.trnxId,
    required this.fromAccount,
    required this.toAccount,
    required this.date,
    required this.amount,
    required this.isLocked,
    required this.rname,
    required this.sname,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    // //log(json.toString(), name: "Transaction Model");
    return TransactionModel(
      trnxId: json['transactions'][0]['transactionId'],
      toAccount: json['transactions'][0]['toAddress'],
      fromAccount: json['transactions'][0]['fromAddress'],
      date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['transactions'][0]['timestamp'].toString()) * 1000),
      amount: json['transactions'][0]['amount'],
      isLocked: json['transactions'][0]['type'] != "transfer" ? true : false,
      rname: json['transactions'][0]['rname'] ?? "",
      sname: json['transactions'][0]['sname'] ?? "",
    );
  }
}
