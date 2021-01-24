package model;

import java.util.LinkedHashMap;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.annotations.Expose;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import xun.model.ProductInfoBean;
import xun.model.StoreBean;

@Entity
@Table(name = "CartDetail") //本類別封裝個別購物車內詳細商品資訊
public class CartDetailBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer cartDetailId; //購物車id
	@ManyToOne
    ProductInfoBean product; //產品名稱
	Integer product_quantity; //產品採購數量
	@ManyToOne
	@JsonIgnore
	OrderDetailBean orderDetailBean; //訂單資料
	
	public CartDetailBean() {
		super();
	}
		
	
	
	public CartDetailBean(ProductInfoBean product,
			Integer product_quantity, OrderDetailBean orderDetailBean) {
		super();
		this.product = product;
		this.product_quantity = product_quantity;
		this.orderDetailBean =  orderDetailBean;
		
	}
	
	public Integer getCartDetailId() {
		return cartDetailId;
	}
	public void setCartDetailId(Integer cartDetailId) {
		this.cartDetailId = cartDetailId;
	}
	public ProductInfoBean getProduct() {
		return product;
	}
	public void setProduct(ProductInfoBean product) {
		this.product = product;
	}
	public Integer getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(Integer product_quantity) {
		this.product_quantity = product_quantity;
	}
	
	
	

	
}
