package com.demo.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.entities.Item;
import com.demo.entities.Product;


@WebServlet("/cart")
public class CartServlet extends HttpServlet { //購物邏輯處理頁面

	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			DisplayCart(request, response);
		} else {
			if (action.equalsIgnoreCase("buy")) {
				Buy(request, response);
			} else if (action.equalsIgnoreCase("remove")) {
				Remove(request, response);
			}
		}
	}

	protected void DisplayCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("cart/index.jsp").forward(request, response);
	}

	protected void Remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		int index = isExisting(request.getParameter("id"), cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		response.sendRedirect("cart");
	}

	protected void Buy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product productModel = new Product(request.getParameter("id"), request.getParameter("name"),
				request.getParameter("photo"), Integer.parseInt(request.getParameter("price")));
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			
			cart.add(new Item(productModel, 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = isExisting(request.getParameter("id"), cart);
			if (index == -1) {				
				cart.add(new Item(productModel, 1));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}
		response.sendRedirect("cart");
	}
  
	private int isExisting(String id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId().equalsIgnoreCase(id)) {
				return i;
			}
		}
		return -1;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException,ServletException{
		doPost(request,response);
}

}