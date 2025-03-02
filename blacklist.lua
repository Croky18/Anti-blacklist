local BlacklistedVehicles = {
    "RHINO", "LAZER", "HYDRA", "CARGOBOB", "TITAN", "AVENGER", "OPPRESSOR", "OPPRESSOR2",
    "DUMP", "INSURGENT", "INSURGENT2", "INSURGENT3", "BUZZARD", "SAVAGE", "VALKYRIE"
}

local BlacklistedPeds = {
    "s_m_y_marine_01", "s_m_y_marine_02", "s_m_y_blackops_01", "s_m_y_blackops_02",
    "s_m_y_blackops_03", "csb_ramp_marine"
}

local BlacklistedProps = {
    "prop_air_bigradar", "prop_military_pickup", "prop_rock_4_big2", "prop_fnclink_05crnr1"
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        

        for _, ped in ipairs(GetGamePool("CPed")) do
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local pedModel = GetEntityModel(ped)
                for _, blacklistedPed in ipairs(BlacklistedPeds) do
                    if GetHashKey(blacklistedPed) == pedModel then
                        DeleteEntity(ped)
                        break
                    end
                end
            end
        end


        for _, vehicle in ipairs(GetGamePool("CVehicle")) do
            if DoesEntityExist(vehicle) then
                local vehicleModel = GetEntityModel(vehicle)
                for _, blacklistedVehicle in ipairs(BlacklistedVehicles) do
                    if GetHashKey(blacklistedVehicle) == vehicleModel then
                        DeleteEntity(vehicle)
                        break
                    end
                end
            end
        end


        for _, object in ipairs(GetGamePool("CObject")) do
            if DoesEntityExist(object) then
                local objectModel = GetEntityModel(object)
                for _, blacklistedProp in ipairs(BlacklistedProps) do
                    if GetHashKey(blacklistedProp) == objectModel then
                        DeleteEntity(object)
                        break
                    end
                end
            end
        end
    end
end)