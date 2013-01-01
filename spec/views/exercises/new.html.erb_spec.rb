require 'spec_helper'

describe "exercises/new" do
  before(:each) do
    assign(:exercise, stub_model(Exercise,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new exercise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exercises_path, :method => "post" do
      assert_select "input#exercise_name", :name => "exercise[name]"
      assert_select "textarea#exercise_description", :name => "exercise[description]"
    end
  end
end
