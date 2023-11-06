# frozen_string_literal: true

module FormGenerator
  module Html
    autoload :Inputs, 'form_generator/html/inputs'
    autoload :Tag, 'form_generator/html/tag'

    def self.render_input(attrs)
      type = attrs.fetch(:as, 'input').capitalize
      const_get("Inputs::#{type}").generate(attrs.except(:as))
    end

    def self.render(form)
      inputs = form.inputs
      rendered_inputs = inputs.map { |i| render_input i }

      Tag.new(:form, **form.attrs) { rendered_inputs.join }.html
    end
  end
end
