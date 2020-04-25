class Book < ApplicationRecord
	#booksに対して一つのuserモデルが紐づけられる
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true
end
