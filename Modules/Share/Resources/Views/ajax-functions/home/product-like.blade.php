<script type="text/javascript">
    $('.product-like button').click(function () {
        var url = $(this).attr('data-url');
        var element = $(this);
        $.ajax({
            url: url,
            success: function (result) {
                if (result.status === 1) {
                    $(element).children().first().addClass('text-lightcoral');
                    $(element).attr('data-original-title', 'لایک نکردن');
                    $(element).attr('data-bs-original-title', 'لایک نکردن');
                    swal('آیتم توسط شما لایک شد', 'info')
                } else if (result.status === 2) {
                    $(element).children().first().removeClass('text-lightcoral')
                    $(element).attr('data-original-title', 'لایک کردن');
                    $(element).attr('data-bs-original-title', 'لایک کردن');
                    swal('آیتم توسط شما از لایک خارج شد', 'warning')
                } else if (result.status === 3) {
                    loginToast()
                }
            }
        })
    })
</script>
