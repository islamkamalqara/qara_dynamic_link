
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_firebase_app/base/Helper/app_event.dart';
import 'package:web_firebase_app/base/Helper/app_state.dart';
import 'package:web_firebase_app/data/model/publicScanModel.dart';
import 'package:web_firebase_app/data/repository/public_scan_repository.dart';

class PublicScanBloc extends Bloc<AppEvent,AppState>{
  PublicScanBloc() : super(Start()){
    on<GetPublicScanData>(_onGetPublicScanDataFun);

  }
  BehaviorSubject<PublicScanModel> _public_scan_data_subject = new BehaviorSubject<PublicScanModel>();
  get public_scan_data_subject {
    return _public_scan_data_subject;
  }




  void drainStream() {
    _public_scan_data_subject.close();
  }


  Future<void> _onGetPublicScanDataFun(GetPublicScanData event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await publicScanRepository.getPublicScanData(qr_value:event.qr_value);
      print("response : ${response?.toJson()}");
      if(response!.status == 201 ){
        _public_scan_data_subject.sink.add(response);
        emit( Done(model: response));
      }else{
        emit( ErrorLoading(message: response.description));
      }

    } catch (e) {
      print("e : ${e}");
      emit(
        ErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }



}
final publicScanBloc = new PublicScanBloc();