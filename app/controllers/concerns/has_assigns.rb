module HasAssigns

  def assign(*properties)
    properties.each do |property|
      attr_reader property
      helper_method property
    end
  end

end