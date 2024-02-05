part of '../bin/chapter4bin.dart';

class People {
  final List<Person8> people;
  const People(this.people);


  @override
  String toString() {
    if (people.isEmpty) {
      return '';
    }

    final result = StringBuffer();
    for (final person in people) {
      result.writeln(person.toString());
    }
    return result.toString();
  }

  People copyWith({List<Person8>? people}) {
    if (people != null) {
      return People(people);
    }

    final newPeople = <Person8>[];
    for (final person in this.people) {
      newPeople.add(person.copyWith());
    }

    return People(newPeople);
  }
}

