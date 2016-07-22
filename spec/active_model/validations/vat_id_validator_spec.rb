# encoding: UTF-8
require 'spec_helper'

describe ActiveModel::Validations::VatIdValidator do
  subject { ActiveModelTestClass.new }

  shared_examples_for 'tax_number with 8 digits' do
    it 'should be valid with 8 digits' do
      subject.tax_number = prefix + '12345678'
      expect(subject).to be_valid
    end

    it 'should not be valid with less then 8 digits' do
      subject.tax_number = prefix + '1234567'
      expect(subject).not_to be_valid
    end

    it 'should not be valid with more then 8 digits' do
      subject.tax_number = prefix + '123456789'
      expect(subject).not_to be_valid
    end
  end

  shared_examples_for 'tax_number with 9 digits' do
    it 'should be valid with 9 digits' do
      subject.tax_number = prefix + '123456789'
      expect(subject).to be_valid
    end

    it 'should not be valid with less then 9 digits' do
      subject.tax_number = prefix + '12345678'
      expect(subject).not_to be_valid
    end

    it 'should not be valid with more then 9 digits' do
      subject.tax_number = prefix + '1234567890'
      expect(subject).not_to be_valid
    end
  end

  shared_examples_for 'tax_number with 10 digits' do
    it 'should be valid with 10 digits' do
      subject.tax_number = prefix + '1234567890'
      expect(subject).to be_valid
    end

    it 'should not be valid with less then 10 digits' do
      subject.tax_number = prefix + '123456789'
      expect(subject).not_to be_valid
    end

    it 'should not be valid with more then 10 digits' do
      subject.tax_number = prefix + '12345678901'
      expect(subject).not_to be_valid
    end
  end

  shared_examples_for 'tax_number with 11 digits' do
    it 'should be valid with 11 digits' do
      subject.tax_number = prefix + '12345678901'
      expect(subject).to be_valid
    end

    it 'should not be valid with less then 11 digits' do
      subject.tax_number = prefix + '1234567890'
      expect(subject).not_to be_valid
    end

    it 'should not be valid with more then 11 digits' do
      subject.tax_number = prefix + '123456789012'
      expect(subject).not_to be_valid
    end
  end

  shared_examples_for 'tax_number with 12 digits' do
    it 'should be valid with 12 digits' do
      subject.tax_number = prefix + '123456789012'
      expect(subject).to be_valid
    end

    it 'should not be valid with less then 12 digits' do
      subject.tax_number = prefix + '12345678901'
      expect(subject).not_to be_valid
    end

    it 'should not be valid with more then 12 digits' do
      subject.tax_number = prefix + '1234567890123'
      expect(subject).not_to be_valid
    end
  end

  shared_examples_for 'tax_number with only prefix check' do
    it 'should be valid with the given prefix' do
      subject.tax_number = prefix + '123ABC'
      expect(subject).to be_valid
    end
  end

  it 'should be valid without tax_number' do
    is_expected.to be_valid
  end

  it 'should not be valid without prefix' do
    subject.tax_number = '123456789'
    expect(subject).not_to be_valid
  end

  it 'should ignore special character and spaces for validation (formatting)' do
    subject.tax_number = 'DE 12-345.678/9'
    expect(subject).to be_valid
  end

  context 'when the tax_number starts with' do
  
    context 'AL (Albania)' do
      let(:prefix) { 'AL' }
  
      it 'should be valid with "K" + 8 digits + 1 char' do
        subject.tax_number = prefix + 'K12345678X'
        expect(subject).to be_valid
      end
  
      it 'should be valid with "J" + 8 digits + 1 char' do
        subject.tax_number = prefix + 'J12345678X'
        expect(subject).to be_valid
      end
  
      it 'should not be valid if the first char is not "K" or "J"' do
        subject.tax_number = prefix + 'X12345678X'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with less then 8 digits' do
        subject.tax_number = prefix + 'J1234567X'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 8 digits' do
        subject.tax_number = prefix + 'K123456789X'
        expect(subject).not_to be_valid
      end
    end
  
    context 'AR (Argentina)' do
      let(:prefix) { 'AR' }

      it_behaves_like 'tax_number with 11 digits'
    end
    
    context 'ATU (Austria)' do
      let(:prefix) { 'ATU' }
  
      it_behaves_like 'tax_number with 8 digits'
    end
  
    context 'AU (Australia)' do
      let(:prefix) { 'AU' }
  
      it_behaves_like 'tax_number with 9 digits'
    end
  
    context 'BE (Belgium)' do
      let(:prefix) { 'BE' }
  
      it 'should be valid with 10 digits (first digit == 0)' do
        subject.tax_number = prefix + '0123456789'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with 10 digits (first digit != 0)' do
        subject.tax_number = prefix + '1123456789'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with less then 10 digits' do
        subject.tax_number = prefix + '012345678'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 10 digits' do
        subject.tax_number = prefix + '01234567890'
        expect(subject).not_to be_valid
      end
    end
  
    context 'BG (Bulgaria)' do
      let(:prefix) { 'BG' }
  
      it 'should be valid with 9 digits' do
        subject.tax_number = prefix + '123456789'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 10 digits' do
        subject.tax_number = prefix + '1234567890'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 9 digits' do
        subject.tax_number = prefix + '12345678'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 10 digits' do
        subject.tax_number = prefix + '12345678901'
        expect(subject).not_to be_valid
      end
    end

    context 'BO (Bolivia)' do
      let(:prefix) { 'BO' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'BR (Brasil)' do
      let(:prefix) { 'BR' }

      it_behaves_like 'tax_number with 8 digits'
    end

    context 'BY (Belarus)' do
      let(:prefix) { 'BY' }
  
      it_behaves_like 'tax_number with 9 digits'
    end
  
    context 'CA (Canada)' do
      let(:prefix) { 'CA' }
  
      it 'should be valid with 15 digits' do
        subject.tax_number = prefix + '123456789012345'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 15 digits' do
        subject.tax_number = prefix + '12345678901234'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 15 digits' do
        subject.tax_number = prefix + '1234567890123456'
        expect(subject).not_to be_valid
      end
    end
  
    context 'CHE (Switzerland)' do
      let(:prefix) { 'CHE' }
  
      it 'should not be valid without suffix' do
        subject.tax_number = prefix + '123456789'
        expect(subject).not_to be_valid
      end
  
      context 'and the tax_number ends with MWST (de-CH)' do
        let(:suffix) { 'MWST' }
        it 'should be valid with 9 digits' do
          subject.tax_number = prefix + '123456789' + suffix
          expect(subject).to be_valid
        end
  
        it 'should not be valid with less then 9 digits' do
          subject.tax_number = prefix + '12345678' + suffix
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with more then 9 digits' do
          subject.tax_number = prefix + '1234567890' + suffix
          expect(subject).not_to be_valid
        end
      end
  
      context 'and the tax_number ends with TVA (de-FR)' do
        let(:suffix) { 'TVA' }
  
        it 'should be valid with 9 digits' do
          subject.tax_number = prefix + '123456789' + suffix
          expect(subject).to be_valid
        end
  
        it 'should not be valid with less then 9 digits' do
          subject.tax_number = prefix + '12345678' + suffix
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with more then 9 digits' do
          subject.tax_number = prefix + '1234567890' + suffix
          expect(subject).not_to be_valid
        end
      end
  
      context 'and the tax_number ends with IVA (de-IT)' do
        let(:suffix) { 'IVA' }
        it 'should be valid with 9 digits' do
          subject.tax_number = prefix + '123456789' + suffix
          expect(subject).to be_valid
        end
  
        it 'should not be valid with less then 9 digits' do
          subject.tax_number = prefix + '12345678' + suffix
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with more then 9 digits' do
          subject.tax_number = prefix + '1234567890' + suffix
          expect(subject).not_to be_valid
        end
      end
  
  
    end

    context 'CL (Chile)' do
      let(:prefix) { 'CL' }

      it_behaves_like 'tax_number with 9 digits'
    end

    context 'CO (Colombia)' do
      let(:prefix) { 'CO' }

      it_behaves_like 'tax_number with 10 digits'
    end

    context 'CR (Costa Rica)' do
      let(:prefix) { 'CR' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'CY (Cyprus)' do
      let(:prefix) { 'CY' }
      let(:suffix) { 'L' } # A-Z
  
      it 'should not be valid without suffix' do
        subject.tax_number = prefix + '12345678'
        expect(subject).not_to be_valid
      end
  
      it 'should be valid with 8 digits' do
        subject.tax_number = prefix + '12345678' + suffix
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 8 digits' do
        subject.tax_number = prefix + '1234567' + suffix
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 8 digits' do
        subject.tax_number = prefix + '123456789' + suffix
        expect(subject).not_to be_valid
      end
    end
  
    context 'CZ (Czech Republic)' do
      let(:prefix) { 'CZ' }
  
      it 'should be valid with 8 digits' do
        subject.tax_number = prefix + '12345678'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 9 digits' do
        subject.tax_number = prefix + '123456789'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 10 digits' do
        subject.tax_number = prefix + '1234567890'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 8 digits' do
        subject.tax_number = prefix + '1234567'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 10 digits' do
        subject.tax_number = prefix + '12345678901'
        expect(subject).not_to be_valid
      end
    end
  
    context 'DE (Germany)' do
      let(:prefix) { 'DE' }
  
      it_behaves_like 'tax_number with 9 digits'
    end
  
    context 'DK (Denmark)' do
      let(:prefix) { 'DK' }
  
      it_behaves_like 'tax_number with 8 digits'
    end

    context 'DO (Dominican Republic)' do
      let(:prefix) { 'DO' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'EC (Ecuador)' do
      let(:prefix) { 'EC' }

      it 'should be valid with 13 digits' do
        subject.tax_number = prefix + '1234567890123'
        expect(subject).to be_valid
      end

      it 'should not be valid with less then 13 digits' do
        subject.tax_number = prefix + '123456789012'
        expect(subject).not_to be_valid
      end

      it 'should not be valid with more then 13 digits' do
        subject.tax_number = prefix + '12345678901234'
        expect(subject).not_to be_valid
      end
    end

    context 'EE (Estonia)' do
      let(:prefix) { 'EE' }
  
      it_behaves_like 'tax_number with 9 digits'
    end
  
    context 'EL (Greece)' do
      let(:prefix) { 'EL' }
  
      it_behaves_like 'tax_number with 9 digits'
    end
  
    context 'ES (Spain)' do
      let(:prefix) { 'ES' }
  
      it 'should be valid with 1 char + 8 digits' do
        subject.tax_number = prefix + 'X12345678'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 8 digits + 1 char' do
        subject.tax_number = prefix + '12345678X'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 1 char + 7 digits + 1 char' do
        subject.tax_number = prefix + 'X1234567X'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 9 digits/chars' do
        subject.tax_number = prefix + 'X1234567'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 9 digits/chats' do
        subject.tax_number = prefix + '123456789X'
        expect(subject).not_to be_valid
      end
    end
  
    context 'FI (Finland)' do
      let(:prefix) { 'FI' }
  
      it_behaves_like 'tax_number with 8 digits'
    end
  
    context 'FR (France)' do
      let(:prefix) { 'FR' }
  
      it 'should be valid with 2 digits/chars + 9 digits' do
        subject.tax_number = prefix + '1X123456789'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 11 digits' do
        subject.tax_number = prefix + '1234567890'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 11 digits' do
        subject.tax_number = prefix + '123456789012'
        expect(subject).not_to be_valid
      end
    end
  
    context 'GB (United Kingdom)' do
      let(:prefix) { 'GB' }
  
      context 'with digets only' do
        it 'should be valid with 9 digits (standard)' do
          subject.tax_number = prefix + '123456789'
          expect(subject).to be_valid
        end
  
        it 'should be valid with 12 digits (branch traders)' do
          subject.tax_number = prefix + '123456789012'
          expect(subject).to be_valid
        end
  
        it 'should not be valid with less then 9 digits' do
          subject.tax_number = prefix + '12345678'
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with 10 digits' do
          subject.tax_number = prefix + '1234567890'
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with 11 digits' do
          subject.tax_number = prefix + '12345678901'
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with more then 12 digits' do
          subject.tax_number = prefix + '1234567890123'
          expect(subject).not_to be_valid
        end
      end
  
      context 'with prefix addition "HA" (health authorities)' do
        let(:addition) { 'HA' }
  
        it 'should be valid with 3 digits' do
          subject.tax_number = prefix + addition + '123'
          expect(subject).to be_valid
        end
  
        it 'should not be valid with less then 3 digits' do
          subject.tax_number = prefix + addition + '12'
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with more then 3 digits' do
          subject.tax_number = prefix + addition + '1234'
          expect(subject).not_to be_valid
        end
      end
  
      context 'with prefix addition "GD" (government departments)' do
        let(:addition) { 'GD' }
  
        it 'should be valid with 3 digits' do
          subject.tax_number = prefix + addition + '123'
          expect(subject).to be_valid
        end
  
        it 'should not be valid with less then 3 digits' do
          subject.tax_number = prefix + addition + '12'
          expect(subject).not_to be_valid
        end
  
        it 'should not be valid with more then 3 digits' do
          subject.tax_number = prefix + addition + '1234'
          expect(subject).not_to be_valid
        end
      end
    end

    context 'GT (Guatemala' do
      let(:prefix) { 'GT' }

      it_behaves_like 'tax_number with 8 digits'
    end

    context 'HN (Honduras)' do
      let(:prefix) { 'HN' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'HR (Croatia)' do
      let(:prefix) { 'HR' }
  
      it_behaves_like 'tax_number with 11 digits'
    end
  
    context 'HU (Hungary)' do
      let(:prefix) { 'HU' }
  
      it_behaves_like 'tax_number with 8 digits'
    end
  
    context 'IE (Ireland)' do
      let(:prefix) { 'IE' }
  
      it 'should be valid with 1 digit + 1 char + 5 digets + 2 char' do
        subject.tax_number = prefix + '1X12345LT'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 7 digits + 2 char' do
        subject.tax_number = prefix + '1234567LS'
        expect(subject).to be_valid
      end
  
      it 'should not be valid if last is not a char' do
        subject.tax_number = prefix + '12345678'
        expect(subject).not_to be_valid
      end

      it 'should be valid with 7 digits + 1 char' do
        subject.tax_number = prefix + '1234567L'
        expect(subject).not_to be_valid
      end

      it 'should not be valid with less then 7 digits + 1 char' do
        subject.tax_number = prefix + '123456L'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 7 digits + 1 char' do
        subject.tax_number = prefix + '12345678L'
        expect(subject).not_to be_valid
      end
    end
  
    context 'IT (Italy)' do
      let(:prefix) { 'IT' }
  
      it_behaves_like 'tax_number with 11 digits'
    end
  
    context 'LT (Lithuania)' do
      let(:prefix) { 'LT' }
  
      it 'should be valid with 9 digits' do
        subject.tax_number = prefix + '123456789'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 12 digits' do
        subject.tax_number = prefix + '123456789012'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 9 digits' do
        subject.tax_number = prefix + '12345678'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with 10 digits' do
        subject.tax_number = prefix + '1234567890'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with 11 digits' do
        subject.tax_number = prefix + '12345678901'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 12 digits' do
        subject.tax_number = prefix + '1234567890123'
        expect(subject).not_to be_valid
      end
    end
  
    context 'LU (Luxembourg)' do
      let(:prefix) { 'LU' }
  
      it_behaves_like 'tax_number with 8 digits'
    end
  
    context 'LV (Latvia)' do
      let(:prefix) { 'LV' }
  
      it_behaves_like 'tax_number with 11 digits'
    end

    context 'MT (Malta)' do
      let(:prefix) { 'MT' }
  
      it_behaves_like 'tax_number with 8 digits'
    end

    context 'MX (Mexico)' do
      let(:prefix) { 'MX' }

      it_behaves_like 'tax_number with 12 digits'
    end

    context 'NI (Nicaragua)' do
      let(:prefix) { 'NI' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'NL (Netherlands)' do
      let(:prefix) { 'NL' }
  
      it 'should be valid with 9 digits + "B" + 2 digits' do
        subject.tax_number = prefix + '123456789B12'
        expect(subject).to be_valid
      end
  
      it 'should not be valid without "B" on the 10 position' do
        subject.tax_number = prefix + '123456789X12'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with less 9 digits + "B" + 2 digits' do
        subject.tax_number = prefix + '12345678B12'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more 9 digits + "B" + 2 digits' do
        subject.tax_number = prefix + '1234567890B12'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with 8 digits + "B" + less then 2 digits' do
        subject.tax_number = prefix + '12345678B1'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more 8 digits + "B" + more then 2 digits' do
        subject.tax_number = prefix + '12345678B123'
        expect(subject).not_to be_valid
      end
    end
  
    context 'NO (Norway)' do
      let(:prefix) { 'NO' }
  
      it_behaves_like 'tax_number with 9 digits'
    end

    context 'PA (Panama)' do
      let(:prefix) { 'PA' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'PE (Peru)' do
      let(:prefix) { 'SV' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'PH (Philippines)' do
      let(:prefix) { 'PH' }
  
      it_behaves_like 'tax_number with 12 digits'
    end
  
    context 'PL (Poland)' do
      let(:prefix) { 'PL' }
  
      it_behaves_like 'tax_number with 10 digits'
    end
  
    context 'PT (Portugal)' do
      let(:prefix) { 'PT' }
  
      it_behaves_like 'tax_number with 9 digits'
    end

    context 'PY (Paraguay)' do
      let(:prefix) { 'PY' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'RO (Romania)' do
      let(:prefix) { 'RO' }
  
      it 'should be valid with 2 digits' do
        subject.tax_number = prefix + '12'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 3 digits' do
        subject.tax_number = prefix + '123'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 4 digits' do
        subject.tax_number = prefix + '1234'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 5 digits' do
        subject.tax_number = prefix + '12345'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 6 digits' do
        subject.tax_number = prefix + '123456'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 7 digits' do
        subject.tax_number = prefix + '1234567'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 8 digits' do
        subject.tax_number = prefix + '12345678'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 9 digits' do
        subject.tax_number = prefix + '123456789'
        expect(subject).to be_valid
      end
  
      it 'should be valid with 10 digits' do
        subject.tax_number = prefix + '123456789'
        expect(subject).to be_valid
      end
  
      it 'should not be valid if the first digit is 0' do
        subject.tax_number = prefix + '01'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with less then 2 digits' do
        subject.tax_number = prefix + '1'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 10 digits' do
        subject.tax_number = prefix + '12345678901'
        expect(subject).not_to be_valid
      end
    end
  
    context 'RU (Russia)' do
      let(:prefix) { 'RU' }
  
      it_behaves_like 'tax_number with 10 digits'
    end
  
    context 'SE (Sweden)' do
      let(:prefix) { 'SE' }
  
      it 'should be valid with 10 digits + "01"' do
        subject.tax_number = prefix + '123456789001'
        expect(subject).to be_valid
      end
  
      it 'should not be valid without "01" at the end' do
        subject.tax_number = prefix + '123456789012'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with less then 10 digits + "01"' do
        subject.tax_number = prefix + '12345678901'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 10 digits + "01"' do
        subject.tax_number = prefix + '1234567890101'
        expect(subject).not_to be_valid
      end
    end
  
    context 'SI (Slovenia)' do
      let(:prefix) { 'SI' }
  
      it_behaves_like 'tax_number with 8 digits'
    end
  
    context 'SK (Slovakia)' do
      let(:prefix) { 'SK' }
  
      it_behaves_like 'tax_number with 10 digits'
    end
  
    context 'SM (San Marino)' do
      let(:prefix) { 'SM' }
  
      it 'should be valid with 5 digits' do
        subject.tax_number = prefix + '12345'
        expect(subject).to be_valid
      end
  
      it 'should not be valid with less then 5 digits' do
        subject.tax_number = prefix + '1234'
        expect(subject).not_to be_valid
      end
  
      it 'should not be valid with more then 5 digits' do
        subject.tax_number = prefix + '123456'
        expect(subject).not_to be_valid
      end
    end

    context 'SV (El Salvador)' do
      let(:prefix) { 'SV' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'TR (Turkey)' do
      let(:prefix) { 'TR' }
  
      it_behaves_like 'tax_number with 10 digits'
    end
  
    context 'UA (Ukraine)' do
      let(:prefix) { 'UA' }
  
      it_behaves_like 'tax_number with 12 digits'
    end

    context 'UY (Uruguay)' do
      let(:prefix) { 'UY' }

      it_behaves_like 'tax_number with only prefix check'
    end

    context 'VE (Venezuala)' do
      let(:prefix) { 'VE' }

      it 'should be valid with "J" + 9 digits' do
        subject.tax_number = prefix + 'J123456789'
        expect(subject).to be_valid
      end

      it 'should be valid with "G" + 9 digits' do
        subject.tax_number = prefix + 'G123456789'
        expect(subject).to be_valid
      end

      it 'should be valid with "V" + 9 digits' do
        subject.tax_number = prefix + 'V123456789'
        expect(subject).to be_valid
      end

      it 'should be valid with "E" + 9 digits' do
        subject.tax_number = prefix + 'E123456789'
        expect(subject).to be_valid
      end

      it 'should not be valid with less then 9 digits' do
        subject.tax_number = prefix + 'E12345678'
        expect(subject).not_to be_valid
      end

      it 'should not be valid with more then 9 digits' do
        subject.tax_number = prefix + 'E1234567890'
        expect(subject).not_to be_valid
      end
    end
  end
end
