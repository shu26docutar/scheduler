class Event < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :url, format: { with: /http/, message: 'はhttpから開始してください' }
end
