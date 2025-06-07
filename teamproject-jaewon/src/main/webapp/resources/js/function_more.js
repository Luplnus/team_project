$(document).ready(function (){
    let idx = 0;
    $('.content_box_myPageIcon').click(function(){
        if(idx % 2 == 0) {
            $('.more_btn_nav').css({
                display:"block"
            })
        }
        else if(idx % 2 == 1) {
            $('.more_btn_nav').css({
                display:'none'
            })
        }
        idx++
    })
})