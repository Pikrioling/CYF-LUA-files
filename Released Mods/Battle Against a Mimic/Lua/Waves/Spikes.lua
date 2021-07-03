SetPPCollision(true)
wavetimer = 0
warning = 0
red = true 
warning1 = false 
warning2 = false
warning3 = false
warning4 = false 
spikerisetype = math.random(1, 3)
spikes = {}

function CreateBullet(x,y)
   local bullet = CreateProjectile("Spike1", x, y)
   table.insert(spikes, bullet)
end

function warning() --Makes the spikes change color between yellow and red, do not use spike 1 and 3 togheter with this
   if warning1 == true then
      if red == true then
	     spike1.sprite.color32 = {255, 0, 0}
		 red = false
	  else 
	     spike1.sprite.color32 = {255, 255, 0}
		 red = true
	  end
   end
   if warning2 == true then
      if red == true then
	     spike2.sprite.color32 = {255, 0, 0}
	  else 
	     spike2.sprite.color32 = {255, 255, 0}
	  end
   end
   if warning3 == true then
      if red == true then
	     spike3.sprite.color32 = {255, 0, 0}
		 red = false
	  else 
	     spike3.sprite.color32 = {255, 255, 0}
		 red = true
	  end
   end
   if warning4 == true then
      if red == true then
	     spike4.sprite.color32 = {255, 0, 0}
	  else 
	    spike4.sprite.color32 = {255, 255, 0} 
	  end
   end
end

function warning_2() --Makes the spikes change color between yellow and red, do not use spike 2 and 4 togheter with this
   if warning1 == true then
      if red == true then
	     spike1.sprite.color32 = {255, 0, 0}
	  else 
	     spike1.sprite.color32 = {255, 255, 0} 
	  end
   end
   if warning2 == true then
      if red == true then
	     spike2.sprite.color32 = {255, 0, 0}
		 red = false
	  else 
	     spike2.sprite.color32 = {255, 255, 0}
		 red = true
	  end
   end
   if warning3 == true then
      if red == true then
	     spike3.sprite.color32 = {255, 0, 0}
	  else 
	     spike3.sprite.color32 = {255, 255, 0} 
	  end
   end
   if warning4 == true then
      if red == true then
	     spike4.sprite.color32 = {255, 0, 0}
		 red = false
	  else 
	    spike4.sprite.color32 = {255, 255, 0} 
		red = true
	  end
   end
end

function warning_3() --Makes the spikes change color between yellow and red, do not use spike 2 and 3 togheter with this
   if warning1 == true then
      if red == true then
	     spike1.sprite.color32 = {255, 0, 0}
	  else 
	     spike1.sprite.color32 = {255, 255, 0} 
	  end
   end
   if warning2 == true then
      if red == true then
	     spike2.sprite.color32 = {255, 0, 0}
		 red = false
	  else 
	     spike2.sprite.color32 = {255, 255, 0}
		 red = true
	  end
   end
   if warning3 == true then
      if red == true then
	     spike3.sprite.color32 = {255, 0, 0}
		 red = false
	  else 
	     spike3.sprite.color32 = {255, 255, 0}
		 red = true
	  end
   end
   if warning4 == true then
      if red == true then
	     spike4.sprite.color32 = {255, 0, 0} 
	  else 
	    spike4.sprite.color32 = {255, 255, 0} 
	  end
   end
end

function SpikeAttack() --Makes the spikes go up, as well as making the spikes white after the warning
spike1.sprite.color32 = {255, 255, 255}
spike2.sprite.color32 = {255, 255, 255}
spike3.sprite.color32 = {255, 255, 255}
spike4.sprite.color32 = {255, 255, 255}
   if warning1 == true then
      spike1.Move(0, 3)
   end
   if warning2 == true then
      spike2.Move(0, 3)
   end
   if warning3 == true then
      spike3.Move(0, 3)
   end
   if warning4 == true then
      spike4.Move(0, 3)
   end
end

function SpikeRetreat() --Makes the spikes go back, basically SpikeAttack but with negative Y
   if warning1 == true then
      spike1.Move(0, -3)
   end
   if warning2 == true then
      spike2.Move(0, -3)
   end
   if warning3 == true then
      spike3.Move(0, -3)
   end
   if warning4 == true then
      spike4.Move(0, -3)
   end
end

