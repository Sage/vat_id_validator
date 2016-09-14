# encoding: UTF-8
require 'active_model/validator'
require 'active_support/core_ext/object/blank'

# Namespace module.
module ActiveModel
  # Namespace module.
  module Validations
    # Validator for VAT-ID based on ActiveModel::EachValidator.
    class VatIdValidator < ::ActiveModel::EachValidator

      # All Countries with the vat pattern
      VAT_PATTERNS = {
          'AL'  => /\AAL(J|K)[0-9]{8}[A-Z]\Z/,                                 # Albania
          'AR'  => /\AAR[0-9]{11}\Z/,                                          # Argentina
          'AT'  => /\AATU[0-9]{8}\Z/,                                          # Austria
          'AU'  => /\AAU[0-9]{9}\Z/,                                           # Australia
          'BE'  => /\ABE0[0-9]{9}\Z/,                                          # Belgium
          'BG'  => /\ABG[0-9]{9,10}\Z/,                                        # Bulgaria
          'BO'  => /\ABO/,                                                     # Bolivia
          'BR'  => /\ABR[0-9]{8}\Z/,                                           # Brasil
          'BY'  => /\ABY[0-9]{9}\Z/,                                           # Belarus
          'CA'  => /\ACA[0-9]{15}\Z/,                                          # Canada
          'CH'  => /\ACHE[0-9]{9}(MWST|TVA|IVA)\Z/,                            # Switzerland
          'CL'  => /\ACL[0-9]{9}\Z/,                                           # Chile
          'CO'  => /\ACO[0-9]{10}\Z/,                                          # Colombia
          'CR'  => /\ACR/,                                                     # Costa Rica
          'CY'  => /\ACY[0-9]{8}[A-Z]\Z/,                                      # Cyprus
          'CZ'  => /\ACZ[0-9]{8,10}\Z/,                                        # Czech Republic
          'DE'  => /\ADE[0-9]{9}\Z/,                                           # Germany
          'DK'  => /\ADK[0-9]{8}\Z/,                                           # Denmark
          'DO'  => /\ADO/,                                                     # Dominican Republic
          'EC'  => /\AEC[0-9]{13}\Z/,                                          # Ecuador
          'EE'  => /\AEE[0-9]{9}\Z/,                                           # Estonia
          'EL'  => /\AEL[0-9]{9}\Z/,                                           # Greece
          'ES'  => /\AES([A-Z][0-9]{8}|[0-9]{8}[A-Z]|[A-Z][0-9]{7}[A-Z])\Z/,   # Spain
          'FI'  => /\AFI[0-9]{8}\Z/,                                           # Finland
          'FR'  => /\AFR[A-Z0-9]{2}[0-9]{9}\Z/,                                # France
          'GB'  => /\AGB([0-9]{9}|[0-9]{12}|(HA|GD)[0-9]{3})\Z/,               # United Kingdom
          'GT'  => /\AGT[0-9]{8}\Z/,                                           # Guatemala
          'HN'  => /\AHN/,                                                     # Honduras
          'HR'  => /\AHR[0-9]{11}\Z/,                                          # Croatia
          'HU'  => /\AHU[0-9]{8}\Z/,                                           # Hungary
          'IE'  => /\AIE([0-9][A-Z][0-9]{5}|[0-9]{7})[A-Z]{1,2}\Z/,            # Ireland
          'IT'  => /\AIT[0-9]{11}\Z/,                                          # Italy
          'LT'  => /\ALT([0-9]{9}|[0-9]{12})\Z/,                               # Lithuania
          'LU'  => /\ALU[0-9]{8}\Z/,                                           # Luxembourg
          'LV'  => /\ALV[0-9]{11}\Z/,                                          # Latvia
          'MT'  => /\AMT[0-9]{8}\Z/,                                           # Malta
          'MX'  => /\AMX[0-9]{12}\Z/,                                          # Mexico
          'NI'  => /\ANI/,                                                     # Nicaragua
          'NL'  => /\ANL[0-9]{9}B[0-9]{2}\Z/,                                  # Netherlands
          'NO'  => /\ANO[0-9]{9}\Z/,                                           # Norway
          'PA'  => /\APA/,                                                     # Panama
          'PE'  => /\APE/,                                                     # Peru
          'PH'  => /\APH[0-9]{12}\Z/,                                          # Philippines
          'PL'  => /\APL[0-9]{10}\Z/,                                          # Poland
          'PT'  => /\APT[0-9]{9}\Z/,                                           # Portugal
          'PY'  => /\APY/,                                                     # Paraguay
          'RO'  => /\ARO[1-9][0-9]{1,9}\Z/,                                    # Romania
          'RU'  => /\ARU[0-9]{10}\Z/,                                          # Russia
          'SE'  => /\ASE[0-9]{10}01\Z/,                                        # Sweden
          'SI'  => /\ASI[0-9]{8}\Z/,                                           # Slovenia
          'SK'  => /\ASK[0-9]{10}\Z/,                                          # Slovakia
          'SM'  => /\ASM[0-9]{5}\Z/,                                           # San Marino
          'SV'  => /\ASV/,                                                     # El Salvador
          'TR'  => /\ATR[0-9]{10}\Z/,                                          # Turkey
          'UA'  => /\AUA[0-9]{12}\Z/,                                          # Ukraine
          'UY'  => /\AUY/,                                                     # Uruguay
          'VE'  => /\AVE(J|G|V|E)[0-9]{9}\Z/                                   # Venezuela
      }

      # Validates an attribute of a record if it contains a valid VAT-ID.
      #
      # If it does not, an error is added for that attribute to the record's errors array.
      #
      # @param [#errors] record The record which is validated.
      # @param [Symbol] attribute The record's attribute which is validated.
      # @param [String, nil] value The value which is supposed to be a VAT-ID.
      def validate_each(record, attribute, value)
        if value.present?
          value = value.gsub(/[^A-z0-9]/, '').upcase
          country_code = value[0..1]
          record.errors.add(attribute, :invalid) unless value =~ VAT_PATTERNS[country_code]
        end
      end
    end
  end
end
