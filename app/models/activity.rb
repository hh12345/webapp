class Activity < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    default_scope -> { order('created_at DESC') }
    has_many :participations, dependent: :destroy
    has_many :reviews, dependent: :destroy
   
end
