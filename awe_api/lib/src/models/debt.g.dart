// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Debt _$DebtFromJson(Map<String, dynamic> json) => Debt(
      id: json['id'] as int,
      debtor: User.fromJson(json['debtor'] as Map<String, dynamic>),
      creditor: User.fromJson(json['creditor'] as Map<String, dynamic>),
      amountOwed: (json['amountOwed'] as num).toDouble(),
    );

Map<String, dynamic> _$DebtToJson(Debt instance) => <String, dynamic>{
      'id': instance.id,
      'debtor': instance.debtor,
      'creditor': instance.creditor,
      'amountOwed': instance.amountOwed,
    };
