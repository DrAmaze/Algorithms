# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  vertices = []
  dependencies = Hash.new([])

  # find max_id
  max_id = 0
  arr.each do |package|
    max_id = package[0] if package[0] > max_id
    max_id = package[1] if package[1] > max_id

    # map dependencies
    dependencies[package[0]] += [package[1]]
  end

  # complete the set
  (1..max_id).each do |n|
    dependencies[n] = [] unless dependencies[n].length > 0
  end

  # push to output
  until vertices.length == max_id
    dependencies.each do |k, depends|
      next if depends.nil?
      depends.reject! {|el| dependencies[el].nil?}
      if depends.empty?
        vertices << k
        dependencies[k] = nil
      end
    end
  end
  vertices

end
