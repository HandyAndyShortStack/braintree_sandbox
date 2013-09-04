require 'spec_helper'

describe Braintree do
  
  let(:credit_card) { HashDealer.roll(:credit_card) }

  it "can get paid" do

    result = Braintree::Transaction.sale(
      amount: "1000.00",
      credit_card: credit_card,
      options: {
        submit_for_settlement: true
      }
    )

    expect(result.success?).to be_true
  end

  it "can create users in the vault" do

    result = Braintree::Customer.create(
      first_name: 'test',
      last_name: 'customer',
      credit_card: credit_card
    )

    expect(result.success?).to be_true
  end


end
