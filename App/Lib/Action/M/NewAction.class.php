<?php
/**
 +------------------------------------------------------------------------------
 * 微信端新闻模块
 +------------------------------------------------------------------------------
 * @date     2016-3-3
 +------------------------------------------------------------------------------
 */
class NewAction extends HCommonAction{
    
    /**
     +----------------------------------------------------------
     * 新闻分类展示页 显示二级分类
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function index() {
        
        $category = M("article_category");
        $fields = 'id,type_name,type_set,parent_id';
        $map['is_wechat'] = 1; // 微信端专属分类
        $map['is_hiden'] = 0; // 分类为显示状态
        $map['parent_id'] = 0; // 一级分类
        $order['sort_order'] = 'DESC';
        
        // 查找一级分类
        $parent = $category->field($fields)->where($map)->order($order)->select();
        
        // 查找二级分类
        foreach ($parent as $key => $val) {
            $map['parent_id'] = $val['id'];
            $parent[$key]['son'] = $category->field($fields)->where($map)->order($order)->select();
        }
        
        $this->assign('parent',$parent);
        $this->display();
        
    }
    
    /**
     +----------------------------------------------------------
     * 新闻列表展示页
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function new_list() {
        
        $pre = C('DB_PREFIX');
        $type_id = intval($_REQUEST['id']);
        if(empty($type_id)) return;
        $map['type_set'] = 1; // 文章列表类型
        $map['is_hiden'] = 0; // 分类为显示状态
        $order['a.art_time'] = 'DESC';
        $field = 'ac.id, ac.type_name, a.id, a.title, a.art_info, a.art_keyword, a.art_content, a.art_writer, a.art_time, a.art_url, a.art_img';
        $category = M('article_category ac');
        $article = M('article a');
                
        $type = $category->where($map)->find($type_id);
        if(!is_array($type)) $this->error ("非法操作！");
        
        $search['a.type_id'] = $type_id;
        $search['ac.is_hiden'] = 0;
        
        // 分页显示
        import( "ORG.Util.Page" );
        $count = $article->join($pre.'article_category ac ON a.type_id = ac.id')->where($search)->count();
        $pagesize = 5;
        $p = new Page($count, $pagesize);
        $page = $p->show();
        $Lsql = "{$p->firstRow},{$p->listRows}";
        $show['total'] = ceil($count/$pagesize);
        $show['nowPage'] =  isset($_REQUEST['p'])?$_REQUEST['p']:1;
        
        
        $news = $article->field($field)->join($pre.'article_category ac ON a.type_id = ac.id')->where($search)->order($order)->limit($Lsql)->select();
        $this->assign('list',$news);
        
        // 加载更多
        if($this->isAjax()){
            exit($this->fetch("load"));
        }
        
        $this->assign('page',$show);
        $this->assign('type_name',$type['type_name']);
        $this->display();
        
    }
    
     /**
     +----------------------------------------------------------
     * 新闻内容展示页
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function new_view() {
        
        $cid = intval($_REQUEST['cid']);
        $nid = intval($_REQUEST['nid']);
        if(empty($cid) && empty($nid)) $this->error ("非法访问！");
        $pre = C('DB_PREFIX'); 
        $cotegory = M("article_category ac");
        $is_new = true;
        
        if(!empty($nid)){
            // 若新闻id不为空，则显示新闻内容
            $field = 'ac.type_name, a.title, a.art_time time, a.art_content content, a.art_img';
            $map['a.id'] = $nid;
            $content = $cotegory->field($field)->join($pre.'article a ON a.type_id = ac.id')->where($map)->find();
            
        }else{
            // 若新闻分类id不为空，则显示分类内容
            $field = 'type_name title,type_content content, add_time time';
            $map['id'] = $cid;
            $content = $cotegory->field($field)->where($map)->find();
            $is_new = false;
        }
        
        $this->assign('content',$content);
        $this->assign('is_new',$is_new);
        $this->display();
        
    }

}   
?>
