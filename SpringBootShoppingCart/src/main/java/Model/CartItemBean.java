package Model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "CartItem")
public class CartItemBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(nullable = false, columnDefinition = ("int"))
	private Integer product_id;
	@Id
	@Column
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "userId", columnDefinition = ("char(7)"))
	private String product_user;
	@Column(nullable = false, columnDefinition = ("nvarchar(50)"))
	private String product_name;
	@Column(nullable = false, columnDefinition = ("nvarchar(50)"))
	private String product_shop;
	@Column(nullable = false, columnDefinition = ("int"))
	private Integer product_price;
	@Column(nullable = false, columnDefinition = ("nvarchar(MAX)"))
	private String product_picture;
	@Column
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Store_Id", columnDefinition = ("int"))
	private StoreBean product_store;
	@Transient
	private CartItemBean cartItemBean;

	public CartItemBean() {
		super();
	}
	
	public CartItemBean(Integer product_id, String product_user, String product_name, String product_shop,
			Integer product_price, String product_picture, StoreBean product_store, CartItemBean cartItemBean) {
		super();
		this.product_id = product_id;
		this.product_user = product_user;
		this.product_name = product_name;
		this.product_shop = product_shop;
		this.product_price = product_price;
		this.product_picture = product_picture;
		this.product_store = product_store;
		this.cartItemBean = cartItemBean;

	}
	
	public CartItemBean(List<CartItemBean> list, int id) {
		// TODO Auto-generated constructor stub
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	
	public String getProduct_user() {
		return product_user;
	}
	
	public void setProduct_user(String product_user) {
		this.product_user = product_user;
	}

	public String getProduct_name() {
		return product_name;
	}
	
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getProduct_shop() {
		return product_shop;
	}
	
	public void setProduct_shop(String product_shop) {
		this.product_shop = product_shop;
	}
	
	public Integer getProduct_price() {
		return product_price;
	}
	
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	
	public String getProduct_picture() {
		return product_picture;
	}
	
	public void setProduct_picture(String product_picture) {
		this.product_picture = product_picture;
	}
	
	public StoreBean getProduct_store() {
		return product_store;
	}
	
	public void setProduct_store(StoreBean product_store) {
		this.product_store = product_store;
	}
	
	public void setCartItemBean(CartItemBean cartItemBean) {
		this.cartItemBean = cartItemBean;
	}
	
	public CartItemBean getCartItemBean() {
		return cartItemBean;
	}

}
