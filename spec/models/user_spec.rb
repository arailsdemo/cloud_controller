require 'spec_helper'

describe User do
  before { @existing = Factory(:user, password: 'foo') }

  describe ".valid_login?" do
    it "returns true if email and password match" do
      User.valid_login?(@existing.email, "foo").should be_true
    end

    it "returns false if email or password doesn't match" do
      User.valid_login?(@existing.email, "bar").should be_false
      User.valid_login?('baz', "foo").should be_false
    end
  end

  describe "#password" do
    it "should be encrypted in the database" do
      pw = @existing.reload.password.to_s  # Note: the class of @existing.reload.password is BCrypt::Password
      pw.should_not == 'foo'
    end
  end
end
