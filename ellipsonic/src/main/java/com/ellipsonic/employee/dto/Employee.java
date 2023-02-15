package com.ellipsonic.employee.dto;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import lombok.Data;

@Entity
@Data
public class Employee {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
int id;
String fullName;
String email;
long mobile;
Date dob;
String country;
String state;
int age;
String[] skill;
@Lob
byte[] pic;

}
