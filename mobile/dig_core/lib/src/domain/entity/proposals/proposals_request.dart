import 'package:equatable/equatable.dart';

class ProposalsRequest with EquatableMixin {
  final String? nextPageKey;
  final int limit;

  const ProposalsRequest({
    this.nextPageKey,
    this.limit = 0,
  });

  @override
  List<Object?> get props => [nextPageKey, limit];
}
