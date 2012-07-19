require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :num_question => "",
      :responses => "",
      :percent_responses => "",
      :vs_other_companies => "MyString",
      :add_note => "MyString"
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => surveys_path, :method => "post" do
      assert_select "input#survey_num_question", :name => "survey[num_question]"
      assert_select "input#survey_responses", :name => "survey[responses]"
      assert_select "input#survey_percent_responses", :name => "survey[percent_responses]"
      assert_select "input#survey_vs_other_companies", :name => "survey[vs_other_companies]"
      assert_select "input#survey_add_note", :name => "survey[add_note]"
    end
  end
end
