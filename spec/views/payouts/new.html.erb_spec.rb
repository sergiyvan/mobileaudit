require 'spec_helper'

describe "payouts/new" do
  before(:each) do
    assign(:payout, stub_model(Payout).as_new_record)
  end

  it "renders new payout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payouts_path, "post" do
    end
  end
end
