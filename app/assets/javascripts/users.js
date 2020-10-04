$(document).on('turbolinks:load', () => {
  let tabs = $(".mypage-main-tab");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const show = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".mypage-main-content").removeClass("show").eq(show).addClass("show");
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);   
});


$(document).on('turbolinks:load', () => {
  let tabs = $(".mypage-purchase-tab");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const show = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".mypage-purchase-content").removeClass("show").eq(show).addClass("show");
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);   
});