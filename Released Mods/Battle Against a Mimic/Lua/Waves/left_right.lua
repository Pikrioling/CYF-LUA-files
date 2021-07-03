wavetimer = 0
bullets = {}
function CreateBullet(x,y)
   local bullet = CreateProjectile("GOLD", x, y)
   table.insert(bullets, bullet)
end

function Update()
wavetimer = wavetimer + 1 
   if wavetimer % 60 == 0 then
      for i = 0, 4, 1
	  do
	     local xPos = -Arena.width / 2 + i * Arena.width / 4 * 1.2 + 20
		 local yPos = Arena.height / 2 + 80
		 CreateBullet(xPos, yPos) --creates the bullets 
	  end
   elseif wavetimer % 30 == 0 then
      for i = 0, 4, 1
	  do
	     local xPos = -Arena.width / 2 + i * Arena.width / 4 * 1.2
		 local yPos = Arena.height / 2 + 80
		 CreateBullet(xPos, yPos) --creates the bullets sligtly more to the left than normal
	  end
   end

   for i = #bullets, 1, -1
   do
      currentBullet = bullets[i]
	  currentBullet.Move(0, -1.5)
	  if currentBullet.y < - 170 then
	     currentBullet.remove()
		 table.remove(bullets, i) --moovs bullets down, and also removes them
      end
   end
end