/**
 * Created by Administrator on 2017/10/20.
 */
$(function () {
        /*推荐默认选中*/
        $('.firstLi').addClass('select');
        /*hover事件的方法*/
        $('.leftDiv a').hover(function () {
            /* console.log('11');*/
             $(this).addClass('select');
             $(this).parent('li').siblings().find('a').removeClass('select');
         });
    })