class Explosion

  def initialize rate: 1, rmax: 64, fuse: 0
    # the idea is that each kind of explosion
    # should have its own explosion handler.
    @rate = rate
    @rmax = rmax
    @fuse = fuse
  end

  def is_complete e
    e[:r] < @rmax
  end
  
  def expand e
    next_e = e
    next_e[:r] += @rate
    if(next_e[:r] > @rmax)
      next_e[:r] = @rmax
    end
    return next_e
  end
  
  def colliding e, mob
    x_offset = Math.abs(e[:x] - mob[:x])
    y_offset = Math.abs(e[:y] - mob[:y])
    d = Math.sqrt((x_offset ** 2) + (y_offset ** 2))
    min_d = e[:r] + mob[:r]
    
    return (d <= min_d)
  end
  
end