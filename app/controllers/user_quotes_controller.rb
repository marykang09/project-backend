class UserQuotesController < ApplicationController

    def create
        user_quote = UserQuote.create(user_quote_params)
        render json: user_quote.as_json(include: :quote)
    end

    def update
        user_quote = UserQuote.find(params[:id])
        user_quote.update(user_quote_params)
        render json: user_quote.as_json(include: :quote)
    end

    def destroy
        user_quote = UserQuote.find(params[:id])
        user_quote.destroy
    end

    private
    def user_quote_params
        params.require(:user_quote).permit(:user_id, :quote_id)
    end
end
