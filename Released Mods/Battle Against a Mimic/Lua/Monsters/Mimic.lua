comments = {"Mimic is thinking about more efficient taxation methods.", "Mimic examines its surroudings.", "Mimic examines its documents."}
commands = {"Discuss", "Suggest"}
randomdialogue = {"I don't have any Human SOULs.", "Have you paid your taxes?", "One thing is certain in life: taxes.", "I hate shiny yet deadly coins."}

sprite = "Mimic" --Always PNG. Extension is added automatically.
name = "Mimic"
hp = 150
atk = 10
def = 10
gold = 250
check = "A worker for the IRS, carrying collected taxes. Might run away when low on Health."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

fleecounter = 0
discusscounter = 0
posecounter = 0

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
   if attackstatus == -1 then
      currentdialogue = {"Uhhh..."} -- player pressed fight but didn't press Z afterwards
   else
      if hp >= 100 then
         currentdialogue = {"Ouch!"}-- player did actually attack
		 atk = atk + 1
      elseif hp >= 41 then
	     currentdialogue = {"Hey! That really hurt!"}
		 atk = atk + 1
      else
         currentdialogue = {"Shit!"}
		 fleecounter = math.random(1, 100)
		 if fleecounter >= 70 then
		    Spare()
	     end     		  
      end
   end
end
	
function OnDeath()
   currentdialogue = {"The IRS will know about this!", "[func:Kill]"}
end

function OnSpare()
   dialogbubble = "rightlong"
   currentdialogue = {"Well that was \nintere-\nsting, but these taxes aren't going to carry themselves", "[func:Spare]"}
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
   if command == "DISCUSS" then
      if discusscounter == 0 then
	     dialogbubble = "right"
		 currentdialogue = ("Taxes are very\nimportant.")
		 BattleDialog({"You discuss about taxes with Mimic."})
		 discusscounter = 1
      else
         dialogbubble = "rightlong"
	     currentdialogue = ("Actually I think\npercent-\nage based is better as none pay too much \nor too little.")
		 BattleDialog({"You discuss about taxation methods with Mimic. Maybe you can suggest something now?"})
	     discusscounter = 2
      end
   elseif command == "SUGGEST" then
      dialogbubble = "right"
	  if discusscounter <= 1 then
         currentdialogue = ("Taxes are complicated stuff.")
		 BattleDialog({"You suggest Mimic some ways to improve taxes."})  
	  else 
	     currentdialogue = ("That seems pretty good \nactually!")
	     BattleDialog({"You suggest Mimic some ways to improve taxes."})
	     canspare = true
	  end
   end
end