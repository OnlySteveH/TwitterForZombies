require 'test_helper'

class WeaponTest < ActiveSupport::TestCase
  should validate_presence_of(:zombie)
end