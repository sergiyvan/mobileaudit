require 'spec_helper'

describe "payouts/index" do
  before(:each) do
    assign(:payouts, [
      stub_model(Payout),
      stub_model(Payout)
    ])
  end

  it "renders a list of payouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
