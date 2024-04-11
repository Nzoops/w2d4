require_relative '../lib/crypto_scrapper.rb'

describe "crypto_scrapper method" do
  it "should return the couple name/value on the page coinmarketcap" do
    result = crypto_scrapper()

    expect(result[:crypto_name]).not_to eq(nil)
    expect(result[:crypto_price]).not_to eq(nil)

    # Additional checks to ensure the values are not empty
    expect(result[:crypto_name]).not_to be_empty
    expect(result[:crypto_price]).not_to be_empty
  end
end