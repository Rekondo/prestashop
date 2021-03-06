<?php

class ShipmentTracking extends Module
{
	function __construct()
	{
		$this->name = 'shipmenttracking';
		$this->tab = 'Vendor';
		$this->version = '0.9';

		parent::__construct();

		$this->displayName = $this->l('Shipment tracking');
		$this->description = $this->l('Allows the customer to follow their deliveries while they are in shipment');
	}
	
	function install()
	{
			if (!file_exists(dirname(__FILE__).'/install.sql'))
				return (false);
			else if (!$sql = file_get_contents(dirname(__FILE__).'/install.sql'))
				return (false);
			$sql = str_replace('PREFIX_', _DB_PREFIX_, $sql);
			$sql = preg_split("/;\s*[\r\n]+/",$sql);
			foreach ($sql as $query)
				if (trim($query) && !Db::getInstance()->Execute(trim($query)))
					return (false);
			if
			(
				parent::install() == false
				OR $this->registerHook('orderDetail') == false
			)
			return false;
		return true;
	}

	public function hookOrderDetail($params)
        {
		global $order, $smarty;

		require_once(dirname(__FILE__) . "/OrderShipment.php");

		$smarty->assign("order", $order);
		$smarty->assign("shipments", OrderShipment::get_from_order($order->id));
		return $this->display(__FILE__, "shipmenttracking.tpl");
        }
}

?>
