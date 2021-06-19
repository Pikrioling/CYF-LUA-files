wavetimer = 0
bullet = CreateProjectile("bullet", 30, 30)

function Update()
    if wavetimer < 60
	   bullet.Move(0, 1)
	
	end
	
	wavetimer = wavetimer + 1
end