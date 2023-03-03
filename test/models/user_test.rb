# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @taro = users(:taro)
    @hanako = users(:hanako)
  end

  test 'following?(user)?' do
    assert @taro.following?(@hanako)
    assert_not @hanako.following?(@taro)
  end

  test ' followed_by?(user)?' do
    assert @hanako.followed_by?(@taro)
    assert_not @taro.followed_by?(@hanako)
  end

  test 'follow(user)' do
    assert @taro.follow(@hanako)
    assert_not_equal false, @hanako.follow(@taro)
  end

  test 'unfollow(user)' do
    assert @taro.unfollow(@hanako)
    assert_not @hanako.unfollow(@taro)
  end

  test 'name_or_email' do
    assert_equal '太郎', @taro.name_or_email
    @taro.name = nil
    assert_equal 'taro@example.com', @taro.name_or_email
  end
end
