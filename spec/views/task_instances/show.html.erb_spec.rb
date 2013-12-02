require 'spec_helper'

describe "task_instances/show" do
  before(:each) do
    @task_instance = assign(:task_instance, stub_model(TaskInstance))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
