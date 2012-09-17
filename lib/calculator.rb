class Calculator

  def mean collection
    return nil if collection.empty?
    collection.inject(0.0) {|sum, x| sum += x} / collection.size
  end

  def median collection
    return nil if collection.empty?
    sorted = collection.sort()
    if (sorted.size.modulo(2) == 0)
      ((sorted[(sorted.size/2)-1]+sorted[(sorted.size/2)])/2.0).to_f
    else
      sorted[sorted.size/2].to_f
    end
  end

end
