require 'spec_helper'

describe "payouts/edit" do
  before(:each) do
    @payout = assign(:payout, stub_model(Payout))
  end

  it "renders the edit payout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payout_path(@payout), "post" do
    end
  end
end
