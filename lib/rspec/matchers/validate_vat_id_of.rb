module RSpec # :nodoc:
  module Matchers # :nodoc:
    # Ensure that the attribute is a vat id.
    #
    # Examples:
    #   it { should validate_vat_id_of(:tax_number) }
    #
    def validate_vat_id_of(expected)
      ValidateVatIdOf.new(expected)
    end

    # Represents the rspec matcher for the vat_id validator
    class ValidateVatIdOf
      def initialize(expected)
        @expected = expected
      end

      # Checks if the given Objects has a validator for the expected attribute
      #
      # @param [Object] actual the object with the expected attribute
      # @return [boolean]
      def matches?(actual)
        validators = actual._validators[@expected]
        validators.select { |val| val.kind_of?(ActiveModel::Validations::VatIdValidator) }.count > 0
      end

      # Returns a error message for should matches
      #
      # @return [String] the error message
      def failure_message_for_should
        "expected that #{@expected} would be a vat id"
      end

      # Returns a error message for should_not matches
      #
      # @return [String] the error message
      def failure_message_for_should_not
        "expected that #{@expected} would not be a vat id"
      end

      # Returns the description for the matcher
      #
      # @return [String] the description
      def description
        "be a vat id"
      end
    end
  end
end
