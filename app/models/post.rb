class Post < ApplicationRecord
    belongs_to :user
    has_many :post_comments

    validates :title, :body, presence: true
end
