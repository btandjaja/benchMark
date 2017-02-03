
def my_min_v1(array)
  i = 0
  while i < array.size
    j = 0
    while j < array.size
      j += 1 if i == j
      if array[j] < array[i]
        break
      elsif j == array.size - 1
        return array[i]
      else
        j += 1
      end
    end
    i += 1
  end
end

# p my_min_v1([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def my_min_v2(array)
  minimum = array.first

  array[1..-1].each do |element|
    minimum = element if minimum > element
  end

  minimum
end

def subsum_v1(arr)
  sub_arr = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      sub_arr << arr[i..j]
    end
  end
  max = 0
  sub_arr.each do |array|
    sum = 0
    array.each do |el|
      sum += el
    end
    max = sum if sum > max
  end
  max
end



def subsum_v2(arr)

  # current_sum, largest_sum = arr[0], arr[0]
  # i = 1
  # while i < arr.length
  #   if current_sum + arr[i] < 0
  #     if current_sum > largest_sum
  #       largest_sum = current_sum
  #       current_sum = 0
  #     else
  #       current_sum = arr[i]
  #     end
  #   else
  #     current_sum += arr[i]
  #   end
  #   i += 1
  # end

  # largest_sum

  negative = false
  negative = arr.all? {|val| val < 0}
  if negative
    val, i = arr[0], 1
    while i < arr.length
      val = arr[i] if val < arr[i]
      i += 1
    end
    val
  else
  end
end

  def subsum_v3(arr)
    high_score = arr[0]
    running_sum = 0

    arr.each do |el|
      if running_sum + el > 0
        running_sum += el
        high_score = running_sum
      else
        if running_sum > 0
          high_score = running_sum
          running_sum = 0
        else
          high_score = el if el > high_score
        end
      end
    end

    high_score
  end

  def subsum_v4(arr)
    return arr.max if arr.all? { |val| val < 0 }

    high_score = arr[0]
    running_sum = 0

    arr.each do |el|
      if running_sum + el > 0
        running_sum += el
        high_score = running_sum
      else
        running_sum = 0
      end
    end

    high_score
  end


p subsum_v4([-5, -1, -3])
p subsum_v4([2, 3, -6, 7, -6, 7])
p subsum_v4([500,-501])
