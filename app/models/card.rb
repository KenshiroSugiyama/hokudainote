class Card < ApplicationRecord
    require 'payjp'
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :ENV['PAYJP_PRIVATE_KEY'])
    belongs_to :user
end
