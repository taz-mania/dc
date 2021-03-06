class Post < ApplicationRecord
  	belongs_to 						:user
  	has_many						:post_categories, dependent: :destroy
  	has_many						:categories, through: :post_categories
  	accepts_nested_attributes_for 	:post_categories, allow_destroy: true, reject_if: :all_blank
  	
  	validates_presence_of 			:title, :body, :user_id
	
	scope 							:published, -> { where(is_draft: false) }
	scope 							:draft, 	-> { where(is_draft: true) }
  	scope 							:news, 		-> { where(is_pinned: true) }

  	acts_as_commontable
end