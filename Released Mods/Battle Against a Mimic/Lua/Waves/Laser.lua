SetPPCollision(true) --makes the hitbox of the laser follow the sprite, doing all of the work for making the hitbox move correctly(thank god it exists, it would've either been really difficult or extremely tedious to do. Hail CYF, seriously.)
wavetimer = 0
TypeRoll = 0
clockwise = false --used to tell the laser whether to go clockwise or counterclockwise

Laser = CreateProjectile("Laser", 0, 150)
Laser.sprite.SetPivot(0, 0.5)
Laser.sprite.rotation = -40 
--puts the laser in the starting rotation

function Update()
wavetimer = wavetimer + 1 
   if wavetimer >= 50 then --at 50 frames the attack actually begins
      
	  if Laser.sprite.rotation == 320 then
	     clockwise = true
		 TypeRoll = math.random(1, 2) --randomly chooses whether the attack is a blue or orange one
         Audio.PlaySound("Ping", 0.65)
		 
		 if TypeRoll == 1 then
		    Laser.sprite.color32 = {252, 166, 0}
		 elseif TypeRoll == 2 then
            Laser.sprite.color32 = {66, 252, 255}
		 end		 
	  
	  elseif Laser.sprite.rotation == 220 then 
	     clockwise = false
		 Audio.PlaySound("Ping", 0.65)
		 TypeRoll = math.random(1, 2) 
		 
         if TypeRoll == 1 then
            Laser.sprite.color32 = {252, 166, 0}
		 elseif TypeRoll == 2 then
            Laser.sprite.color32 = {66, 252, 255}
		 end
	  end
      
	  
	  if clockwise == true then
	     Laser.sprite.rotation = Laser.sprite.rotation - 1
	  elseif clockwise == false then
	     Laser.sprite.rotation = Laser.sprite.rotation + 1 
	  end
   end  
end 

function OnHit(Laser) --makes the laser behave like it's supposed to. Surprinsingly much shorter than what I expected(the wonders of the player object)
   if TypeRoll == 1 then
      if not Player.isMoving then
         Player.Hurt(4)
	  end
   elseif TypeRoll == 2 then
      if Player.isMoving then
	     Player.Hurt(4)
	  end
   end
end