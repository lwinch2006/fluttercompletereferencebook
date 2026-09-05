part of chapter4;

class People2 {
  final List<Person8> people;

  const People2(this.people);

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

  People2 copyWith({List<Person8>? people}) {
    final newPeople = people ??
        List<Person8>.generate(
            this.people.length, (index) => this.people[index].copyWith(),
            growable: false);

    return People2(newPeople);
  }
}
