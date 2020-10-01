# kawakudari-gosu

This project implements part of the [std15.h](https://github.com/IchigoJam/c4ij/blob/master/src/std15.h) API (from [c4ij](https://github.com/IchigoJam/c4ij)) with [gosu](https://www.libgosu.org/), and [Kawakudari Game](https://ichigojam.github.io/print/en/KAWAKUDARI.html) on top of it.

It will allow programming for [IchigoJam](https://ichigojam.net/index-en.html)-like targets that display [IchigoJam FONT](https://mitsuji.github.io/ichigojam-font.json/) on screen using a Ruby programming language.
```
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
      @std15.scroll(Std15::DIR_UP)

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
```

## Prerequisite

* [Download](https://www.ruby-lang.org/en/downloads/) and install Ruby suitable for your environment.
* [Download](https://www.libgosu.org/ruby.html) and install gosu ruby gem.

## How to use

To run it
```
$ ruby kawakudari.rb
```


## License
[![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)
[CC BY](https://creativecommons.org/licenses/by/4.0/) [mitsuji.org](https://mitsuji.org)

This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
