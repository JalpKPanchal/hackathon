package com.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "course")
@Data
public class CourseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer courseid; 
	private String courseName;
}