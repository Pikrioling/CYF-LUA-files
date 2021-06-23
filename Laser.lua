wavetimer = 0
Laser = CreateProjectile("Laser2", 500, 150)

function Update()
   wavetimer = wavetimer + 1
   if wavetimer == 25 then
	      Laser.sprite.SetPivot(0, 0.5)
    elseif wavetimer == 30 then
		  Laser.sprite.rotation = 30	  
    end
  end
