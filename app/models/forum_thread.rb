class ForumThread < ApplicationRecord
	belongs_to :user
	has_many :forum_posts

	validates :title, presence: true, length: {maximum: 50}
	validates :content, presence: true

end
