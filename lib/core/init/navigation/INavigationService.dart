abstract class INavigationService {
  Future<void> navigationToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
}
