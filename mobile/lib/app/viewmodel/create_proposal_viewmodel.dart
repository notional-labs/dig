import 'package:equatable/equatable.dart';

class CreateProposalViewModel with EquatableMixin {
  final bool showAdvance;

  const CreateProposalViewModel({this.showAdvance = false});

  @override
  List<Object?> get props => [showAdvance];
}
