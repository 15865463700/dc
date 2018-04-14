<?php
class EmptyAction extends Action{
	//空模块
    public function _empty($name) {
        redirect(C('ERROR_PAGE'));
	}
}