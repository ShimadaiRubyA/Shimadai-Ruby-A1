require 'dxruby'

require_relative 'player'
require_relative 'enemy'

font = Font.new(32)


player_img = Image.load("image/player.png")
enemy_img = Image.load("image/enemy.png")

player = Player.new()
enemies = []
10.times do
  enemies << Enemy.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), enemy_img)
end

$i = 0

Window.loop do

  #if( i % 10 == 0 )
   Sprite.update(enemies)
  #end
  
    player.update
    player.draw
    Sprite.draw(enemies)

    Sprite.check(player, enemies)

    $i += 1

    Window.draw_font(10, 10, "カツ丼　スコア：#{player.score}", font, {color: C_BLUE})

    if !player.active # 以下追加
      if player.game_end
        Window.draw_font(210, 190, "ゲームクリア", font, {color: C_BLUE})
      end
      Window.draw_font(120, 282, "スペースキー：ゲームスタート", font, {color: C_BLUE})
      Window.draw_font(181, 314, "ESCキー：ゲーム終了", font, {color: C_BLUE})
      if Input.key_push?(K_SPACE)
        if player.game_end
          enemies.map {|enemy| enemy.vanish}
          Sprite.clean(enemies)
          10.times do
            enemies << Enemy.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), enemy_img)
          end
        end
        player.restart
      elsif Input.key_push?(K_ESCAPE)
        break
      end
    end
end
