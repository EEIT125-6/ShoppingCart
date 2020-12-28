package Controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import Model.CartItemBean;
import Model.ProductInfoBean;
import Model.WebUserData;
import Service.CartService;

@Controller
@RequestMapping("/")
@SessionAttributes({ "userFullData" })
public class ShoppingCartController {

	@Autowired
	CartService service;;
	SessionFactory session;

	@ModelAttribute("checkMemberStatus") // 使用者按下購物車立刻在session中檢查會員身分
	public String checkMemberStatus(Model model) {
		WebUserData usdt = (WebUserData) model.getAttribute("userFullData");
		String inputAccount = usdt.getUserId();
		Integer checkMemberStatusResult = service.checkAccountExist(inputAccount);
		if (checkMemberStatusResult == 1) {
			return "/myCartRedirector";
		} else if (checkMemberStatusResult == 0) {
			JOptionPane.showInternalMessageDialog(null, "橙皮美食平台", "請登入後才能開始購物喔", JOptionPane.WARNING_MESSAGE);
			return "/WebUser/WebUserLogin";
		} else {
			JOptionPane.showInternalMessageDialog(null, "橙皮美食平台", "系統錯誤，請重新再操作一次喔", JOptionPane.ERROR_MESSAGE);
			return "Index1";
		}
	}

	@GetMapping(value = "mallRedirector") // 跳轉至購物商城 V
	public String mallRedirector(Model model) {
		List<ProductInfoBean> list = service.getProductList(); // 呼叫service層執行業務邏輯運算
		model.addAttribute("product", list); // 將回傳結果加入attribute中
		return "product/mall"; // webappconfig中已導入 prefix suffix (.jsp)
	}

	@SuppressWarnings("unchecked")
	@GetMapping(value = "myCartRedirector") // 跳轉至個人購物車 V
	public String myCartRedirector(Model model) {
		WebUserData usdt = (WebUserData) model.getAttribute("userFullData");
		String inputId = usdt.getUserId();
		List<CartItemBean> list = (List<CartItemBean>) service.getCartByUser(inputId);
		model.addAttribute("myproduct", list);
		return "cart/cart"; // webappconfig中已導入 prefix suffix (.jsp)
	}

	@SuppressWarnings("unchecked")
	@GetMapping(value = "itemremove") // 移除個人購物車中選定項目
	public String itemRemover(@PathVariable(value = "id") int id, HttpSession session) {
		List<CartItemBean> list = (List<CartItemBean>) session.getAttribute("cart");
		int index = isExisting(id, session);
		list.remove(index);
		session.setAttribute("cart", list);
		return "cart/cart";
	}

	@SuppressWarnings("unchecked")
	@GetMapping(value = "itemadd") // 加入選定項目進入購物車
	public String itemAdder(@PathVariable(value = "id") int id, HttpSession session) {
		if (session.getAttribute("cart") == null) {
			List<CartItemBean> list = new ArrayList<CartItemBean>();
			list.add(new CartItemBean(this.service.find(id), 1)); // 稍後定義尋找購物車內特定商品方法
			session.setAttribute("cart", list);
		} else {
			List<CartItemBean> list = (List<CartItemBean>) session.getAttribute("cart");
			list.add(new CartItemBean(this.service.find(id), 1));
			session.setAttribute("cart", list);
		}
		return "cart/cart";

	}

	@SuppressWarnings("unchecked")
	private static int isExisting(Integer inputid, HttpSession session) { // 檢查選擇商品是否存在於購物車內
		List<CartItemBean> list = (List<CartItemBean>) session.getAttribute("cart");
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getProduct_id() == inputid) {
				return i;
			}
		}
		return -1;
	}

}
