require 'rails_helper'

RSpec.describe Participation, type: :model do
  describe '#unanswered_questions' do
  	it "returns all the questions when participation is empty" do 
  		3.times do |i|
  			Question.create!(title: "titre #{i}", body: "body #{i}")
  		end 
  		subject = Participation.new

  		expect(subject.unanswered_questions).to eq Question.all
  		#eq => == 
  	end 
  	it "returns all questions but one when there is one answer" do
  		question1 = Question.create!(title: "titre 1", body: "body 1")
  		question2 = Question.create!(title: "titre 2", body: "body 2") 
			question3 = Question.create!(title: "titre 3", body: "body 3") 
			option1 = Option.create!(label: "label1", value:"value1", question: question1)

			subject =Participation.create!
  		answer = Answer.create!(option: option1, participation: subject)

  		result = subject.unanswered_questions

  		expect(result).to match_array [question2, question3]
  	end 
  	it "return participation is complete when unanswered questions is empty" do
  		question1 = Question.create!(title: "titre 1", body: "body 1")
  		question2 = Question.create!(title: "titre 2", body: "body 2") 
			question3 = Question.create!(title: "titre 3", body: "body 3") 
			option1 = Option.create!(label: "label1", value:"value1", question: question1)
			option2 = Option.create!(label: "label2", value:"value2", question: question2)
			option3 = Option.create!(label: "label3", value:"value3", question: question3)

			subject = Participation.create!
			answer = Answer.create!(option: option1, participation: subject)
			answer1 = Answer.create!(option: option2, participation: subject)
			answer2 = Answer.create!(option: option3, participation: subject)

			result = subject.unanswered_questions

			expect(result).to be_empty
  	end 
  	it "return an error if value is not persisted" do 
  		question1 = Question.create!(title: "titre 1", body: "body 1")
  		question2 = Question.create!(title: "titre 2", body: "body 2") 
			question3 = Question.create!(title: "titre 3", body: "body 3") 

			subject = Participation.build!

  		expect().to xxxx

  	end 
  end 
end

