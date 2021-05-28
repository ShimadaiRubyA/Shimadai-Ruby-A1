class Player < Sprite
  def update
    self.x += Input.x * 3
    self.y += Input.y * 3

    if self.x <= 0
      self.x += 3
    elsif self.x >= 640 - 32
      self.x -= 3
    elsif self.y <= 0
      self.y += 3
    elsif self.y >= 480 - 32
      self.y -= 3
    end
  end
end
