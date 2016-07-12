require 'active_record'

module DeviseInhibitor
  def devise(*whatever)
    attr_accessor :password, :password_confirmation
  end
end

ActiveRecord::Base.singleton_class.prepend DeviseInhibitor
