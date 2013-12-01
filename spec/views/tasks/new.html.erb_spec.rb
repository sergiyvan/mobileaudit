require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :name => "MyString",
      :description => "MyText",
      :address => "MyText",
      :price => 1,
      :expirience => 1,
      :status => "MyString",
      :task_type => "MyString",
      :content => "MyString",
      :exp_require => 1
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
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
