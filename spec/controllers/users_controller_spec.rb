require 'spec_helper'

describe UsersController do

  describe "GET 'my_user_data'" do
    it "returns http success" do
      get 'my_user_data'
      response.should be_success
    end
  end

end
