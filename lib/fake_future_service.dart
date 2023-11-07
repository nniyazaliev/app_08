class FakeFutureService {
  //Synchronous
  String getCity() {
    return 'Bishkek';
  }

//Asynchronous
  Future<String> getCityFromFuture() {
    return Future.delayed(Duration(seconds: 3), () {
      return 'Bishkek';
    });
  }
}
