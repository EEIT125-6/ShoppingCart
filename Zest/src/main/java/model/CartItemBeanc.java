package model;
//package model;
//
//
//import java.time.OffsetDateTime;
//import java.util.List;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//import webUser.model.WebUserData;
//import xun.model.ProductInfoBean;
////import org.springframework.data.annotation.Transient;
//
//@Entity
//@Table(name = "CartItem")
//public class CartItemBean {	
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	Integer purchase_Id;//交易代號
////	@JoinColumn(name = "userId", columnDefinition = ("char(7)"))
//	@JoinColumn(name = "userId")
//	@ManyToOne
//	WebUserData product_User;//購買人資訊
//	@ManyToOne
////	@JoinColumn(name="ProductInformation",columnDefinition=("nvarchar(50)"))
//	@JoinColumn(name="ProductInformation")
//	ProductInfoBean product_Information;//產品資訊
//	@Column(name="PurchaseQuantity", columnDefinition=("nvarchar(50)"))
//	String product_Quantity;//購買數量
//	@Column(name="PurchaseTime",columnDefinition=("timestamp with time zone"))
//	OffsetDateTime purchase_Timing = OffsetDateTime.now();//交易時間帶時區
//	@Column(name="PurchasePayment", columnDefinition=("nvarchar(10)"))
//	Boolean purchase_Payment;//付款狀態
//	@Column(name="PurchaseTransort", columnDefinition=("nvarchar(10)"))
//	String purchase_Transport; //運送狀態
//	
//	public CartItemBean() {
//		super();
//	}
//
//	public CartItemBean(WebUserData product_User, ProductInfoBean product_Info, String product_Quantity,
//			OffsetDateTime purchase_Time, Boolean purchase_Payment, String purchase_Trans) {
//		super();
//		this.product_User = product_User;
//		this.product_Information = product_Info;
//		this.product_Quantity = product_Quantity;
//		this.purchase_Timing = purchase_Time;
//		this.purchase_Payment = purchase_Payment;
//		this.purchase_Transport = purchase_Trans;
//	}
//
//	
//	public WebUserData getProduct_User() {
//		return product_User;
//	}
//	
//	public void setProduct_User(WebUserData product_User) {
//		this.product_User = product_User;
//	}
//	
//	public ProductInfoBean getProduct_Info() {
//		return product_Information;
//	}
//	
//	public void setProduct_Info(ProductInfoBean product_Info) {
//		this.product_Information = product_Info;
//	}
//	
//	public String getProduct_Quantity() {
//		return product_Quantity;
//	}
//	
//	public void setProduct_Quantity(String product_Quantity) {
//		this.product_Quantity = product_Quantity;
//	}
//	
//	public OffsetDateTime getPurchase_Time() {
//		return purchase_Timing;
//	}
//	
//	public void setPurchase_Time(OffsetDateTime purchase_Time) {
//		this.purchase_Timing = purchase_Time;
//	}
//	
//	public Boolean getPurchase_Payment() {
//		return purchase_Payment;
//	}
//	
//	public void setPurchase_Payment(Boolean purchase_Payment) {
//		this.purchase_Payment = purchase_Payment;
//	}
//	
//	public String getPurchase_Trans() {
//		return purchase_Transport;
//	}
//	
//	public void setPurchase_Trans(String purchase_Trans) {
//		this.purchase_Transport = purchase_Trans;
//	}
//	
//	public CartItemBean(List<ProductInfoBean> list, Integer id) {
//		super();
//	}
//	
//	
//
//	}
//	
//	
//
