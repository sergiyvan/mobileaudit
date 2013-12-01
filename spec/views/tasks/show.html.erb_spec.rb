require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "Name",
      :description => "MyText",
      :address => "MyText",
      :price => 1,
      :expirience => 2,
      :status => "Status",
      :task_type => "Task Type",
      :content => "Content",
      :exp_require => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Status/)
    rendered.should match(/Task Type/)
    rendered.should match(/Content/)
    rendered.should match(/3/)
  end
end
