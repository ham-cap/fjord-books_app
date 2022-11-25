# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    user1 = users(:alice)
    user2 = users(:bob)
    report = Report.new(user_id: user1.id, title: 'テスト', content: 'foobar')
    assert report.editable?(user1)
    assert_not report.editable?(user2)
  end

  test 'created_on' do
    user1 = User.new(email: 'foo@example.com')
    report = Report.new(user_id: user1.id, title: 'テスト', content: 'foobar', created_at: DateTime.new(1993, 2, 24, 12, 30, 45))
    date = Date.new(1993, 2 ,24)
    assert_equal date, report.created_on
  end
end
