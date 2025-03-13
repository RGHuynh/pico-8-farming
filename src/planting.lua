Planting = {
  sprite = 2,
  dirt_sprite = 5,
  seeds = {},
  draw = function(self, Player)
    planting_seeds(self, Player)
  end
}

function planting_seeds(self, Player)
  local player_position = player_position(Player)
  local player_position_x = player_position.x
  local player_position_y = player_position.y

  digging_ground_planting_seed(self, player_position_x, player_position_y)

  harvesting_crop(self, player_position_x, player_position_y)
end

function digging_ground_planting_seed(self, player_position_x, player_position_y)
  local button_c = btnp(4)

  if button_c then
    local is_not_dug = mget(player_position_x, player_position_y) ~= self.dirt_sprite
    local is_empty_cell = mget(player_position_x, player_position_y) == 0
    if is_not_dug and is_empty_cell then
      mset(player_position_x, player_position_y, self.dirt_sprite)
    else
      mset(player_position_x, player_position_y, self.sprite)
      add(self.seeds, { sx = flr(player_position_x), sy = flr(player_position_y), itg = 0 })
    end
  end
end

function harvesting_crop(self, player_position_x, player_position_y)
  local button_x = btn(5)
  if button_x then
    if fget(mget(player_position_x, player_position_y), 2) then
      mset(player_position_x, player_position_y, 0)
      for s in all(self.seeds) do
        if s.sx == flr(player_position_x) and s.sy == flr(player_position_y) then
          del(self.seeds, s)
        end
      end
    end
  end
end

function player_position(Player)
  -- tile being under the pixel when planting X
  local x = (Player.x + 4) / 8
  -- tile being under the pixel when planting Y
  local y = (Player.y + 7) / 8

  return {
    x = x,
    y = y
  }
end
