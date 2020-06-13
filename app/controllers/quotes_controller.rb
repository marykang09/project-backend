class QuotesController < ApplicationController

    def index
        render json: Quote.all
    end

end
