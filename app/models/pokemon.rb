# frozen_string_literal: true

# Pokemon Model
class Pokemon < ApplicationRecord
  belongs_to :type, optional: true
  scope :short_name, -> { where('length(name) < 10') }

  def explicit_name
    "Pokemon '#{name}'"
  end

  def self.destroy_short_name
    short_name.destroy_all
  end
end
