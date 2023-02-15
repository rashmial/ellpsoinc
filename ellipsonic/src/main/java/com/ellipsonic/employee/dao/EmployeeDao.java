package com.ellipsonic.employee.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.ellipsonic.employee.dto.Employee;

public class EmployeeDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public void save(Employee employee) {
		transaction.begin();
		manager.persist(employee);
		transaction.commit();
	}
	
	public void update(Employee employee) {
		transaction.begin();
		manager.merge(employee);
		transaction.commit();
	}
	
	public Employee findEmployee(int id) {
		return manager.find(Employee.class, id);
	}

	public List<Employee> fetchAll() {
		return manager.createQuery("select x from Employee x").getResultList();
	}

	public void delete(int a) {
		transaction.begin();
		manager.remove(manager.find(Employee.class, a));
		transaction.commit();
	}
}
