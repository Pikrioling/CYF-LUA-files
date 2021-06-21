wavetimer = 0

function CreateBullet(x,y)
   local bullet = CreateProjectile("Laser2", x, y)
   table.insert(Lasers, Laser2)
end

CreateProjectile("Laser2", 500, 150)
Lasers = {}

function Update()
   wavetimer = wavetimer + 1
      if wavetimer == 0 then
        local xPos = 500
	    local yPos = 150
        CreateBullet(xPos, yPos)
	    if wavetimer == 30 then
	      bullet.sprite.SetPivot(0, 0.5)
	      bullet.sprite.rotation = 30	  
    end
  end
end