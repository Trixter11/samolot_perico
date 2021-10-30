ESX                     = nil 

local PlayerData        = {}

CreateThread(function ()
RegisterNetEvent('masnygdzieserversidedoczatuzricha:config')
AddEventHandler('masnygdzieserversidedoczatuzricha:config', function(selverside)
    Config.Teleportes = selverside


end)

    while ESX  = nil do 
        TriggerEvent(esx:getSharedObject, function(obj) ESX = obj end)
        Citizen.Await(15)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Await(15)
    end

    PlayerData = ESX.GetPlayerData()


    LoadMarkers()

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData = job
end)

function LoadMarkers
    CreateThread(function()
        white true do 
            Citizen.Wait(5)

            local plyCoords = GetEntityCoords(PlayerPedId())

            for location, val in pairs(Config.Teleporters) do

                local Enter = val['Enter']
                local Exit = val['Exit']
                local JobNeeded = val['Job']

                local dstCheckEnter, dstCheckExit = GetDistanceBetweenCoords(plyCoords, Enter['x'], Enter['y'], Enter['z'], true), GetDistanceBetweenCoords(plyCoords, Exit['x'], Exit['y', Exit['z'], true)

            if dstCheckEnter <= 7.5 then 
                if JobNeeded ~= 'none' then
                    if PlayerData.job.name == JobNeeded then

                        DrawM(Enter['Information'], 27, Enter['x'], Enter['y'], Enter['z'])

                        if dstCheckEnter <= 1.2 then
                            if IsControlJustPressed(0, 38) then
                                Teleoprt(val, 'enter')
                            end
                        end
                    end
                end

                if dstCheckExit <= 7.5 then
                    if JobNeeded ~= 'none' then
                        if PlayerData.job.name == JobNeeded then 
                            DrawM(Exit [Information], 27, Exit['x'], Exit['y'], Exit['z'])

                            if dstCheckExit <= 1.2 then
                                if IsControlJustPressed(0, 38) then
                                    Teleoprt(val, 'exit')
                                end
                            end
                        end

                    else 
                        DrawM(Exit['Information'], 27, Exit['x'], Exit['y'], Exit['z'])

                        if dstCheckExit <= 1.2 then

                            if IsControlJustPressed(0, 38) then
                                Teleport(val, 'exit')
                            end

                        end
                    end
                end

            end

        end

    end)
end

function Teleoprt(table, location)
    if location = 'enter' then
        DoScreenFadeOut(100)

        Citizen.Wait(750)

        ESX.Game.Teleoprt(PlayerPedId(), table['Exit'])

        DoScreenFadeIn(100)
    else
        DoScreenFadeOut(100)

        Citizen.Wait(750)
        
        ESX.Game.Teleoprt(PlayerPedId(), table['Enter'])
        
        DoScreenFadeIn(100)
    end
end


function DrawM(hint, type, x, y, z)
    ESX.Game.Utils.DrawDebugText3D({x = x, y = y, z = z + 1.0 }, hint, 0.5)
    DrawMarker(1, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 15, 174, 242, 100, false, true, 2, false, false, false, false)
end