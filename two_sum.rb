def two_sum?(array, target_sum)
  array = array.sort
  array.each_with_index do |el, index|
    dup = array.dup
    dup.delete_at(index)
    return true if add_sum?(dup,el,target_sum)
  end
  false
end

def add_sum?(arr,first_num,target)
  return nil if arr.empty?
  mid = arr.length / 2
  return true if arr[mid] + first_num == target
  if arr[mid] + first_num > target
    return true if add_sum?(arr.take(mid),first_num,target)
  else
    return true if add_sum?(arr.drop(mid+1),first_num,target)
  end
  false
end


arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
p two_sum?(arr, 8) # => should be true

arr = [0, 1, 5, 5, 7]
