class Question < ApplicationRecord
	has_many :options, inverse_of: :question, dependent: :destroy #inverse_of permet de lier les deux tables avant que la sauvegarde ne soit effective dans la db 
	# ce qui permettra donc d'obtenir les options qui vont avec les questions avant même que celles ci ne soient enregistrées en db 
	mount_uploader :image, ImageUploader

	validates :title, :body, presence: true
	validates :title, length: {maximum: 25}
	
	accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank , :update_only => true 
end
