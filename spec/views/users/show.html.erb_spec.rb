require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Password/)
    rendered.should match(/Password Confirmation/)
    rendered.should match(/Name/)
    rendered.should match(/Lastname/)
    rendered.should match(/Gender/)
    rendered.should match(/Phone/)
    rendered.should match(/Birthday/)
    rendered.should match(/Exp/)
    rendered.should match(/Credit/)
    rendered.should match(/Yandex/)
  end
end
