class Quizz < ApplicationRecord
	has_many :questions, inverse_of: :quizz, dependent: :destroy
	validates :title, presence: true

	accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank , :update_only => true
end
