require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :name => "Name",
        :description => "MyText",
        :address => "MyText",
        :price => 1,
        :expirience => 2,
        :status => "Status",
        :task_type => "Task Type",
        :content => "Content",
        :exp_require => 3
      ),
      stub_model(Task,
        :name => "Name",
        :description => "MyText",
        :address => "MyText",
        :price => 1,
        :expirience => 2,
        :status => "Status",
        :task_type => "Task Type",
        :content => "Content",
        :exp_require => 3
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Task Type".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
