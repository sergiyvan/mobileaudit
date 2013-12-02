require 'spec_helper'

describe "task_instances/new" do
  before(:each) do
    assign(:task_instance, stub_model(TaskInstance).as_new_record)
  end

  it "renders new task_instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_instances_path, "post" do
    end
  end
end
