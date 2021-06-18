class Enemy < Sprite
  def initialize(x,y,img)
    super(x,y,img)
    @direction = 0
  end

  def hit
    self.vanish
  end

  def update
  
    if ( $i % 60 == 0 )
    @direction = rand(4)
    end
    speed = rand(4)

    if @direction == 0
      self.x += speed

    elsif @direction == 1
      self.x -= speed

    elsif @direction == 2
      self.y += speed

    elsif @direction == 3
      self.y -= speed
    end

    if self.x <= 0
      self.x += speed
    elsif self.x >= 640 - 32
      self.x -= speed
    elsif self.y <= 0
      self.y += speed
    elsif self.y >= 480 - 32
      self.y -= speed
    end

  end
  
end