import 'dart:convert';

class Student {
  String name;
  String regdNo;
  String dob;
  String branch;
  String sec;
  String email;
  Student({
    required this.name,
    required this.regdNo,
    required this.dob,
    required this.branch,
    required this.sec,
    required this.email,
  });

  Student copyWith({
    String? name,
    String? regdNo,
    String? dob,
    String? branch,
    String? sec,
    String? email,
  }) {
    return Student(
      name: name ?? this.name,
      regdNo: regdNo ?? this.regdNo,
      dob: dob ?? this.dob,
      branch: branch ?? this.branch,
      sec: sec ?? this.sec,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'regdNo': regdNo,
      'dob': dob,
      'branch': branch,
      'sec': sec,
      'email': email,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
      regdNo: map['enrollmentno'] ?? '',
      dob: map['dateofbirth'] ?? '',
      branch: map['branchdesc'] ?? '',
      sec: map['sectioncode'] ?? '',
      email: map['semailid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(name: $name, regdNo: $regdNo, dob: $dob, branch: $branch, sec: $sec, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.name == name &&
      other.regdNo == regdNo &&
      other.dob == dob &&
      other.branch == branch &&
      other.sec == sec &&
      other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      regdNo.hashCode ^
      dob.hashCode ^
      branch.hashCode ^
      sec.hashCode ^
      email.hashCode;
  }
}
