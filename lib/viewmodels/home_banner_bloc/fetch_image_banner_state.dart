part of 'fetch_image_banner_bloc.dart';

sealed class FetchImageBannerState extends Equatable {
  const FetchImageBannerState();
  
  @override
  List<Object> get props => [];
}

final class FetchImageBannerInitial extends FetchImageBannerState {}
final class FetchImageBannerLoading extends FetchImageBannerState {}
final class FetchImageBannerLoaded extends FetchImageBannerState {

 final List<BannerImages>data;
 const FetchImageBannerLoaded(this.data);
  @override
  List<Object> get props => [data];
}
final class FetchImageBannerFailure extends FetchImageBannerState {

 final String error;
 const FetchImageBannerFailure(this.error);
   @override
  List<Object> get props => [error];

}