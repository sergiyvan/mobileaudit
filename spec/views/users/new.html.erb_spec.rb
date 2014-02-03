require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :name => "MyString",
      :lastname => "MyString",
      :gender => "MyString",
      :phone => "MyString",
      :birthday => "MyString",
      :exp => "MyString",
      :credit => "MyString",
      :yandex => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_lastname[name=?]", "user[lastname]"
      assert_select "input#user_gender[name=?]", "user[gender]"
      assert_select "input#user_phone[name=?]", "user[phone]"
      assert_select "input#user_birthday[name=?]", "user[birthday]"
      assert_select "input#user_exp[name=?]", "user[exp]"
      assert_select "input#user_credit[name=?]", "user[credit]"
      assert_select "input#user_yandex[name=?]", "user[yandex]"
    end
  end
end
