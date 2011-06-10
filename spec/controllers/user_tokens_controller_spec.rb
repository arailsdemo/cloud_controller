describe UserTokensController do
  describe "POST create" do
    before { @user = Factory(:user) }

    context "given valid user credentials" do
      before do
        User.stub(:valid_login?).with(@user.email, @user.password) { true }
      end

      it "returns a token in json format" do
        UserToken.stub(:create).with(@user.email) { 'token' }
        post :create, :email => @user.email, :password => "#{@user.password}"
        response.headers["Content-Type"].should == "application/json; charset=utf-8"
        response.body.should == 'token'
      end
    end

    context "given invalid user credentials" do
      before do
        User.stub(:valid_login?).with(@user.email, @user.password) { false }
      end

      it "returns the error info in json" do
        post :create, :email => @user.email, :password => "#{@user.password}"
        response.status.should == 403
        Yajl::Parser.parse(response.body).should ==
          { "code" => 200, "description" => "Operation not permitted" }
      end
    end
  end
end
