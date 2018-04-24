module Enumerable
  def my_each
    i = 0
    until i == self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    until i == self.size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_array = []
    self.my_each do |item|
      new_array << item if yield(item)
    end
    new_array
  end

  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

end
