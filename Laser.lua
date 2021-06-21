wavetimer = 0
CreateProjectile("Laser2", 500, 150)

function Update()
   wavetimer = wavetimer + 1
	    if wavetimer == 30 then
	      bullet.Laser2.rotation = 30	  
    end
  end
