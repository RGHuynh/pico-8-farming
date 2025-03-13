Player = {
  x = 64,
  y = 64,
  sprite = 12,
  is_flip = false,
  s_timer = 0,
  ani_speed = 10,
  update = function(self)
    if btn(0) then
      -- left
      self.x -= 1
      self.is_flip = true
      move(self)
    end
    if btn(1) then
      print('d') --right

      self.x += 1
      self.is_flip = false
      move(self)
    end
    if btn(2) then
      --up

      self.y -= 1
    end
    if btn(3) then
      --down

      self.y += 1
    end
  end
}

function move(self)
  if self.s_timer < self.ani_speed then
    self.s_timer += 1
  else
    if self.sprite < 13 then
      self.sprite += 1
    else
      self.sprite = 12
    end
    self.s_timer = 0
  end
end