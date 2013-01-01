require 'spec_helper'

describe "exercises/show" do
  before(:each) do
    @exercise = assign(:exercise, stub_model(Exercise,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
