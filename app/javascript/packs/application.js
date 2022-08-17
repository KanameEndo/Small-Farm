// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// import 'bootstrap'
// import '@fortawesome/fontawesome-free/js/all'
// import '../src/application.scss'

//スクロールをするとハンバーガーメニューに変化するための設定を関数でまとめる
function FixedAnime() {
  //ヘッダーの高さを取得
  var headerH = $('#header').outerHeight(true);
  var scroll = $(window).scrollTop();
  if (scroll >= headerH) {//ヘッダーの高さ以上までスクロールしたら
    $('.openbtn1').addClass('fadeDown');//.openbtnにfadeDownというクラス名を付与して
    $('#header').addClass('dnone');//#headerにdnoneというクラス名を付与
  } else {//それ以外は
    $('.openbtn1').removeClass('fadeDown');//fadeDownというクラス名を除き
    $('#header').removeClass('dnone');//dnoneというクラス名を除く
  }
}

// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
  FixedAnime();//スクロールをするとハンバーガーメニューに変化するための関数を呼ぶ
});

// ページが読み込まれたらすぐに動かしたい場合の記述
$(window).on('load', function () {
  FixedAnime();//スクロールをするとハンバーガーメニューに変化するための関数を呼ぶ
});


//ボタンをクリックした際のアニメーションの設定
$(".openbtn1").click(function () {//ボタンがクリックされたら
  $(this).toggleClass('active');//ボタン自身に activeクラスを付与し
  $("#header").toggleClass('panelactive');//ヘッダーにpanelactiveクラスを付与
});
$("#g-navi li a").click(function () {//ナビゲーションのリンクがクリックされたら
  $(".openbtn1").removeClass('active');//ボタンの activeクラスを除去し
  $("#header").removeClass('panelactive');//ヘッダーのpanelactiveクラスも除去
});


//リンク先のidまでスムーススクロール
//※ページ内リンクを行わない場合は不必要なので削除してください
$('#g-navi li a').click(function () {
  var elmHash = $(this).attr('href');
  var pos = $(elmHash).offset().top - 0;
  $('body,html').animate({ scrollTop: pos }, 1000);
  return false;
});
