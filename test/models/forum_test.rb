require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  def setup
    @forum = Forum.new(category: "News & Announcements")
  end

  test "should be valid" do
    assert @forum.valid?
  end

  test "category should be present" do
    @forum.category = "  "
    assert_not @forum.valid?
  end

  test "category should not be too long" do
    @forum.category = "a" * 256
    assert_not @forum.valid?
  end

  test "category should be unique" do
    duplicate_forum = @forum.dup
    duplicate_forum.category = @forum.category.upcase
    @forum.save
    assert_not duplicate_forum.valid?
  end

  test "category should have a minimum length" do
    @forum.category = "a" * 3
    assert_not @forum.valid?
  end
end
