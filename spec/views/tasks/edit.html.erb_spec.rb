require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "MyString",
      :description => "MyText",
      :address => "MyText",
      :price => 1,
      :expirience => 1,
      :status => "MyString",
      :task_type => "MyString",
      :content => "MyString",
      :exp_require => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "textarea#task_description[name=?]", "task[description]"
      assert_select "textarea#task_address[name=?]", "task[address]"
      assert_select "input#task_price[name=?]", "task[price]"
      assert_select "input#task_expirience[name=?]", "task[expirience]"
      assert_select "input#task_status[name=?]", "task[status]"
      assert_select "input#task_task_type[name=?]", "task[task_type]"
      assert_select "input#task_content[name=?]", "task[content]"
      assert_select "input#task_exp_require[name=?]", "task[exp_require]"
    end
  end
end
