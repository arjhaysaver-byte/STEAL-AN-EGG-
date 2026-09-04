-- ============================================
-- 🐝 BEE HUB - FULL CUSTOMIZATION 🐝
-- Just copy and paste this entire script!
-- ============================================

-- Wait for game to load
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Check for unsupported executors
if identifyexecutor then
    local execName = tostring(identifyexecutor()):lower()
    if execName:find("solara") or execName:find("xeno") then
        game:GetService("Players").LocalPlayer:Kick("EXECUTOR NOT SUPPORTED")
        return
    end
end

-- ============================================
-- LOAD THE ORIGINAL SINWARE HUB
-- ============================================
-- (Your original SinwareHub code goes here)
-- PASTE YOUR ENTIRE SINWAREHUB CODE HERE
-- ============================================

-- ============================================
-- 🐝 BEE HUB CUSTOMIZATIONS 🐝
-- (This runs AFTER the hub loads)
-- ============================================

task.wait(3)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ============================================
-- 1. CHANGE TITLE TO BEE HUB 🐝
-- ============================================
local function changeTitle()
    local found = false
    for _, gui in pairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            for _, child in pairs(gui:GetDescendants()) do
                -- Change text labels
                if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                    if child.Text and (
                        string.find(string.lower(child.Text), "sinware") or
                        string.find(string.lower(child.Text), "ouroboros") or
                        string.find(string.lower(child.Text), "hub")
                    ) then
                        child.Text = "🐝 BEE HUB 🐝"
                        found = true
                    end
                end
                -- Add overlay if needed
                if child:IsA("Frame") and child.Size.Y.Offset < 80 and child.Size.X.Offset > 100 then
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.Position = UDim2.new(0, 0, 0, 0)
                    label.BackgroundTransparency = 1
                    label.Text = "🐝 BEE HUB 🐝"
                    label.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold
                    label.TextScaled = true
                    label.Font = Enum.Font.GothamBold
                    label.Parent = child
                    found = true
                end
            end
        end
    end
    return found
end

-- Try multiple times to change the title
for i = 1, 10 do
    if changeTitle() then
        print("🐝 BEE HUB - Title changed!")
        break
    end
    task.wait(1)
end

-- ============================================
-- 2. ADD FLOATING BEE HUB TEXT 🐝
-- ============================================
local function addBeeHubText()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BeeHubOverlay"
    screenGui.Parent = playerGui
    screenGui.IgnoreGuiInset = true
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 200, 0, 40)
    textLabel.Position = UDim2.new(0.5, -100, 0.02, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "🐝 BEE HUB 🐝"
    textLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeTransparency = 0.3
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.Parent = screenGui
    
    -- Animate it (bounce effect)
    spawn(function()
        while screenGui and screenGui.Parent do
            for i = 1, 5 do
                textLabel.Position = UDim2.new(0.5, -100, 0.02, -i * 0.5)
                task.wait(0.02)
            end
            for i = 5, 1, -1 do
                textLabel.Position = UDim2.new(0.5, -100, 0.02, -i * 0.5)
                task.wait(0.02)
            end
            task.wait(2)
        end
    end)
end

addBeeHubText()

-- ============================================
-- 3. ADD WELCOME NOTIFICATION 🐝
-- ============================================
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🐝 BEE HUB",
    Text = "Welcome to BEE HUB! Loaded successfully! 🐝",
    Duration = 4
})

print("🐝 BEE HUB - All customizations applied!")

-- ============================================
-- 4. CHANGE COLORS TO GOLD/YELLOW 🐝
-- (Optional - uncomment to use)
-- ============================================
task.wait(2)
for _, gui in pairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") then
        for _, child in pairs(gui:GetDescendants()) do
            if child:IsA("Frame") then
                child.BackgroundColor3 = Color3.fromRGB(30, 25, 10)
            end
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                if child.TextColor3 then
                    child.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold
                end
            end
        end
    end
end

print("🐝 BEE HUB - Gold theme applied!")

-- ============================================
-- 5. AUTO-ENABLE STEAL EGGS (Optional)
-- ============================================
task.wait(5)
for _, gui in pairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") then
        for _, child in pairs(gui:GetDescendants()) do
            if child:IsA("TextButton") and child.Text and string.find(string.lower(child.Text), "steal") then
                child:Click()
                print("🐝 Auto-steal enabled!")
                break
            end
        end
    end
end

print("🐝 BEE HUB - Fully loaded! Enjoy! 🐝")