# frozen_string_literal: true

module FormGenerator
  autoload :VERSION, 'form_generator/version'
  autoload :Html, 'form_generator/html'
  autoload :Form, 'form_generator/form'

  def self.form_for(object, **attributes, &)
    Html.render Form.new(object, **attributes, &)
  end
end
