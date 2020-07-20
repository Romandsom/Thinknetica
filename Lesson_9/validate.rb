# frozen_string_literal: true

module Validate
  def valid?
    validate!
  rescue StandardError
    false
  end
end
