# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @taro = users(:taro)
    @hanako = users(:hanako)
  end

  test "太郎が花子をフォローしているか確かめる" do
    assert_equal  true, @taro.following?(@hanako)
  end

  test "花子が太郎にフォローされてるか確かめる" do
    assert_equal  true, @hanako.followed_by?(@taro)
  end

  test "花子は太郎をフォロー出来るか確かめる" do
    assert @hanako.follow(@taro)
  end

  test "太郎が花子をアンフォロー出来るか確かめる" do
    assert @taro.unfollow(@hanako)
  end

  test "太郎の名前があれば名前を、なければメアドを返す" do
    assert_equal "太郎", @taro.name_or_email
    @taro.name = nil
    assert_equal "taro@example.com", @taro.name_or_email
  end

end
