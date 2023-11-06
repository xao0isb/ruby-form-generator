# frozen_string_literal: true

module FormGenerator
  module Html
    module Inputs
      class Submit
        def self.generate(attrs)
          Tag.new(:input, type: :submit, **attrs).html
        end
      end
    end
  end
end
