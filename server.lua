CreateThread(function()
    while true do 
        Teleporters = { 
            ['PhillBox'] = {
                ['Job'] = 'none',
                ['Enter'] = { 
                    ['x'] = -1154.24, 
                    ['y'] = -2716.66, 
                    ['z'] = 19.89,
                    ['Information'] = '[E] samolot na cayo perico',
                },
                ['Exit'] = {
                    ['x'] = 4487.57, 
                    ['y'] = -4498.03, 
                    ['z'] = 4.18, 
                    ['Information'] = '[E] los santos' 
                }
            },


            --tu se dalej wpierdalasz kordy ^
        }

            TriggerClientEvent('masnygdzieserversidedoczatuzricha:config', -1, Teleporters)
            Wait(1000)

    end
end)