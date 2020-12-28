package Model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.Bean;
import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "ProductInfo")
public class ProductInfoBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_id;
	@Column(nullable = false)
	private String product_name;
	@Column(nullable = false)
	private String product_shop;
	@Column(nullable = false)
	private Integer product_price;
	@Column(nullable = false)
	private String product_picture;
	@Column(nullable = false)
	private Integer product_quantity;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Store_Id")
	private StoreBean storebean;

	public ProductInfoBean() {
		super();
	}

	public ProductInfoBean(Integer product_id, String product_name, String product_shop, Integer product_price,
			String product_picture, Integer product_quantity) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_shop = product_shop;
		this.product_price = product_price;
		this.product_picture = product_picture;
		this.product_quantity = product_quantity;

	}
	
	@Transient
	public Integer getProduct_id() {
		return product_id;
	}
	@Transient
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	@Transient
	public String getProduct_name() {
		return product_name;
	}
	@Transient
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	@Transient
	public String getProduct_shop() {
		return product_shop;
	}
	@Transient
	public void setProduct_shop(String product_shop) {
		this.product_shop = product_shop;
	}
	@Transient
	public Integer getProduct_price() {
		return product_price;
	}
	@Transient
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	@Transient
	public String getProduct_picture() {
		return product_picture;
	}
	@Transient
	public void setProduct_picture(String product_picture) {
		this.product_picture = product_picture;
	}
	@Transient
	public Integer getProduct_quantity() {
		return product_quantity;
	}
	@Transient
	public void setProduct_quantity(Integer product_quantity) {
		this.product_quantity = product_quantity;
	}
	@Transient
	public StoreBean getStorebean() {
		return storebean;
	}
	@Transient
	public void setStorebean(StoreBean storebean) {
		this.storebean = storebean;
	}


}
