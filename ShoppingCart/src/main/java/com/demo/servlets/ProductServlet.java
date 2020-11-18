package com.demo.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.Product;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ProductServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product productModel = new Product(request.getParameter("id"), request.getParameter("name"),
				request.getParameter("photo"), Integer.parseInt(request.getParameter("price")));
		request.setAttribute("products", productModel);
		request.getRequestDispatcher("product/index.jsp").forward(request, response);
	}

}