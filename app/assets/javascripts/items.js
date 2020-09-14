$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group4">
                    <input class="img-js4" type="file"
                     name="item[images_attributes][${index}][src]"
                     id="item_images_attributes_${index}_src"><br>
                     <div class="js-remove4">削除</div>
                 </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#imageBox4').on('change', '.img-js4', function(e) {
    $('#imageBox4').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#imageBox4').on('click', '.js-remove4', function() {
    $(this).parent().remove();
    if ($('.img-js4').length == 0) $('#imageBox4').append(buildFileField(fileIndex[0]));
  });
});