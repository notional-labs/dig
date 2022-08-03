import 'package:bloc/bloc.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/create_proposal_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'create_proposal_state.dart';

@Injectable()
class CreateProposalCubit extends Cubit<CreateProposalState> {
  CreateProposalCubit() : super(CreateProposalInitial());

  void closeEvent() => navigatorKey.currentState!.pop();
}
