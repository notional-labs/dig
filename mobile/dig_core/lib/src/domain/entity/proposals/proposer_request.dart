import 'package:equatable/equatable.dart';

class ProposerRequest with EquatableMixin {
  final String proposerId;

  const ProposerRequest(this.proposerId);

  @override
  List<Object?> get props => [proposerId];
}
