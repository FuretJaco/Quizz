class Option < ApplicationRecord
	belongs_to :question, inverse_of: :options
	has_many :answers

	validates :label, :value, presence: true
end
