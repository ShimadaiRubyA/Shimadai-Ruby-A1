class Player < Sprite
  def update
    self.x += Input.x * 7
    self.y += Input.y * 7

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
 
  attr_accessor :score, :active, :game_end

  def initialize()
    image = Image.load("image/player.png")
    x = (640 - image.width) / 2
    y = 400 - image.height
    @score = 0
    @active = false # 変更
    @game_end = false # 追加
    super(x, y, image)
  end

  
  def shot
    @score += 1
    if @score >= 7
      @active = false
      @game_end = true
    end
  end

  def hit
    @active = false
    @game_end = true # 追加
  end

  def restart # 追加
    self.x = (640 - image.width) / 2
    self.y = 400 - image.height
    @score = 0
    @active = true
    @game_end = false
  end

end
