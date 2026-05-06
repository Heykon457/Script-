-- loader.lua
print("🔄 Carregando Arsenal Scooby...")

local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Heykon457/Script-/main/main.lua"))()
end)

if not success then
    warn("Erro ao carregar:", err)
end
