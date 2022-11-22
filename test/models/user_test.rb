# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following?' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not bob.followed_by?(alice)
    alice.follow(bob)
    assert bob.followed_by?(alice)
  end

  test '#unfollow' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com')
    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'bar'
    assert_equal 'bar', user.name_or_email
  end
end
