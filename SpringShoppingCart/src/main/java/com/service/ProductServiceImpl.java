package com.service;

import java.util.List;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import com.DAO.ProductDAO;
import entities.com.Product;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.LogManager;


@Service("ProductService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ProductServiceImpl implements ProductService {
	

	@Autowired
	private ProductDAO productDAO;

	@Transactional			
	@Override
	public List<Product> findAll() {
		return productDAO.findAll();
	}

	@Override
	public Product find(int id) {
		return productDAO.find(id);
	}

}
