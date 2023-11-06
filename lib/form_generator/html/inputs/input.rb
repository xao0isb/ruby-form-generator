# frozen_string_literal: true

module FormGenerator
  module Html
    module Inputs
      class Input
        def self.generate(attrs)
          attrs[:type] ||= attrs[:value].instance_of?(Integer) ? 'number' : 'text'

          input = Tag.new(:input, **attrs)

          Inputs.add_label input
        end
      end
    end
  end
end
