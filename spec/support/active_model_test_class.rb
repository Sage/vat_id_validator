require 'active_model/naming'
require 'active_model/errors'
require 'active_model/translation'
require 'active_model/validations'

class ActiveModelTestClass
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  attr_accessor :tax_number, :other_attribute
  validates :tax_number, :vat_id => true

  def self.name
    'ActiveModelTestClass'
  end
end
