require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report_written_by_taro = reports(:report_written_by_taro)
    @taro = users(:taro)
    @hanako = users(:hanako)

    visit root_path

    fill_in 'Eメール', with: @taro.email
    fill_in 'パスワード', with: "111111"
    click_on 'ログイン'
  end

  test "create report" do

    visit new_report_url

    fill_in 'タイトル', with: '晴れが好き'
    fill_in '内容', with: '明日晴れたらな'
    click_on '登録する'

    assert_text '日報が作成されました。'
  end

  test "update report" do

    visit edit_report_url(@report_written_by_taro.id)

    fill_in 'タイトル', with: '晴れが嫌い'
    fill_in '内容', with: '明日雨ならいいな'
    click_on '更新する'

    assert_text '日報が更新されました。'
  end

  test "delete report" do

    visit reports_url

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
