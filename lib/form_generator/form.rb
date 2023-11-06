# frozen_string_literal: true

module FormGenerator
  class Form
    attr_reader :attrs, :inputs

    DEFAULT_ATTRS = {
      action: '#',
      method: 'post'
    }.freeze

    def initialize(object, **attrs, &block)
      attrs[:action] = attrs[:url] if attrs.key? :url
      attrs = attrs.except :url

      @attrs = DEFAULT_ATTRS.merge attrs
      @inputs = []

      @object = object

      yield(self) if block
    end

    def input(name, **attrs)
      input = {
        name:,
        value: @object.public_send(name),
        id: attrs.fetch(:id, name),
        **attrs
      }
      @inputs.push input
    end

    def submit(value = 'Save')
      @inputs.push({ as: :submit, value: })
    end
  end
end
