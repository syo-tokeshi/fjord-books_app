# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report_written_by_taro = reports(:report_written_by_taro)
    @taro = users(:taro)
    @hanako = users(:hanako)
  end

  test "editable?" do
    assert_equal false, @report_written_by_taro.editable?(@hanako)
    assert_equal true, @report_written_by_taro.editable?(@taro)
  end

  test "created_on" do
    assert_equal Date.today, @report_written_by_taro.created_on
  end
end
