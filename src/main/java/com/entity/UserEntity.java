package com.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "users")
@Data
public class UserEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private UUID userId;
	private String firstName;
	private String lastName;
	private String gender;
	private String email;
	private String password;
	private String contactNum;
	private String city;
	private String collegeName;
	private Integer courseId;//fk
	private String semester;
	private String languageKnown;
	private String reference;
	private Integer roleId;// fk
}