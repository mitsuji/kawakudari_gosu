require 'gosu'
require_relative 'ichigojam'

class Kawakudari < Gosu::Window
  def initialize
    super 512, 384
    self.caption = "kawakudari"
    @std15 = Std15.new(512,384,32,24)
    @frame = 0
    @x = 15
    @running = true
  end
  
  def update
    return if !@running
    if @frame % 5 == 0
      if Gosu.button_down? Gosu::KB_LEFT
        @x -=1
      end
      if Gosu.button_down? Gosu::KB_RIGHT
        @x +=1
      end

      @std15.locate(@x,5)
      @std15.putc('0'.ord)
      @std15.locate(rand(32),23)
      @std15.putc('*'.ord)
      @std15.scroll()

      if @std15.scr(@x,5) != 0 then
        @std15.locate(0,23)
        @std15.putstr("Game Over...")
        @std15.putnum(@frame)
        @running = false
      end
    end
    @frame +=1
  end
  
  def draw
    @std15.draw_screen()
  end
end

Kawakudari.new.show if __FILE__ == $0
