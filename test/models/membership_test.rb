require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  def membership
    @membership ||= Membership.new
  end

  def test_valid
    assert membership.valid?
  end
end
