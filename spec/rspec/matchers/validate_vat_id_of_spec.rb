require 'spec_helper'

describe VatIdValidator::Matchers::ValidateVatIdOf do

  before(:all) do
    @expected = :tax_number
    @matcher  = described_class.new(@expected)
  end

  describe 'validate_vat_id_of' do
    it 'should be a rspec matcher' do
      self.respond_to?(:validate_vat_id_of).should be_true
    end

    it 'should be a "VatIdValidator::Matchers::ValidateVatIdOf"' do
      self.validate_vat_id_of(:anything).should be_a(described_class)
    end
  end

  describe '#matches?' do
    context 'with a valid match' do
      subject { @matcher }

      it 'should matches the validation' do
        subject.matches?(ActiveModelTestClass.new).should be_true
      end
    end

    describe 'with a invalid match' do
      subject { described_class.new(:other_attribute) }

      it 'should not matches the validation' do
        subject.matches?(ActiveModelTestClass.new).should be_false
      end
    end
  end

  describe '#failure_message_for_should' do
    subject { @matcher.failure_message_for_should }

    it { should == "expected that #{@expected} would be a vat id" }
  end

  describe '#failure_message_for_should_not' do
    subject { @matcher.failure_message_for_should_not }

    it { should == "expected that #{@expected} would not be a vat id" }
  end

  describe '#description' do
    subject { @matcher.description }

    it { should == "be a vat id" }
  end
end
