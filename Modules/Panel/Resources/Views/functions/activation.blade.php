function changeActive(id, name) {
var element = $("#" + id + '-active')
var url = element.attr('data-url')
var elementValue = !element.prop('checked');

$.ajax({
url: url,
type: "GET",
success: function (response) {
if (response.activation) {
if (response.checked) {
element.prop('checked', true);
successToast('فعال سازی ' + name + ' با موفقیت انجام شد ')
} else {
element.prop('checked', false);
warningToast('غیر فعال سازی ' + name + ' با موفقیت انجام شد ')
}
} else {
element.prop('checked', elementValue);
errorToast('هنگام ویرایش مشکلی بوجود امده است')
}
},
error: function () {
element.prop('checked', elementValue);
errorToast('ارتباط برقرار نشد')
}
});
}
