var myScroll,pullDownEl, pullDownOffset = 0;

function resetDom(){
	var downHtml = '<div class="centerBox-wp">'+
                		'<div class="pullDownTips">'+               
	                    	'<span class="pullDownIcon"></span>'+
	                    	'<div class="pullLoading">'+
	                    		'<div class="loading-circle"></div>'+
	                    		'<div class="loading-logo"></div>'+
	                   	 '</div>'+
               			'</div>'+
            		'</div>';
	$('#pullDown').html('').html(downHtml);
}

$(function(){
	resetDom();
})

/**
* 下拉刷新 （自定义实现此方法）
* myScroll.refresh();       数据加载完成后，调用界面更新方法
*/
function pullDownAction() {
    setTimeout(function () {    // <-- Simulate network congestion, remove setTimeout from production!
    if (iScroll.onLoadData) iScroll.onLoadData("empty"); 
        myScroll.refresh();     //数据加载完成后，调用界面更新方法   Remember to refresh when contents are loaded (ie: on ajax completion)
    }, 1000);       // <-- Simulate network congestion, remove setTimeout from production!
}

/**
* 初始化iScroll控件
*/
function loaded() {
    pullDownEl = document.getElementById('pullDown');
    pullDownOffset = pullDownEl.offsetHeight;

    myScroll = new iScroll('wrappers', {
        scrollbarClass: 'myScrollbar', /* 重要样式 */
        useTransition: true, 
        topOffset: pullDownOffset,
        onRefresh: function () {
            if (pullDownEl.className.match('loading')) {
                pullDownEl.className = '';
                //pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
            }
        },
        onScrollMove: function () {
            if (this.y > 1 && !pullDownEl.className.match('pulling')) {
                pullDownEl.className = 'pulling';
                pullDownEl.querySelector('.pullDownIcon').style.transform = 'rotateZ(-180deg)';
                pullDownEl.querySelector('.pullDownIcon').style.webkitTransform = 'rotateZ(-180deg)';
                this.minScrollY = 0;
            } 
            if (this.y < 1 && pullDownEl.className.match('pulling')) {
                pullDownEl.className = '';
                pullDownEl.querySelector('.pullDownIcon').style.transform = 'rotateZ(0)';
                pullDownEl.querySelector('.pullDownIcon').style.webkitTransform = 'rotateZ(0)';
                this.minScrollY = -pullDownOffset;
            } 
        },
        onScrollEnd: function () {
            if (pullDownEl.className.match('pulling')) {
                pullDownEl.className = 'loading';
                pullDownEl.querySelector('.pullDownIcon').style.transform = 'rotateZ(0)';
                pullDownEl.querySelector('.pullDownIcon').style.webkitTransform = 'rotateZ(0)';
                pullDownAction();   // Execute custom function (ajax call?)
            }
        }
    });


    setTimeout(function () { document.getElementById('wrappers').style.left = '0'; },500);
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);//阻止冒泡
document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 0); }, false);
