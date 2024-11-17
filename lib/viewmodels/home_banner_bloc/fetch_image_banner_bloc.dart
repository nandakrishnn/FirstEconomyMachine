import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firsteconomy/models/data_model.dart';
import 'package:firsteconomy/services/api_helper.dart';

part 'fetch_image_banner_event.dart';
part 'fetch_image_banner_state.dart';

class FetchImageBannerBloc
    extends Bloc<FetchImageBannerEvent, FetchImageBannerState> {
  final ApiServices apiService;
  FetchImageBannerBloc(this.apiService) : super(FetchImageBannerInitial()) {
    on<FetchBannerData>(_fetchBannerData);
    on<FetchedBannerData>(_fetchedBannerData);
  }
  void _fetchBannerData(
      FetchBannerData event, Emitter<FetchImageBannerState> emit) async {
   
    try {
      emit(FetchImageBannerLoading());
      List<BannerImages> data = await apiService.getBannerImages();
      add(FetchedBannerData(data));
    } catch (e) {
       String errorMessage = "An error occurred. Please check your internet connection.";
    if (e is SocketException) {
      errorMessage = "No internet connection.";
    }
      emit(FetchImageBannerFailure(errorMessage));
    }
  }

  void _fetchedBannerData(
      FetchedBannerData event, Emitter<FetchImageBannerState> emit) async {
    try {
      emit(FetchImageBannerLoaded(event.data));
    } catch (e) {
      emit(FetchImageBannerFailure(e.toString()));
    }
  }
}
