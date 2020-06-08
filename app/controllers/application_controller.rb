class ApplicationController < ActionController::Base
    include SessionsHelper


    def index
        render text: "hallo"
        title = "index"
    end

end
