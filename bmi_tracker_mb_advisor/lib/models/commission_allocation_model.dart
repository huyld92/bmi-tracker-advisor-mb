
import 'dart:convert';

List<CommissionAllocationModel> commissionAllocationModelsFromJson(String str) =>
    List<CommissionAllocationModel>.from(
        json.decode(str).map((x) => CommissionAllocationModel.fromJson(x)));

String commissionAllocationToJson(List<CommissionAllocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommissionAllocationModel {
  int? commissionAllocationID;
  double? amount;
  String? description;
  String? milestone;
  DateTime? milestoneDate;
  String? subscriptionNumber;

  CommissionAllocationModel({
    this.commissionAllocationID,
    this.amount,
    this.description,
    this.milestone,
    this.milestoneDate,
    this.subscriptionNumber,
  });

  factory CommissionAllocationModel.fromJson(Map<String, dynamic> json) {

    return CommissionAllocationModel(
      commissionAllocationID: json['commissionAllocationID'],
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'],
      milestone: json['milestone'],
      milestoneDate: DateTime.parse(json['milestoneDate']),
      subscriptionNumber: json['subscriptionNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commissionAllocationID': commissionAllocationID,
      'amount': amount,
      'description': description,
      'milestone': milestone,
      'milestoneDate': milestoneDate?.toIso8601String(),
      'subscriptionNumber': subscriptionNumber,
    };
  }

  @override
  String toString() {
    return 'CommissionAllocationModel{commissionAllocationID: $commissionAllocationID, amount: $amount, description: $description, milestone: $milestone, milestoneDate: $milestoneDate, subscriptionNumber: $subscriptionNumber}';
  }
}
