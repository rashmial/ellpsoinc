package com.ellipsonic.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ellipsonic.employee.dao.EmployeeDao;

@WebServlet("/delete")
public class EmployeeDelete extends HttpServlet
{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int a=Integer.parseInt(req.getParameter("id"));
	EmployeeDao dao=new EmployeeDao();
	dao.delete(a);
	resp.sendRedirect("fetchAll");
}
}
