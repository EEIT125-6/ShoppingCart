package xun.service;

import java.util.List;

import xun.model.BoardBean;
import xun.model.StoreBean;
import xun.model.ProductInfoBean;

public interface StoreService {
	
	boolean isDup(String stname);
	
	List<StoreBean> getSinglest(String stname);
	
	int save(StoreBean sb);
	
	int updateStore(StoreBean sb);
	
	int deleteStore(StoreBean sb);
	
	void photoStore(StoreBean sb);
	
	void bannerStore(StoreBean sb);
	
	List<StoreBean> getClassstore(String sclass);
	
	List<StoreBean> getNamestore(String stname);
	
	List<StoreBean> getFullstore(Integer id);
	
	List<StoreBean> getAdvertisementstore();
	
	List<StoreBean> getAdvertisementphotostore();
	
	List<BoardBean> getComment(Integer stid);
	
	List<ProductInfoBean> getProductInfoBeans(Integer stid);
	
	List<StoreBean> getStoreByClassAndPrice(String sclass,Integer price);
	
	StoreBean get(Integer id);
	
	Integer setStorePrice(Integer price,Integer id);
}
