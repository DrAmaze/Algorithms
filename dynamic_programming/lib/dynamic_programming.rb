class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {
      0 => [],
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]

    result = blair_nums(n - 1) + blair_nums(n - 2) + (2 * (n-1) - 1)
    @blair_cache[n] = result
    result
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n, [1, 2, 3])
    cache[n]
  end

  def frog_cache_builder(n, hops)
    cache = {
      0 => [],
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    return cache if cache[n]

    (4..n).each do |i|
      solution = []

      (1..3).each do |hop|
        cache[i - hop].each do |path|
          new_path = [hop]
          path.each do |step|
            new_path << step
          end
          solution << new_path
        end
      end
      cache[i] = solution
    end

    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]

    soln = []
    (1..3).each do |hop|
      frog_hops_top_down_helper(n - hop).each do |path|
        new_path = [hop]
        path.each do |step|
          new_path << step
        end
        soln << new_path
      end
    end

    @frog_cache[n] = soln
    soln
  end

  def super_frog_hops(n, k)
    # n = num of stairs
    # k = max stairs that can be hopped at once
    solutions = { 0 => [[]], 1 => [[1]] }

    return solutions[n] if n < 2

    (2..n).each do |i|
      soln = []

      (1..k).each do |hop|
        next if i - hop < 0
        solutions[i - hop].each do |path|
          new_path = [hop]

          path.each do |step|
            new_path << step
          end

          soln << new_path
        end
      end

      solutions[i] = soln
    end

    solutions[n]
  end

  def knapsack(weights, values, capacity)
    return 0 if capacity == 0 || weights.length == 0
    solutions = knapsack_table(weights, values, capacity)
    solutions[capacity][-1]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solutions = []

    (0..capacity).each do |i|
      solutions.push([])

      (0..weights.length - 1).each do |j|
        if i == 0
          solutions[i][j] = 0
        elsif j == 0
          solutions[i][j] = weights[0] > i ? 0 : values[0]
        else
          opt1 = solutions[i][j - 1]
          # the second option (assuming enough capacity) is the entry from a smaller bag
          # (with enough room for this item) plus this item's value
          opt2 = i < weights[j] ? 0 : solutions[i - weights[j]][j - 1] + values[j]
          # the actual entry for this item is the optimum of the two choices
          soln = [opt1, opt2].max
          solutions[i][j] = soln
        end
      end
    end
    solutions
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
