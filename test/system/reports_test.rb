require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report_written_by_taro = reports(:report_written_by_taro)
    @taro = users(:taro)
    @hanako = users(:hanako)
  end
  test "visiting the index" do
    visit root_path

    fill_in 'Eメール', with: @taro.email
    fill_in 'パスワード', with: "111111"
    click_on 'ログイン'

    visit new_report_url

    fill_in 'タイトル', with: '晴れが好き'
    fill_in '内容', with: '明日晴れたらな'
    click_on '登録する'

    assert_text '日報が作成されました。'
  end
end
