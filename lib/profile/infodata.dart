import 'package:flutter/material.dart';

class InfoData {
  //personal Info
  TextEditingController fullNameC = new TextEditingController();
  // String dobC;
  TextEditingController dobC = new TextEditingController();
  //String nationalityC;
  TextEditingController nationalityC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController phnnoC = new TextEditingController();
  // String genderC;
  TextEditingController genderC = new TextEditingController();
  // String maritalC;
  TextEditingController maritalC = new TextEditingController();
  TextEditingController personaltax = new TextEditingController();
  TextEditingController socialInsurance = new TextEditingController();
  TextEditingController healthInsurance = new TextEditingController();
  //Home address info
  TextEditingController fullAddressC = new TextEditingController();
  TextEditingController postalcodeC = new TextEditingController();
  TextEditingController countryC = new TextEditingController();
  TextEditingController stateC = new TextEditingController();
  TextEditingController cityC = new TextEditingController();
  //String countryC;
  //String stateC;
  //String cityC;
  //Emergency contact
  TextEditingController relationshipC = new TextEditingController();

  //Job info
  TextEditingController employeeStatusC = new TextEditingController();
  TextEditingController joinDateC = new TextEditingController();
  TextEditingController jobtitleC = new TextEditingController();
  TextEditingController departmentC = new TextEditingController();
  TextEditingController officeC = new TextEditingController();
  TextEditingController lineManagerC = new TextEditingController();
  TextEditingController employmentTypeC = new TextEditingController();
  TextEditingController probationstartdateC = new TextEditingController();
  TextEditingController probationenddateC = new TextEditingController();
  TextEditingController contractstartdateC = new TextEditingController();
  TextEditingController contractenddateC = new TextEditingController();
  //Dependents
  TextEditingController dfname = new TextEditingController();
  TextEditingController dlname = new TextEditingController();
  TextEditingController ddob = new TextEditingController();
  TextEditingController dnational = new TextEditingController();
  TextEditingController dgender = new TextEditingController();
  TextEditingController drelation = new TextEditingController();
  TextEditingController dcity = new TextEditingController();
  TextEditingController ddistrict = new TextEditingController();
  TextEditingController dpersonalid = new TextEditingController();
  TextEditingController dpersonaltax = new TextEditingController();
  TextEditingController des = new TextEditingController();
  TextEditingController ded = new TextEditingController();

  InfoData() {
    fullNameC.text = "Karthika Velmurugan";
    dobC.text = "13 Feb 2000";
    nationalityC.text = "-";
    emailC.text = "karthikavel2000@gmail.com";
    phnnoC.text = "+919080517780";
    genderC.text = "Female";
    maritalC.text = "-";
    personaltax.text = "-";
    socialInsurance.text = "-";
    healthInsurance.text = "-";
    //Home data
    fullAddressC.text = "-";
    postalcodeC.text = '-';
    countryC.text = '-';
    stateC.text = '-';
    cityC.text = '-';
    //emergency contact
    relationshipC.text = '-';

    //job info

    employeeStatusC.text = "Onboarding";
    joinDateC.text = "03 Sep 2020";
    jobtitleC.text = "Others";
    departmentC.text = "Tailermade";
    officeC.text = "Tailermade";
    lineManagerC.text = "-";
    employmentTypeC.text = "Full-time";
    probationstartdateC.text = "-";
    probationenddateC.text = "-";
    contractstartdateC.text = "-";
    contractenddateC.text = "-";
  }
}
