class Player < Sprite
  def update
    self.x += Input.x * 3
    self.y += Input.y * 3

    if self.x <= 32
      self.x += 1
    elsif self.y >= 480 - 32
      self.x -= 1
    elsif self.y <= 32
      self.y += 1
    elsif self.y >= 480 - 32
      self.y -= 1
    end
  end
end
