part of '../bin/chapter4bin.dart';

class Person7 {
  String _firstName;
  String _lastName;

  Person7(this._firstName, this._lastName);

  String get firstName => _firstName;
  set firstName(String value) => _firstName = value.isEmpty ? 'None' : value;

  String get lastName => _lastName;
  set lastName(String value) => _lastName = value.isEmpty ? 'None' : value;

  @override
  String toString() => '$_firstName $_lastName';

  Person7 operator+(Person7 second) {
    return Person7('Kid of $_firstName and ${second.firstName}', _lastName);
  }
}

