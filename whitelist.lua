local whitelistedPlayers = {"ESP19X", "RIP_subi03", "XxIMP_ESPECTROxX", "theexal0455"}

local player = game.Players.LocalPlayer

local allowed = false
for _, nick in ipairs(whitelistedPlayers) do
    if player.Name == nick or player.DisplayName == nick then
        allowed = true
        break
    end
end

if not allowed then
    warn("Você não está autorizado a usar este script!")
    game.StarterGui:SetCore("SendNotification", {
        Title = "Acesso Negado",
        Text = "Você não tem permissão para usar este script.",
        Duration = 5
    })
    return
end


loadstring(game:HttpGet("https://raw.githubusercontent.com/Espectroxs/CLT-HUB/refs/heads/main/ESPECTRAL.lua"))()


