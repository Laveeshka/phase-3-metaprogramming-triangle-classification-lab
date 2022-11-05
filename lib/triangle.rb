class Triangle
  # write code here
  attr_accessor :l1, :l2, :l3

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    if check_size? && check_triangle_inequality?
      if l1 == l2 && l2 == l3
        :equilateral
      elsif l1 == l2 || l2 == l3 || l1 == l3
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end
    
  end

  #define custom error class here
  class TriangleError < StandardError
  end

  private

  def check_size?
    sides = [l1, l2, l3]
    sides.all? { |side| side > 0 }
  end

  def check_triangle_inequality?
    l1 + l2 > l3 && l2 + l3 > l1 && l1 + l3 > l2
  end

end
