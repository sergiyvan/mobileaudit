require 'spec_helper'

describe "task_instances/edit" do
  before(:each) do
    @task_instance = assign(:task_instance, stub_model(TaskInstance))
  end

  it "renders the edit task_instance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_instance_path(@task_instance), "post" do
    end
  end
end
