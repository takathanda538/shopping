$(function() {
  console.log("address_autofill")
  $("#customer_postal_code").change(function(){
    $(this).jpostal({
      postcode : [
        '#customer_postal_code'
      ],
      address: {
        "#customer_prefecture_code": "%3", // # 都道府県が入力される
        "#customer_city"           : "%4%5", // # 市区町村と町域が入力される
        "#customer_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});