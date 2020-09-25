class DependentModel {
  String dname;
  String drole;
  String dmob;
  String demail;
  String dlinemanager;
  DateTime joinDate;
  String durl;

  DependentModel(
      {this.dname,
      this.drole,
      this.dmob,
      this.demail,
      this.dlinemanager,
      this.joinDate,
      this.durl});

  DependentModel.fromMap(Map<String, dynamic> map) {
    this.dname = map['dname'];
    this.drole = map['drole'];
    this.dmob = map['dmob'];
    this.demail = map['demail'];
    this.dlinemanager = map['dlinemanager'];
    this.joinDate = map['joinDate'];
    this.durl = map['durl'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dname': this.dname,
      'drole': this.drole,
      'dmob': this.dmob,
      'demail': this.demail,
      'dlinemanager': this.dlinemanager,
      'joinData': this.joinDate,
      'durl': this.durl
    };
  }
}
