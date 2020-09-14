remark.macros.scale = function (percentage) {
  var url = this;
  return '<img src="' + url + '" style="width: ' + percentage + '" />';
};

remark.macros.inline_highlight = function () {
  var word = this;
  return '<span class="inline_highlight">' + word + '</span>';
};
remark.macros.highlight_inline = function () {
  var word = this;
  return '<span class="inline_highlight">' + word + '</span>';
};
remark.macros.scale_text = function (percentage) {
  var words = this;
  return '<div style="font-size: ' + percentage + '%">' + words + '</div>';
};
remark.macros.scale_text_inline = function (percentage) {
  var words = this;
  return '<span style="font-size: ' + percentage + '%">' + words + '</span>';
};