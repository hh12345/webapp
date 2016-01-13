class Activity < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    default_scope -> { order('created_at DESC') }
    has_many :participations
    has_many :reviews
   
end
