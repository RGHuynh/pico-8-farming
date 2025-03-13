Crop = {
    crop_timer = 300,
    seeds = {},
    v_crops = function(self, Planting)
        for s in all(Planting.seeds) do 
            s.itg = s.itg + 1
            if s.itg > self.crop_timer then
                mset(s.sx, s.sy, 4)
            end
        end
    end
}

