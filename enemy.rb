class Enemy < Sprite
  def hit
    self.vanish
  end

  def update
    
    direction = rand(4)

    if direction == 0
      self.x += 5

    elsif direction == 1
      self.x -= 5

    elsif direction == 2
      self.y += 5

    elsif direction == 3
      self.y -= 5

    end
  end
end