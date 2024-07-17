// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlanEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final int diskSpace;
  final int bandwidth;
  final int emailAccounts;
  PlanEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.diskSpace,
    required this.bandwidth,
    required this.emailAccounts,
  });
}
