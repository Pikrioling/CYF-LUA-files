comments = {"Mimic is thinking about more efficient taxation methods", "Mimic examines its surroudings.", "Mimic prepares its loadout."}
commands = {"Discuss"}
randomdialogue = {"I don't have any Human SOULs.", "Have you paid your taxes?", "One thing is certain in life: taxes.", "I hate shiny yet deadly coins."}

sprite = "Mimic" --Always PNG. Extension is added automatically.
name = "Mimic"
hp = 150
atk = 10
def = 0
check = "A tax collector for the IRS. Might run away when low on HP."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

fleeroll = 0

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
		   currentdialogue = {"Shit shit shit shit."}
		   fleeroll = math.random(1, 100)
		end
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "DISCUSS" then
	    currentdialogue = ("Yes, taxes are very interesting")
		BattleDialog = ({"You discuss about taxes with Mimic"})
		canspare = true
    end
end