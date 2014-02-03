require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :name => "Name",
        :lastname => "Lastname",
        :gender => "Gender",
        :phone => "Phone",
        :birthday => "Birthday",
        :exp => "Exp",
        :credit => "Credit",
        :yandex => "Yandex"
      ),
      stub_model(User,
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation",
        :name => "Name",
        :lastname => "Lastname",
        :gender => "Gender",
        :phone => "Phone",
        :birthday => "Birthday",
        :exp => "Exp",
        :credit => "Credit",
        :yandex => "Yandex"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Birthday".to_s, :count => 2
    assert_select "tr>td", :text => "Exp".to_s, :count => 2
    assert_select "tr>td", :text => "Credit".to_s, :count => 2
    assert_select "tr>td", :text => "Yandex".to_s, :count => 2
  end
end
