module Enumerable
  def my_each
    return self.to_enum(:my_each) unless block_given?
    i = 0
    until i == self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return self.to_enum(:my_each_with_index) unless block_given?
    i = 0
    until i == self.size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return self.to_enum(:my_select) unless block_given?
    new_array = []
    self.my_each do |item|
      new_array << item if yield(item)
    end
    new_array
  end

  def my_all?
    return self.to_enum(:my_all?) unless block_given?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

end
