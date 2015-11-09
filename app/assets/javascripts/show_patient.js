var ready1, ready2;
ready1 = $(function () {
  $('#datepicker1').datetimepicker({
    pickTime: false
  });
});

ready2 = $(function () {
  $('#timepicker1').datetimepicker({
    pickDate: false,
    useSeconds: true
  });
});

$(document).ready(ready1);
$(document).on('page:load', ready1);
$(document).ready(ready2);
$(document).on('page:load', ready2);

var temp = $(document).ready(function () {
  $('#my-link').click(function (event) {
    var time = $('#time').val();
    var date = $('#date').val();
    var _href = $('#my-link').attr('href');
    $('#my-link').attr('href', _href + '&time=' + time + '&date=' + date);
  });
});

$(document).on('page:load', temp);
