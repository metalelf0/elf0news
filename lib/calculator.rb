class Calculator

  def mean collection
    return nil if collection.empty?
    collection.inject(0.0) {|sum, x| sum += x} / collection.size
  end

end
