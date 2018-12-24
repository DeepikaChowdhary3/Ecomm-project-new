package com.cosm.dao;

import com.cosm.model.OrderDetails;

public interface OrderDetailsDAO {

	public boolean paymentProcess(OrderDetails orderDetails);
	public boolean updateCartItemStatus(String username);
}
