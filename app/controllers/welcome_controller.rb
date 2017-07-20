class WelcomeController < ApplicationController
    def hello
        @message = params[:message]
    end
    def goodby
        @message = params[:message]
    end
end
