part of 'fetch_image_banner_bloc.dart';

sealed class FetchImageBannerEvent extends Equatable {
  const FetchImageBannerEvent();

  @override
  List<Object> get props => [];
}
class FetchBannerData extends FetchImageBannerEvent{

}

class FetchedBannerData extends FetchImageBannerEvent{
 final List<BannerImages>data;
 const FetchedBannerData(this.data);
    @override
  List<Object> get props => [data];
}