$(document).ready(function() {
	$("#bookmark-layer").click(function() {
        $.ajax({
            url: '/your-endpoint-url',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                product_serial_num: 'your-product-serial-num',
                user_serial_num: 'your-user-serial-num'
            }),
            success: function() {
                var isHeartFilled = $('#heart-icon').toggleClass('filled').hasClass('filled');
                if (isHeartFilled) {
                    $('#heart-icon').attr('src', "/assets/filledhearticon.png");
                } else {
                    $('#heart-icon').attr('src', "/assets/hearticon.png");
                }
            }
        });
    });
    
    $('#auction-confirm-btn').click(function() {
        $.ajax({
            url: '/your-endpoint-url', // Replace with your endpoint URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                product_serial_num: 'your-product-serial-num', // Replace with your product serial number
                user_serial_num: 'your-user-serial-num' // Replace with your user serial number
            }),
            success: function() {
                alert('입찰이 성공적으로 이루어졌습니다.');
            },
            error: function() {
                alert('입찰에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
});
 