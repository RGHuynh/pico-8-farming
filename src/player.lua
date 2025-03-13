Player = {
  x = 64,
  y = 64,
  sprite = 12,
  is_flip = false,
  s_timer = 0,
  ani_speed = 10,
  update = function(self)
    going_left(self)
    going_right(self)
    going_up(self)
    going_down(self)
  end
}

function going_left(self)
  local left_button = btn(0)
  if left_button then
    self.x = self.x - 1
    self.is_flip = true
    move(self)
  end
end

function going_right(self)
  local right_button = btn(1)
  if right_button then
    self.x = self.x + 1
    self.is_flip = false
    move(self)
  end
end

function going_up(self)
  local up_button = btn(2)
  if up_button then
    self.y = self.y - 1
  end
end

function going_down(self)
  local down_button = btn(3)
  if down_button then
    self.y = self.y + 1
  end
end

function move(self)
  if self.s_timer < self.ani_speed then
    self.s_timer = self.s_timer + 1
  else
    if self.sprite < 13 then
      self.sprite = self.sprite + 1
    else
      self.sprite = 12
    end
    self.s_timer = 0
  end
end

