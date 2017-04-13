class Article < ActiveRecord::Base

	attr_accessible :title, :description

	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :title, presence: true, length: { minimum: 10 maximum: 300 }


end
