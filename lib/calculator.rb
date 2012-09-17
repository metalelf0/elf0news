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

  def mode collection
    return nil if collection.empty?
    occures = Hash.new(0)
    collection.each{|x| occures[x] += 1 }
    max = 0
    modes = []
    occures.each{|key, value|
        if value > max then
            modes = [key]
            max = value
        elsif value == max
            modes.push(key)
        end
    }
    return modes.sort
  end

end
