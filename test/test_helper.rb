# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'form_generator'

require 'minitest/autorun'
require 'minitest-power_assert'

class TestHelper < Minitest::Test
  def load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end
end

User = Struct.new(:name, :age, :job, :gender, keyword_init: true)
