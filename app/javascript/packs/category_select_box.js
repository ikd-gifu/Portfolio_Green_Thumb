$(document).on('turbolinks:load', function() {

  //復活させるダミーの中カテゴリのセレクトボックス
    let defaultPlantManagementSlipSelect = `<div id="plant_management_slip"><div class="field"><label class="label-login" for="gardening_diary_plant_name">植物個体名</label><select name="plant_management_slip", class="form-control">
    <option value>植物個体名を選択してください</option>
    </select></div></div>`;
  
  //中カテゴリの処理
   $(document).on('change', '#gardening_diary_plant_name', function() {
    let categoryVal = $('#gardening_diary_plant_name').val();
  
    //大カテゴリが変更されてvalueに値が入った場合の処理
    if (categoryVal !== "") {
     let selectedTemplate = $(`#plant_management_slip_${categoryVal}`); //呼び出すtamplateのidセット
  
     $('#plant_management_slip').remove(); //デフォルト表示用の中カテゴリを削除
     $("#selected_plant_management_slip").remove(); //前に選択した中カテゴリがある場合に削除
     $('#plant_management_slip_insert_point').after(selectedTemplate.html());　//大カテゴリに紐づいた中カテゴリセレクトを追加
  
    }else {
  
     //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
     $("#selected_plant_management_slip").remove();//前に選択した中カテゴリがある場合に削除
     $('#plant_management_slip').remove();//デフォルト表示用の中カテゴリを削除
     $('#plant_management_slip_insert_point').after(defaultPlantManagementSlipSelect); //デフォルト表示の中カテゴリを追加
  
    };
   });
  
  }); //$(document).on('turbolinks:load', function()
  