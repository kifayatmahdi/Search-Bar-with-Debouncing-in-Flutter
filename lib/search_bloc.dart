
import 'dart:async';

class SearchBloc {
  final _searchController = StreamController<String>.broadcast();
  Stream<String> get searchStream => _searchController.stream;

  Timer? _debounce;

  void onTextChanged(String query) {
    final trimmed = query.trim();

    // Cancel previous debounce
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: 400), () {
      if (trimmed.isEmpty) return;  // Ignore empty
      _searchController.sink.add(trimmed);  // Emit data
    });
  }

  void dispose() {
    _debounce?.cancel();
    _searchController.close();
  }
}
