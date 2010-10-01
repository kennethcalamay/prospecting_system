require "spec_helper"

describe ProspectsController do
  describe "GET 'new'" do
    it "assigns @prospect" do
      prospect = mock_model('Prospect')
      Prospect.should_receive(:new).and_return(prospect)
      get 'new'
      assigns(:prospect).should eq(prospect)
    end
  end

  describe "POST create" do
    let(:prospect) { mock_model('Prospect').as_null_object }

    before do
      Prospect.stub(:new).and_return(prospect)
    end

    it "creates a new prospect record based from the info submitted" do
      Prospect.should_receive(:new).with('firstname' => 'k', 'email' => 'k@mail.com')
      post :create, :prospect => {'firstname' => 'k', 'email' => 'k@mail.com'}
    end

    context "when the prospect record saves successfully" do
      before do
        prospect.stub(:save).and_return(true)
      end

      it "assigns flash[:notice] a message" do
        post :create
        flash[:notice].should match(/verify your email address/i)
      end

      it "redirects to 'sytem/thank_you'" do
        post :create
        response.should redirect_to(:controller => 'system', :action => 'thank_you')
      end
    end

    context "when the prospect record fails to save" do
      before do
        prospect.stub(:save).and_return(false)
      end

      it "assigns @prospect" do
        post :create
        assigns(:prospect).should eq(prospect)
      end

      it "renders the 'new' template" do
        post :create
        response.should render_template('new')
      end
    end
  end
end
