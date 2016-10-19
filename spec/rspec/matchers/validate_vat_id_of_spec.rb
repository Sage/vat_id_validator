require 'spec_helper'

describe VatIdValidator::Matchers::ValidateVatIdOf do
  before(:all) do
    @expected = :tax_number
    @matcher  = described_class.new(@expected)
  end

  describe 'validate_vat_id_of' do
    it 'should be a rspec matcher' do
      expect(respond_to?(:validate_vat_id_of)).to be_truthy
    end

    it 'should be a "VatIdValidator::Matchers::ValidateVatIdOf"' do
      expect(validate_vat_id_of(:anything)).to be_a(described_class)
    end
  end

  describe '#matches?' do
    context 'with a valid match' do
      subject { @matcher }

      it 'should matches the validation' do
        expect(subject.matches?(ActiveModelTestClass.new)).to be_truthy
      end
    end

    describe 'with a invalid match' do
      subject { described_class.new(:other_attribute) }

      it 'should not matches the validation' do
        expect(subject.matches?(ActiveModelTestClass.new)).to be_falsey
      end
    end
  end

  describe '#failure_message_for_should' do
    subject { @matcher.failure_message_for_should }

    it { is_expected.to eq("expected that #{@expected} would be a vat id") }
  end

  describe '#failure_message_for_should_not' do
    subject { @matcher.failure_message_for_should_not }

    it { is_expected.to eq("expected that #{@expected} would not be a vat id") }
  end

  describe '#description' do
    subject { @matcher.description }

    it { is_expected.to eq('be a vat id') }
  end
end
