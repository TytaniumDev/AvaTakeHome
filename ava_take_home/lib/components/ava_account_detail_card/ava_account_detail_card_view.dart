import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ava_account_detail_card_view.freezed.dart';

@freezed
class AvaAccountDetailCardViewData with _$AvaAccountDetailCardViewData {
  factory AvaAccountDetailCardViewData({
    required int balance,
    required int creditLimit,
    required int spendLimit,
    required int utilization,
  }) = _AvaAccountDetailCardViewData;
}

class AvaAccountDetailCardView extends ConsumerWidget {
  const AvaAccountDetailCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