function Update()
wavetimer = wavetimer + 1  
   if wavetimer == 1 then
		for i = 0, 3, 1
		do
	       local xPos = -Arena.width / 2 + i * Arena.width / 3.6 + 10
		   local yPos = Arena.height / 2 - 260
		   CreateBullet(xPos, yPos)
		   spike1 = spikes[1]
		   spike2 = spikes[2]
		   spike3 = spikes[3]
		   spike4 = spikes[4]
        end
   end
   
   if wavetimer >= 30 then --maximum wavetimer = 480
      if spikerisetype == 1 then --done
	     if wavetimer < 60 then
		    if wavetimer % 5 == 0 then    
			   warning1 = true 
			   warning2 = true
			   warning()
		    end
		 elseif wavetimer == 60 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 95 then
		    SpikeAttack()
		 elseif wavetimer <= 130 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 131 then
		    warning1 = false
			warning2 = false
			warning3 = true
			warning4 = true
		 elseif wavetimer < 165 then
		    if wavetimer % 5 == 0 then
			   warning()
			end
		 elseif wavetimer == 165 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 200 then
		    SpikeAttack()
		 elseif wavetimer <= 235 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 236 then
		    warning2 = true
			warning4 = false
		 elseif wavetimer < 270 then
		    if wavetimer % 5 == 0 then
			   warning()
			end
		 elseif wavetimer == 270 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 305 then
		    SpikeAttack()
		 elseif wavetimer <= 340 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 341 then
		    warning1 = true
			warning2 = false
			warning3 = false
			warning4 = true
		 elseif wavetimer < 375 then
		    if wavetimer % 5 == 0 then
			   warning()
			end
		 elseif wavetimer == 375 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 410 then
		    SpikeAttack()
		 elseif wavetimer <= 445 then
		    SpikeRetreat()
		 end
      elseif spikerisetype == 2 then --done
         if wavetimer < 60 then
		    if wavetimer % 5 == 0 then    
			   warning3 = true 
			   warning4 = true
			   warning() 
			end
		 elseif wavetimer == 60 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 95 then
		    SpikeAttack()
		 elseif wavetimer <= 130 then
		    SpikeRetreat()
	
		elseif wavetimer == 131 then
		    warning2 = true
			warning3 = false
		 elseif wavetimer < 165 then
            if wavetimer % 5 == 0 then
			   warning_3()
			end
		 elseif wavetimer == 165 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 200 then
		    SpikeAttack()
		 elseif wavetimer <= 235 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 236 then
		    warning1 = true
			warning2 = false
			warning3 = true
			warning4 = false
		 elseif wavetimer < 270 then
		    if wavetimer % 5 == 0 then
			   warning_3()
			end
		 elseif wavetimer == 270 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 305 then
		    SpikeAttack()
		 elseif wavetimer <= 340 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 341 then
		    warning1 = false
			warning2 = true
			warning3 = false
			warning4 = true
		 elseif wavetimer < 375 then
		    if wavetimer % 5 == 0 then
			warning_3()
			end
		 elseif wavetimer == 375 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 410 then
		    SpikeAttack()
		 elseif wavetimer <= 445 then
		    SpikeRetreat()
		 elseif wavetimer == 450 then
		 end
	  
	  elseif spikerisetype == 3 then -- to do
         if wavetimer < 60 then
            if wavetimer % 5 == 0 then
			   warning1 = true
			   warning2 = true
			   warning()
			end
		 elseif wavetimer == 60 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 95 then
		    SpikeAttack()
		 elseif wavetimer <= 130 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 131 then
		    warning3 = true
		 elseif wavetimer < 165 then
		    if wavetimer % 5 == 0 then
			   warning_2()
			end
		 elseif wavetimer == 165 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 200 then
		    SpikeAttack()
		 elseif wavetimer <= 235 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 236 then
		    warning3 = false
			warning4 = true
		 elseif wavetimer < 270 then
		    if wavetimer % 5 == 0 then
			   warning_3()
			end
		 elseif wavetimer == 270 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 305 then
		    SpikeAttack()
		 elseif wavetimer <= 340 then
		    SpikeRetreat()
		 
		 elseif wavetimer == 341 then
		    warning3 = true
			warning1 = false
		 elseif wavetimer < 375 then
		    if wavetimer % 5 == 0 then
			   warning()
			end
		 elseif wavetimer == 375 then
		    Audio.PlaySound("SpikeRise", 0.65)
		 elseif wavetimer <= 410 then
		    SpikeAttack()
		 elseif wavetimer <= 445 then
		    SpikeRetreat()
         end			
	  end  
   end
end