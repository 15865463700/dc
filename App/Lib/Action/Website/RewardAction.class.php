<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 2016/12/19
 * Time: 14:00
 */

class RewardAction{
    public function issue(){
        header("Content-type:text/html;charset=utf-8");

        echo "<br/>############# 散标 开始 #############<br/>";
        $this->sanreward();
        echo "<br/>############# 散标 结束 #############<br/>";

//        echo "<br/>############# 优计划 开始 #############<br/>";
//        $this->fundreward();
//        echo "<br/>############# 优计划 结束 #############<br/>";
    }
    public function sanreward(){
        $pre = C("DB_PREFIX");
        $map=array();
        $timespan = strtotime('2016-11-11 00:00:00').",".strtotime('2016-12-5 24:00:00');
        $map['bi.add_time'] = array("between",$timespan);
        $field="m.id,bi.investor_uid,sum(bi.investor_capital) as investor_capital";
        $list=M("members m")
            ->join("{$pre}borrow_investor bi ON bi.investor_uid=m.id")
            ->field($field)
            ->group('bi.investor_uid')
            ->where($map)
            ->order("m.id desc")
            ->select();
        foreach($list as $v){
            $jiangli=$v['investor_capital']*0.01;
            $MM = M("member_money")->field("money_freeze,money_collect,account_money,back_money")->find($v['id']);
            $data=array();
            $data['uid'] = $v['id'];
            $data['type'] = 101;
            $data['info'] = "获得活动1%投资总额奖励".$jiangli."元!";
            $data['target_uid'] ="0";
            $data['target_uname'] = "@网站管理员@";
            $data['add_time'] = time();
            $data['add_ip'] = get_client_ip();
            $data["tag"] = 0;
            $data['affect_money'] = $jiangli;
            $data['account_money'] = $MM['account_money']+$jiangli;
            $data['collect_money'] = $MM['money_collect'];
            $data['freeze_money'] = $MM['money_freeze'];
            $data['back_money'] = $MM['back_money'];
            M('member_moneylog')->add($data);

            $mmoney['account_money']=$data['account_money'];
            M('member_money')->where("uid={$v['id']}")->save($mmoney);

            echo "投资者id是".$v['id']."，投资总金额".$v['investor_capital']."元，获得投标奖励".$jiangli."元<br/>";

        }
    }
    public function fundreward(){
        $pre = C("DB_PREFIX");
        $map=array();
        $timespan = strtotime('2016-12-1 00:00:00').",".strtotime('2016-12-19 00:00:00');
        $map['tbi.add_time'] = array("between",$timespan);
        $field="m.id,tbi.investor_uid,sum(tbi.investor_capital) as investor_capital";
        $list=M("members m")
            ->join("{$pre}transfer_borrow_investor tbi ON tbi.investor_uid=m.id")
            ->field($field)
            ->group('tbi.investor_uid')
            ->where($map)
            ->order("m.id desc")
            ->select();
        foreach($list as $v){
            $jiangli=$v['investor_capital']*0.01;
            $MM = M("member_money")->field("money_freeze,money_collect,account_money,back_money")->find($v['id']);
            $data=array();
            $data['uid'] = $v['id'];
            $data['type'] = 101;
            $data['info'] = $v['id']."获得优计划投资奖励".$jiangli."元!";
            $data['target_uid'] ="0";
            $data['target_uname'] = "@网站管理员@";
            $data['add_time'] = time();
            $data['add_ip'] = get_client_ip();
            $data["tag"] = 0;
            $data['affect_money'] = $jiangli;
            $data['account_money'] = $MM['account_money']+$jiangli;
            $data['collect_money'] = $MM['money_collect'];
            $data['freeze_money'] = $MM['money_freeze'];
            $data['back_money'] = $MM['back_money'];
            M('member_moneylog')->add($data);

            $mmoney['account_money']=$data['account_money'];
            M('member_money')->where("uid={$v['id']}")->save($mmoney);

            echo "投资者id是".$v['id']."，投资总金额".$v['investor_capital']."元，获得投标奖励".$jiangli."元<br/>";
        }
    }
    public function abc(){
        header("Content-type:text/html;charset=utf-8");
        $pre = C("DB_PREFIX");
        $map=array();
        $map['mm.type']=101;
        $map['m.id']=101;

        $field="m.id,mm.type,mm.affect_money";
        $list=M("members m")
            ->join("{$pre}member_moneylog mm ON mm.uid=m.id")
            ->field($field)
            ->where("mm.type=101")
            ->order("m.id desc")
            ->select();
        foreach($list as $v){
            echo $v['id']."号投资人获得奖励".$v['affect_money']."元".$v['type']."<br/>";
            $MM = M("member_money")->field("money_freeze,money_collect,account_money,back_money")->find($v['id']);

            $mmoney['account_money']=$MM['account_money']-$v['affect_money'];
            $res=M('member_money')->where("uid={$v['id']}")->save($mmoney);
            if($res){
                echo $v['id']."号投资人减去奖励".$v['affect_money']."元成功！<br/><br/>";
            }
        }
    }

}