import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_clean_architecture/core/usecases/usecases.dart';

void main() {

  NoParams noParams;

  setUp(() {
    noParams = NoParams();
  });


  group("Test NoParams Class on .../core/usecases/", (){
    test("should return a List<Object>", () {
      expect(noParams.props, isA<List<Object>>());
    });

    test("should return a empty List<Object>", () {
      expect(noParams.props, isA<List<Object>>());
      expect(noParams.props.isEmpty, true);
    });

    test("should return a List<Object> with length equals to zero", () {
      expect(noParams.props.length, 0);
    });

  });

}
