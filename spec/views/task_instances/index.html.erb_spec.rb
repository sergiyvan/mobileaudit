require 'spec_helper'

describe "task_instances/index" do
  before(:each) do
    assign(:task_instances, [
      stub_model(TaskInstance),
      stub_model(TaskInstance)
    ])
  end

  it "renders a list of task_instances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
