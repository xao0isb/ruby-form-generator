# frozen_string_literal: true

module FormGenerator
  module Html
    module Inputs
      class Text
        def self.generate(attrs)
          attrs[:cols] ||= 20
          attrs[:rows] ||= 40

          textarea = Tag.new(:textarea, **attrs.except(:value)) { attrs[:value] }

          Inputs.add_label textarea
        end
      end
    end
  end
end
