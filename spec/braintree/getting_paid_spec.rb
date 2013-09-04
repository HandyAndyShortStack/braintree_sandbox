require 'spec_helper'

describe Braintree do
  
  it "can get paid" do

    result = Braintree::Transaction.sale(
      :amount => "1000.00",
      :credit_card => {
        :number => '4111111111111111',
        :cvv => '123',
        :expiration_month => '12',
        :expiration_year => '2016'
      },
      :options => {
        :submit_for_settlement => true
      }
    )

    expect(result.success?).to be_true
  end
end
