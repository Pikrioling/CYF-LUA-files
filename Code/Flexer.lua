return function(newENV)
_ENV = newENV
----- DO NOT MODIFY ABOVE -----

-- A basic Enemy Entity script skeleton you can copy and modify for your own creations.
comments = { "Smells like the work of an enemy stand.", "Flexer is flexing like his life depends on it.[w:10]\nIt might actually.", "Flexer is drinking protein shake." }
commands = { "Check", "Pose", "Flex"}
randomdialogue = {
    { "When I flex[w:10].[w:10].[w:10].",            "I FEEL MY BEST!"                     },
    { "Check out these muscles"},
    { "I'll show you something.", "Trust me."                  },
    { "Keep looking!",            "Harder!",  "I SAID HARDER!" },
      "It's working."
}

AddAct("Check", "", 0)
AddAct("Pose", "Strike a pose", 0)
AddAct("Flex", "Show your muscles", 0, { "Susie" })

hp = 250
atk = 10
def = 5 
ActionWanted = 0 --controls what the Flexer wants. 0 wants flex, 1 wants non-magic attack, 2 wants defend, 3 wants item use
ChangeState = true
UsedItem = false
MercyProgression = 0 --basically the same thing Undertale does for tracking mercy progression
dialogbubble = "DRBubble" -- See documentation for what bubbles you have available.
canspare = false
check = "Buff enemies.\nFollow what they do."

function HandleMercy() --handles various Mercy-related functions
   if MercyProgression >= 100 then
      canspare = true
	  MercyProgression = 100	  
   end
   if UsedItem == true then
      if ActionWanted == 3 then
	     MercyProgression = MercyProgression + 50
		 UsedItem = false
	  end
   end
end

-- CYK variables
mag = 9001            -- MAGIC stat of the enemy
targetType = "single" -- Specifies how many (or which) target(s) this enemy's bullets will target
tired = false         -- If true, the Player will be able to spare this enemy using the spell "Pacify"

-- Check the "Special Variables" page of the documentation to learn how to modify this mess
animations = {
	FlexIdle = { { 0 }, 10 , { } },
	AttackIdle = { { 0 }, 10 , { } },
	DefendIdle = { { 0 }, 10 , { } },
	ItemIdle = { { 0 }, 10 , { } },
	Idle = { { 0, 1, 2, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 1 / 15, { }               },
	Hurt = { { 0 },                                           1     , { next = "Idle" } },
    Spareable = { { 0, 1, 2, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 1 / 15, { }               },
}

-- Triggered just before computing an attack on this target
function BeforeDamageCalculation(attacker, damageCoeff)
    -- Good location to set the damage dealt to this enemy using self.SetDamage()
    if damageCoeff > 0 then
        --SetDamage(666)
    end
end

-- Triggered when a Player attacks (or misses) this enemy in the ATTACKING state
function HandleAttack(attacker, attackstatus)
    if currentdialogue == nil then
        currentdialogue = { }
    end

    if attackstatus == -1 then
        -- Player pressed fight but didn't press Z afterwards
        table.insert(currentdialogue, "A blind man can do better, " .. attacker.name .. "!\n")
    else
        -- Player did actually attack
        if attackstatus < 50 then
            table.insert(currentdialogue, "You call that an attack " .. attacker.name .. "?\n")
			table.insert(currentdialogue, "Grandma can do better[w:10] WHILE SHE SLEEPS!")
        else
            table.insert(currentdialogue, "Now that's what I call an attack, " .. attacker.name .. "!\n")
			if ActionWanted == 1 then
			   MercyProgression = MercyProgression + 50
			   HandleMercy()
			end
        end
    end
end

-- Triggered when a Player uses an Act on this enemy.
-- You don't need an all-caps version of the act commands here.
function HandleCustomCommand(user, command)
    local text = { "" }
    if command == "Check" then
        text = { name .. " - " .. atk .. " ATK " .. def .. " DEF\n" .. check }
    elseif command == "Flex" then
        if ActionWanted == 0 then
		    currentdialogue = {"Hell yeah!\nIt's flexin' time!"}
		    text = {"You flexed with Flexer[w:10]\nIt seems pleased."}
			MercyProgression = MercyProgression + 50
			HandleMercy()
		else 
		   currentdialogue = {"It's ain't flexin' time yet"}
		   text = {"You flexed on Flexer[w:10]\nIt doesn't seem too pleased."}
		   MercyProgression = MercyProgression + 25
		   HandleMercy()
        end
    elseif command == "Pose" then
        text = {"You posed dramatically[w:10]/nFlexer appreciated it"}
		currentdialogue = {"Nice pose!"}
		MercyProgression = MercyProgression + 25
		HandleMercy()    
    end
    BattleDialog(text)
end

function Update()
   DEBUG(ActionWanted)
   if ChangeState == true then
      DEBUG("idling")
      SetCYKAnimation("idle") --just calling HandleAnimationChange
   end
   if canspare == true then
      SetCYKAnimation("idle") --same here
   end
end

-- Function called whenever this entity's animation is changed.
-- Make it return true if you want the animation to be changed like normal, otherwise do your own stuff here!
function HandleAnimationChange(newAnim)
   DEBUG("yes") 
   if newAnim == "Hurt" then
      ChangeState = true  
   elseif newAnim == "idle" then
      if canspare == true then
         SetCYKAnimation("Spareable")
	  end
      if ActionWanted == 0 then
	     ChangeState = false
         SetCYKAnimation("FlexIdle")
		 return false
      elseif ActionWanted == 1 then
	     ChangeState = false
	     SetCYKAnimation("AttackIdle")
	     return false
      elseif ActionWanted == 2 then
	     ChangeState = false
	     SetCYKAnimation("DefendIdle")
	     return false
      elseif ActionWanted == 3 then
	     ChangeState = false
	     SetCYKAnimation("ItemIdle")
	     return false
      end
   end
end


----- DO NOT MODIFY BELOW -----
end