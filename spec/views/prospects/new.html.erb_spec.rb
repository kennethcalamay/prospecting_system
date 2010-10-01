require "spec_helper"

describe "prospects/new.html.erb" do
  let(:prospect) { mock_model('Prospect').as_new_record.as_null_object }

  before do
    assign(:prospect, prospect)
  end

  it "renders form to capture a prospect's contact information" do
    render
    rendered.should have_selector('form', :method => 'post', :action => prospects_path) do |form|
      form.should have_selector('input', :type => 'submit')
    end
  end

  it "renders labeled textfied for the prospect's firstname" do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('label', :content => 'Firstname')
      form.should have_selector('input', :type => 'text', :name => 'prospect[firstname]')
    end
  end

  it "renders labeled textfied for the prospect's email" do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('label', :content => 'Email')
      form.should have_selector('input', :type => 'text', :name => 'prospect[email]')
    end
  end

  it "renders labeled textfied for the prospect's phone" do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('label', :content => 'Phone')
      form.should have_selector('input', :type => 'text', :name => 'prospect[phone]')
    end
  end
end