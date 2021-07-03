-- A basic encounter script skeleton you can copy and modify for your own creations.

--music = "EnemyApproachin" --Either OGG or WAV. Extension is added automatically. Uncomment for custom music.
encountertext = "Mimic appears!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"bullettest_chaserorb"}
wavetimer = 4.0
arenasize = {155, 130}

autolinebreak = true
SetPPCollision(true)

enemies = {
"Mimic"
}

enemypositions = {
{0, 0}
}


-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"left_right", "Laser", "Spikes"}

function EncounterStarting()
   Inventory.AddCustomItems({"Monster Candy", "Nice Cream"}, {0, 0})
   Inventory.SetInventory({"Monster Candy", "Nice Cream"})
end

function EnemyDialogueStarting()
    -- Good location for setting monster dialogue depending on how the battle is going.
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	if nextwaves[1] == "left_right" then
	   wavetimer = 8.0
	elseif nextwaves[1] == "Laser" then
	   wavetimer = 11.0
	elseif nextwaves[1] == "Spikes" then
	   arenasize = {115, 100}
	   wavetimer = 8.0
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText()
end

function HandleSpare()
    State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
   if ItemID == "MONSTER CANDY" then
      Player.Heal(10)
      BattleDialog({"You ate the Monster Candy."})
   elseif ItemID == "NICE CREAM" then
      Player.Heal(15)
      BattleDialog({"You ate the Nice Cream. The wrapper says: you look nice today!"})
   end
end