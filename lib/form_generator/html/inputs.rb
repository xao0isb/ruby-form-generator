# frozen_string_literal: true

module FormGenerator
  module Html
    module Inputs
      autoload :Input, 'form_generator/html/inputs/input'
      autoload :Text, 'form_generator/html/inputs/text'
      autoload :Submit, 'form_generator/html/inputs/submit'

      def self.add_label(input)
        name = input.attrs[:name]
        id = input.attrs.fetch :id, name
        label = Tag.new(:label, for: id) { name.capitalize }

        label.html + input.html
      end
    end
  end
end
