import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/classes/Employed.dart';
import 'package:flutter_bloc_1/src/models/EmployedModel.dart';
import 'package:meta/meta.dart';

part 'employed_event.dart';
part 'employed_state.dart';

class EmployedBloc extends Bloc<EmployedEvent, EmployedState>{

  EmployedBloc() : super(EmployedState(employes: [], status: 'start'));

  @override
  Stream<EmployedState> mapEventToState(EmployedEvent event) async*{
    if(event is GetEmployes){
      print(event.status);
      if(event.status == 'reload'){
        yield EmployedState(employes: [], status: 'loading');
      }
      List<Employed> employes = await EmployedModel.getEmployes();
      yield EmployedState(employes: employes, status: 'ok');
    }
  }

}