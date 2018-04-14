<?php 
// 尚贷内核类库，2014-06-11_listam
class AutoAction {
	public function autorepayment() {
        set_time_limit(0);
        header("Content-type:text/html;charset=utf-8");
        $key = $_GET['key'];
		$arg = file_get_contents(dirname(C("APP_ROOT")) . "/ThinkPHP/Auto/" . "config.txt");
		$arga = explode("|", $arg);
		if ($key != $arga[2]) exit("fail|key wrong");

		$transferDetail = new TransferDetailModel();
        $transferDetail->transferRepayment();
	}

    /**
     * 特权金自动发放收益
     * 需配置到每天的0点之后。
     */
    public function autoPrivilege(){
        $prl = new PrivilegeListModel();
        $prl->privilegeReward();
    }
} 
