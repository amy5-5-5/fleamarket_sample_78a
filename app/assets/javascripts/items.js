$(document).on('turbolinks:load', ()=> {
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

  // 画像が3枚アップロードされている場合、新たなフォームを追加しない処理
  $(window).on('load', function(){
    if ($('.prevImg4').length === 3) {
      console.log($('.prevImg4').length);
      $('#imageBox4').hide();
    }
  });

  // 画像アップロードフォームのname属性およびidに付与するindex番号を動的にするための配列生成
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 画像数のカウント
  let count = 0;

  // 画像アップロードフォームに変更が加わった際の処理
  $('#imageBox4').on('change', '.img-js4', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else if ($('.prevImg4').length === 2) {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#imageBox4').hide();
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // 画像アップロードフォームを追加する処理
      $('.js-file_group4').hide();
      $('#imageBox4').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      count += 1;
      $('.imgalert').remove();
    }
  });

  // 削除ボタンが押された時の処理
  $('#previews').on('click', '.js-remove4', function() {
    const targetIndex = $(this).data('index');
    if ($('.img-js4').length == 0) {
      $('#imageBox4').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    } 
    $(`div[data-index="${targetIndex}"]`).remove();
    $(`span[data-index="${targetIndex}"]`).remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    count -= 1;
    if (count === 0) {
      $('.ItemForm4__image4').append('<p class="imgalert">出品画像は1枚以上必須です</p>');
    }
    if ($('.prevImg4').length < 3) {
      
    }
  });

  // 編集ボタンが押された時の処理
  $('#previews').on('click', '.js-edit4', function(){
    const targetIndex = $(this).data('index');
    $(`label[data-index="${targetIndex}"]`).click();
  });
});