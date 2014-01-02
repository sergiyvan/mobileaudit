require 'spec_helper'

describe "payouts/show" do
  before(:each) do
    @payout = assign(:payout, stub_model(Payout))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
