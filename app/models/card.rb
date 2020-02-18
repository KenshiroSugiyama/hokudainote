class Card < ApplicationRecord
    require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :sk_test_c488b942b82d9928d5c39a74)
    belongs_to :user
end
