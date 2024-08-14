local gamesUrl = "https://raw.githubusercontent.com/Bl4d3y/Frxst-Hub/main/games"

local success, gamesSource = pcall(game.HttpGet, game, gamesUrl)

if success then
    local games = loadstring(gamesSource)
    
    if games then
        games = games()
        
        local gameID = game.GameId
        local scriptUrl = games[gameID]

        if scriptUrl then
            print('Found a matching script for this game. Loading now..')
            
            local success, scriptSource = pcall(function()
                return game:HttpGet(scriptUrl)
            end)
            
            if success then
                local scriptFunction, errorMsg = loadstring(scriptSource)
                if scriptFunction then
                    scriptFunction()
                else
                    print(" Failed to load the script: " .. errorMsg)
                end
            else
                print("Failed to fetch the script. Check the URL or your network connection.")
            end
        else
            print(" No matching script found for this game.")
        end
    else
        print("Failed to load the games table. Check the content of the URL.")
    end
else
    print("Failed to fetch the games table. Check the URL or your network connection.")
end
