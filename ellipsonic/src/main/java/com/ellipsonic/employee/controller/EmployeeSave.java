package com.ellipsonic.employee.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ellipsonic.employee.dao.EmployeeDao;
import com.ellipsonic.employee.dto.Employee;

@WebServlet("/saveEmployee")
@MultipartConfig
public class EmployeeSave extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Employee employee = new Employee();
		employee.setFullName(req.getParameter("fullname"));
		employee.setCountry(req.getParameter("country"));
		Date dob = Date.valueOf(req.getParameter("dob"));
		employee.setDob(dob);
		employee.setMobile(Long.parseLong(req.getParameter("number")));
		employee.setState(req.getParameter("state"));
		employee.setSkill(req.getParameterValues("skills"));
		employee.setEmail(req.getParameter("email"));

		int doby = dob.toLocalDate().getYear();
		int cy = LocalDate.now().getYear();
		employee.setAge(cy - doby);

		byte[] pic = null;
		Part filepart = req.getPart("pic");
		if (filepart != null) {
			InputStream inputStream = filepart.getInputStream();
			pic = new byte[inputStream.available()];
			inputStream.read(pic);
		}

		employee.setPic(pic);

		EmployeeDao dao = new EmployeeDao();
		dao.save(employee);

		resp.sendRedirect("fetchAll");

	}
}
