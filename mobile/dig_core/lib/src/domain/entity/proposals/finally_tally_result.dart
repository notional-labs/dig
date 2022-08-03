import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'finally_tally_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FinalTallyResult with EquatableMixin {
  final String yes;
  final String abstain;
  final String no;
  final String noWithVeto;

  const FinalTallyResult({
    this.yes = '',
    this.abstain = '',
    this.no = '',
    this.noWithVeto = '',
  });

  factory FinalTallyResult.fromJson(Map<String, dynamic> json) =>
      _$FinalTallyResultFromJson(json);

  Map<String, dynamic> toJson() => _$FinalTallyResultToJson(this);

  @override
  List<Object?> get props => [yes, abstain, no, noWithVeto];
}

extension FinalTallyResultExtension on FinalTallyResult {
  int get yesByInt => int.tryParse(yes) ?? 0;

  int get abstainByInt => int.tryParse(abstain) ?? 0;

  int get noByInt => int.tryParse(no) ?? 0;

  int get noWithVetoByInt => int.tryParse(noWithVeto) ?? 0;
}
