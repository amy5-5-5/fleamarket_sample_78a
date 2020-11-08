$(document).on('turbolinks:load', ()=> {
  // 商品出品ページにおける画像アップロード用フォームを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group4">
                    <label class="uploadBtn4" data-index="${index}">
                      <i class="fas fa-camera"></i>
                      <p class="imgMsg4">クリックして画像をアップロード</p>
                      <input class="img-js4 hidden4" type="file"
                      name="item[images_attributes][${index}][src]"
                      id="item_images_attributes_${index}_src"><br>
                    </label>
                  </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="ImgPrevBox4" data-index="${index}">
                      <img class="prevImg4" data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="BtnWrap4">
                      <span class="js-edit4" data-index="${index}">変更</span>
                      <span class="js-remove4" data-index="${index}">削除</span>
                    </div>
                  </div>`;
    return html;
  }

  // 画像アップロードフォームのname属性およびidに付与するindex番号を動的にするための配列生成
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group4:last').data('index');
  fileIndex.splice(0, lastIndex);

  // 画像アップロードフォームに変更が加わった際の処理
  $('#imageBox4').on('change', '.img-js4', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // 画像アップロードフォームを追加する処理
      $('.js-file_group4').hide();
      $('#imageBox4').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      $('.imgalert').remove();
    }
  });


  // 削除ボタンが押された時の処理
  $('#previews').on('click', '.js-remove4', function() {
    const targetIndex = $(this).data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"]`);
    if (hiddenCheck.length >= 1) {
      hiddenCheck.prop('checked', true);
      $(`div[data-index="${targetIndex}"]`).hide();
    } else {
      $(`div[data-index="${targetIndex}"]`).remove();
    }
    if ($('.img-js4').length == 0) {
      $('#imageBox4').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    } 
    $(`span[data-index="${targetIndex}"]`).remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.prevImg4').length === 0) {
      $('.imgalert').remove();
      $('.ItemForm4__image4').append('<p class="imgalert">出品画像は1枚以上必須です</p>');
    }
  });

  // 画像変更ボタンが押された時の処理
  $('#previews').on('click', '.js-edit4', function(){
    const targetIndex = $(this).data('index');
    $(`label[data-index="${targetIndex}"]`).click();
  });
});