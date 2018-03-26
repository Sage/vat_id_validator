# Vat-Id validator

[![Build Status](https://travis-ci.org/Sage/vat_id_validator.svg?branch=master)](https://travis-ci.org/Sage/vat_id_validator)

A validator for VAT-ID based on ActiveModel::EachValidator.

## Installation

Add this line to your application's Gemfile:

```
gem 'vat_id_validator'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install vat_id_validator
```

## Usage Example

Your model must respond to #errors with an instance of ActiveModel::Errors. Then include ActiveModel::Validations:

```
class FinancialSettings
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attr_reader :errors
  attr_accessor :tax_number

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  validates :tax_number, :vat_id => true

  # ...
end
```

## License
 
This gem is available as open source under the terms of the
[MIT licence](LICENSE).

Copyright (c) 2018 Sage Group Plc. All rights reserved.
