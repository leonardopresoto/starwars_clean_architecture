import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starwars_clean_architecture/core/errors/failures.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';
import 'package:starwars_clean_architecture/features/people/domain/repositories/people_repository.dart';
import 'package:starwars_clean_architecture/features/people/domain/usecases/get_people.dart';

class MockPeopleRepository extends Mock implements PeopleRepository{}

void main(){
  MockPeopleRepository mockPeopleRepository;
  GetPeople useCase;
  Params params;

  setUp(() {
    mockPeopleRepository = MockPeopleRepository();
    useCase = GetPeople(mockPeopleRepository);
    params = Params(number: 1);
  });

  group("Params .../features/people/domain/usecases/", (){
    test("should return a List<Object>", () {
      expect(params.props, isA<List<Object>>());
    });

    test("should return a populated List<Object>", () {
      expect(params.props, isA<List<Object>>());
      expect(params.props.isEmpty, false);
    });

    test("should return a List<Object> with length equals to one", () {
      expect(params.props.length, 1);
    });

  });

  group("Repository .../features/people/domain/usecases/", (){
    test("it should get a list of people from the repository", () async {
      when(mockPeopleRepository.getPeople(any)).thenAnswer((_) async => Right(<Person>[]),
      );
      final result = await useCase(params);
      // UseCase should simply return whatever was returned from the Repository
      expect(result | null, isA<List<Person>>());
      // Verify that the method has been called on the Repository
      verify(mockPeopleRepository.getPeople(1));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockPeopleRepository);
    });

    test("it should get a Failure when the parameter number is null",() async {
      when(mockPeopleRepository.getPeople(any)).thenAnswer((_) async => Right(<Person>[]),
      );
      final result = await useCase(Params(number: null));
      // UseCase should simply return whatever was returned from the Repository
      expect(result.isLeft(), true);
      expect(result.fold(id, id), isA<Failure>());
      verifyNever(mockPeopleRepository.getPeople(null));
      verifyNoMoreInteractions(mockPeopleRepository);
    });
  });

}