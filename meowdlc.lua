-- /\\_____/\\
-- /  o   o  \\
--( ==  ^  == )
-- )         (
--(           )
--( (  )   (  ) )
--(__(__)___(__)__) 
-- MEOWDLC BOOT LOADER
-- Created by meow2tie
--=========================================================
-- BOOT / LOADING SCREEN
--=========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DISCORD_URL = "https://discord.gg/zV2DSVpcs"

-- Clipboard copy: supported executors expose one of these APIs.
pcall(function()
    if setclipboard then
        setclipboard(DISCORD_URL)
    elseif toclipboard then
        toclipboard(DISCORD_URL)
    elseif syn and syn.write_clipboard then
        syn.write_clipboard(DISCORD_URL)
    end
end)

local function tween(object, time, properties)
    local t = TweenService:Create(
        object,
        TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        properties
    )
    t:Play()
    return t
end

local gui = Instance.new("ScreenGui")
gui.Name = "meowdlc_BootScreen"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = PlayerGui

local bg = Instance.new("Frame")
bg.Name = "BlackScreen"
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.Parent = gui

local container = Instance.new("Frame")
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.Position = UDim2.fromScale(0.5, 0.5)
container.Size = UDim2.fromOffset(500, 230)
container.BackgroundTransparency = 1
container.Parent = bg

local title = Instance.new("TextLabel")
title.Name = "LoadingTitle"
title.AnchorPoint = Vector2.new(0.5, 0)
title.Position = UDim2.fromScale(0.5, 0)
title.Size = UDim2.fromScale(1, 0.25)
title.BackgroundTransparency = 1
title.Text = "MEOWDLC"
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1, 1, 1)
title.TextTransparency = 1
title.Parent = container

local scriptLabel = Instance.new("TextLabel")
scriptLabel.Name = "LoadingScript"
scriptLabel.AnchorPoint = Vector2.new(0.5, 0)
scriptLabel.Position = UDim2.fromScale(0.5, 0.27)
scriptLabel.Size = UDim2.fromScale(1, 0.12)
scriptLabel.BackgroundTransparency = 1
scriptLabel.Text = "LoadingScript..."
scriptLabel.Font = Enum.Font.Code
scriptLabel.TextSize = 14
scriptLabel.TextColor3 = Color3.fromRGB(190, 190, 190)
scriptLabel.TextTransparency = 1
scriptLabel.Parent = container

local status = Instance.new("TextLabel")
status.Name = "Check_LocalScript"
status.AnchorPoint = Vector2.new(0.5, 0)
status.Position = UDim2.fromScale(0.5, 0.44)
status.Size = UDim2.fromScale(1, 0.12)
status.BackgroundTransparency = 1
status.Text = "Check_LocalScript..."
status.Font = Enum.Font.Code
status.TextSize = 13
status.TextColor3 = Color3.fromRGB(125, 125, 125)
status.TextTransparency = 1
status.Parent = container

local barBg = Instance.new("Frame")
barBg.Name = "ProgressBackground"
barBg.AnchorPoint = Vector2.new(0.5, 0)
barBg.Position = UDim2.fromScale(0.5, 0.64)
barBg.Size = UDim2.fromScale(0.72, 0.025)
barBg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
barBg.BackgroundTransparency = 1
barBg.BorderSizePixel = 0
barBg.Parent = container

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(1, 0)
barBgCorner.Parent = barBg

local bar = Instance.new("Frame")
bar.Name = "Progress"
bar.Size = UDim2.fromScale(0, 1)
bar.BackgroundColor3 = Color3.fromRGB(255, 75, 105)
bar.BackgroundTransparency = 1
bar.BorderSizePixel = 0
bar.Parent = barBg

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = bar

local percent = Instance.new("TextLabel")
percent.Name = "Percentage"
percent.AnchorPoint = Vector2.new(0.5, 0)
percent.Position = UDim2.fromScale(0.5, 0.72)
percent.Size = UDim2.fromScale(1, 0.10)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.Code
percent.TextSize = 12
percent.TextColor3 = Color3.fromRGB(95, 95, 95)
percent.TextTransparency = 1
percent.Parent = container

local version = Instance.new("TextLabel")
version.Name = "BuildInfo"
version.AnchorPoint = Vector2.new(0.5, 1)
version.Position = UDim2.fromScale(0.5, 1)
version.Size = UDim2.fromScale(1, 0.10)
version.BackgroundTransparency = 1
version.Text = "meowdlc // secure initialization"
version.Font = Enum.Font.Code
version.TextSize = 10
version.TextColor3 = Color3.fromRGB(65, 65, 65)
version.TextTransparency = 1
version.Parent = container

-- Fast fade-in.
tween(bg, 0.28, {BackgroundTransparency = 0})
task.wait(0.10)
tween(title, 0.30, {TextTransparency = 0})
task.wait(0.10)
tween(scriptLabel, 0.25, {TextTransparency = 0})
task.wait(0.08)
tween(status, 0.25, {TextTransparency = 0})
tween(barBg, 0.25, {BackgroundTransparency = 0})
tween(bar, 0.25, {BackgroundTransparency = 0})
tween(percent, 0.25, {TextTransparency = 0})
tween(version, 0.25, {TextTransparency = 0})

local steps = {
    {"Check_LocalScript...", 8},
    {"Resolving_Dependencies...", 17},
    {"Checking_Runtime...", 27},
    {"Initializing_WindUI...", 38},
    {"Loading_Modules...", 49},
    {"Applying_Configuration...", 61},
    {"Building_Interface...", 72},
    {"Registering_Connections...", 83},
    {"Finalizing_Components...", 94},
    {"MEOWDLC_READY ✓", 100},
}

for _, step in ipairs(steps) do
    status.Text = step[1]
    percent.Text = tostring(step[2]) .. "%"
    tween(bar, 0.38, {Size = UDim2.fromScale(step[2] / 100, 1)})
    task.wait(0.58)
end

task.wait(0.45)

-- Smooth fade-out.
local fade = 0.75
tween(bg, fade, {BackgroundTransparency = 1})
tween(title, fade, {TextTransparency = 1})
tween(scriptLabel, fade, {TextTransparency = 1})
tween(status, fade, {TextTransparency = 1})
tween(barBg, fade, {BackgroundTransparency = 1})
tween(bar, fade, {BackgroundTransparency = 1})
tween(percent, fade, {TextTransparency = 1})
tween(version, fade, {TextTransparency = 1})
task.wait(fade + 0.05)
gui:Destroy()

--=========================================================

--=========================================================
-- CURRENT MEOWDLC FROM GITHUB
--=========================================================

-- /\_____/\ 
-- /  o   o  \
--( ==  ^  == )
-- )         (
--(           )
--( (  )   (  ) )
--(__(__)___(__)__)
-- MEOWDLC
-- Created by meow2tie
--
-- Optimized / rebuilt ESP + UI
-- WindUI 1.6.x
-- Floating button OFF by default
-- Player target selector removed
-- Dynamic theme/accent support
-- iPhone-style Info Island
-- Smooth 2D ESP tracers
-- Player + NPC ESP
-- HP bars: Bottom / Side
-- Self ESP
-- Performance presets

--=========================================================
-- SERVICES
--=========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Camera = Workspace.CurrentCamera

--=========================================================
-- WINDUI
--=========================================================

local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

assert(WindUI, "[meowdlc] WindUI failed to load")

--=========================================================
-- COLORS
--=========================================================

local COLORS = {
    Background = Color3.fromRGB(238, 238, 240),
    Panel = Color3.fromRGB(248, 248, 249),
    PanelDark = Color3.fromRGB(225, 225, 228),
    Border = Color3.fromRGB(145, 145, 150),

    Text = Color3.fromRGB(35, 35, 38),
    SubText = Color3.fromRGB(105, 105, 110),

    Accent = Color3.fromRGB(255, 75, 105),
    ESP = Color3.fromRGB(255, 75, 105),
    White = Color3.fromRGB(255, 255, 255)
}

local DEFAULT_ACCENT = COLORS.Accent

--=========================================================
-- SETTINGS
--=========================================================

local Settings = {

    -- AIM
    AimEnabled = false,
    AimLock = false,
    TargetType = "Players",

    AimMode = "Mid",
    AimPart = "Head",

    AimSmoothness = 25,
    AimFOV = 180,
    AimDistance = 1000,

    Wallcheck = false,

    -- FOV
    ShowFOV = false,
    FOVThickness = 1.5,
    FOVTransparency = 0.15,
    FOVFilled = false,
    FOVFillTransparency = 0.92,

    -- PLAYER ESP
    ESP = false,
    Names = false,
    Distance = false,

    Health = false,
    HealthStyle = "Bottom",

    Box = false,
    Corners = false,
    Chams = false,
    Tracers = false,
    Footsteps = false,

    -- SELF ESP
    SelfESP = false,
    SelfBox = false,
    SelfChams = false,

    -- NPC ESP
    NPCESP = false,
    NPCName = false,
    NPCDistance = false,

    NPCHealth = false,
    NPCHealthStyle = "Bottom",

    NPCBox = false,
    NPCCorners = false,
    NPCChams = false,
    NPCTracer = false,

    -- BUTTON
    ButtonEnabled = false,
    ButtonX = -80,
    ButtonY = -100,
    ButtonSize = 58,
    ButtonTransparency = 0.08,

    -- INFO BAR
    InfoBar = false,
    InfoFPS = true,
    InfoPing = true,
    InfoRegion = true,

    -- PERFORMANCE
    Performance = "Balanced",

    AimInterval = 0.016,
    ESPInterval = 0.08,
    NPCInterval = 0.25,
    ScanInterval = 0.5,
    FootstepInterval = 0.12,

    -- POTATO
    PotatoGraphics = false,

    -- UI
    MenuKey = Enum.KeyCode.RightShift,
    AccentColor = DEFAULT_ACCENT,
    Theme = "SoftWhite"
}

--=========================================================
-- PERFORMANCE
--=========================================================

local function ApplyPerformance()

    if Settings.Performance == "Low" then

        Settings.AimInterval = 0.033
        Settings.ESPInterval = 0.20
        Settings.NPCInterval = 0.75
        Settings.ScanInterval = 1

    elseif Settings.Performance == "Balanced" then

        Settings.AimInterval = 0.016
        Settings.ESPInterval = 0.08
        Settings.NPCInterval = 0.25
        Settings.ScanInterval = 0.5

    else

        Settings.AimInterval = 0.008
        Settings.ESPInterval = 0.033
        Settings.NPCInterval = 0.10
        Settings.ScanInterval = 0.25
    end
end

ApplyPerformance()

--=========================================================
-- STORAGE
--=========================================================

local PlayerESP = {}
local NPCESP = {}

local NPCs = {}
local NPCSet = {}

local Footsteps = {}
local LastPositions = {}

local LockedTarget = nil
local LockedNPC = nil

local Connections = {}
local Destroyed = false

local function Connect(signal, callback)

    local connection = signal:Connect(callback)

    table.insert(Connections, connection)

    return connection
end

--=========================================================
-- THEME
--=========================================================

WindUI:AddTheme({
    Name = "SoftWhite",

    Background = COLORS.Background,
    Dialog = Color3.fromRGB(244, 244, 246),
    Outline = COLORS.Border,

    Text = COLORS.Text,
    Placeholder = COLORS.SubText,

    Button = COLORS.PanelDark,
    ButtonHover = Color3.fromRGB(215, 215, 218),

    Input = COLORS.Panel,
    InputOutline = COLORS.Border,

    Hover = Color3.fromRGB(230, 230, 233),

    Accent = COLORS.Accent,
    Slider = COLORS.Accent,
    Toggle = COLORS.Accent,

    Tab = Color3.fromRGB(232, 232, 235),
    TabActive = Color3.fromRGB(210, 210, 214)
})

--=========================================================
-- WINDOW
--=========================================================

local Window = WindUI:CreateWindow({
    Title = "meowdlc",
    Icon = "crosshair",
    Author = "meow2tie",
    Folder = "meowdlc",

    Size = UDim2.fromOffset(640, 520),

    Transparent = false,
    Theme = Settings.Theme,

    Resizable = true,
    SideBarWidth = 180,

    HideSearchBar = true,
    ScrollBarEnabled = true,

    User = {
        Enabled = false
    }
})

--=========================================================
-- TABS
--=========================================================

local CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "crosshair"
})

local VisualTab = Window:Tab({
    Title = "Visuals",
    Icon = "eye"
})

local NPCTab = Window:Tab({
    Title = "NPC",
    Icon = "bot"
})

local ButtonTab = Window:Tab({
    Title = "Button",
    Icon = "circle"
})

local PerformanceTab = Window:Tab({
    Title = "Performance",
    Icon = "gauge"
})

local MiscTab = Window:Tab({
    Title = "Misc",
    Icon = "settings"
})

local UITab = Window:Tab({
    Title = "UI",
    Icon = "palette"
})

--=========================================================
-- HELPERS
--=========================================================

local function GetRoot(character)

    if not character then
        return nil
    end

    return character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("UpperTorso")
        or character:FindFirstChild("Torso")
end

local function GetHumanoid(character)

    if not character then
        return nil
    end

    return character:FindFirstChildOfClass("Humanoid")
end

local function IsAlive(player)

    local character = player.Character

    if not character then
        return false
    end

    local humanoid = GetHumanoid(character)

    return humanoid
        and humanoid.Health > 0
end

local function IsEnemy(player)

    if player == LocalPlayer then
        return false
    end

    if not IsAlive(player) then
        return false
    end

    if LocalPlayer.Team ~= nil
        and player.Team ~= nil then

        return LocalPlayer.Team ~= player.Team
    end

    return true
end

--=========================================================
-- AIM PART
--=========================================================

local function GetCharacterAimPart(character)

    if not character then
        return nil
    end

    if Settings.AimPart == "Head" then

        return character:FindFirstChild("Head")
            or character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")
            or character:FindFirstChild("HumanoidRootPart")

    elseif Settings.AimPart == "Torso" then

        return character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")
            or character:FindFirstChild("HumanoidRootPart")

    else

        return character:FindFirstChild("HumanoidRootPart")
            or character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")
    end
end

local function GetNPCAimPart(model)

    if not model then
        return nil
    end

    if Settings.AimPart == "Head" then

        return model:FindFirstChild("Head")

    elseif Settings.AimPart == "Torso" then

        return model:FindFirstChild("UpperTorso")
            or model:FindFirstChild("Torso")
            or model:FindFirstChild("HumanoidRootPart")

    else

        return model:FindFirstChild("HumanoidRootPart")
            or model:FindFirstChild("UpperTorso")
            or model:FindFirstChild("Torso")
    end
end

--=========================================================
-- WALL CHECK
--=========================================================

local RayParams = RaycastParams.new()

RayParams.FilterType = Enum.RaycastFilterType.Exclude
RayParams.IgnoreWater = true

local function CanSee(part)

    if not part then
        return false
    end

    if not Settings.Wallcheck then
        return true
    end

    Camera = Workspace.CurrentCamera

    if not Camera then
        return false
    end

    local ignore = {}

    if LocalPlayer.Character then
        table.insert(ignore, LocalPlayer.Character)
    end

    RayParams.FilterDescendantsInstances = ignore

    local origin = Camera.CFrame.Position
    local direction = part.Position - origin

    local result = Workspace:Raycast(
        origin,
        direction,
        RayParams
    )

    if not result then
        return true
    end

    return result.Instance:IsDescendantOf(
        part.Parent
    )
end

--=========================================================
-- PLAYER AIM
--=========================================================

local function GetClosestPlayerTarget()

    Camera = Workspace.CurrentCamera

    if not Camera then
        return nil
    end

    local viewport = Camera.ViewportSize

    local center = Vector2.new(
        viewport.X / 2,
        viewport.Y / 2
    )

    local closest = nil
    local closestDistance = Settings.AimFOV

    for _, player in ipairs(Players:GetPlayers()) do

        if IsEnemy(player) then

            local part = GetCharacterAimPart(
                player.Character
            )

            if part then

                local screen, visible =
                    Camera:WorldToViewportPoint(
                        part.Position
                    )

                if visible and screen.Z > 0 then

                    local screenPosition =
                        Vector2.new(
                            screen.X,
                            screen.Y
                        )

                    local fovDistance =
                        (
                            screenPosition
                            - center
                        ).Magnitude

                    local worldDistance =
                        (
                            Camera.CFrame.Position
                            - part.Position
                        ).Magnitude

                    if fovDistance <= closestDistance
                        and worldDistance <= Settings.AimDistance
                        and CanSee(part) then

                        closestDistance = fovDistance
                        closest = part
                    end
                end
            end
        end
    end

    return closest
end

--=========================================================
-- NPC SYSTEM
--=========================================================

local function IsPlayerCharacter(model)

    if not model then
        return false
    end

    return Players:GetPlayerFromCharacter(model) ~= nil
end

local function IsValidNPC(model)

    if not model or not model:IsA("Model") then
        return false
    end

    if IsPlayerCharacter(model) then
        return false
    end

    local humanoid =
        model:FindFirstChildOfClass("Humanoid")

    local root = GetRoot(model)

    return humanoid
        and humanoid.Health > 0
        and root ~= nil
end

local function AddNPC(model)

    if NPCSet[model] then
        return
    end

    if not IsValidNPC(model) then
        return
    end

    NPCSet[model] = true
    NPCs[#NPCs + 1] = model
end

local function RemoveNPC(model)

    if not NPCSet[model] then
        return
    end

    NPCSet[model] = nil

    for i = #NPCs, 1, -1 do

        if NPCs[i] == model then
            table.remove(NPCs, i)
            break
        end
    end

    if LockedNPC == model then
        LockedNPC = nil
    end
end

local function ScanNPCs()

    for _, object in ipairs(Workspace:GetDescendants()) do

        if object:IsA("Model") then
            AddNPC(object)
        end
    end

    for i = #NPCs, 1, -1 do

        local npc = NPCs[i]

        if not npc
            or not npc.Parent
            or not IsValidNPC(npc) then

            RemoveNPC(npc)
        end
    end
end

ScanNPCs()

Connect(
    Workspace.DescendantAdded,
    function(object)

        if object:IsA("Model") then

            task.defer(function()
                AddNPC(object)
            end)

        elseif object:IsA("Humanoid") then

            local model = object.Parent

            if model and model:IsA("Model") then

                task.defer(function()
                    AddNPC(model)
                end)
            end
        end
    end
)

Connect(
    Workspace.DescendantRemoving,
    function(object)

        if object:IsA("Model") then
            RemoveNPC(object)
        end
    end
)

--=========================================================
-- NPC AIM
--=========================================================

local function GetClosestNPCTarget()

    Camera = Workspace.CurrentCamera

    if not Camera then
        return nil
    end

    local viewport = Camera.ViewportSize

    local center = Vector2.new(
        viewport.X / 2,
        viewport.Y / 2
    )

    local closestNPC = nil
    local closestPart = nil
    local closestDistance = Settings.AimFOV

    for i = #NPCs, 1, -1 do

        local npc = NPCs[i]

        if not npc
            or not npc.Parent then

            RemoveNPC(npc)
            continue
        end

        if not IsValidNPC(npc) then
            continue
        end

        local part = GetNPCAimPart(npc)

        if not part then
            continue
        end

        local worldDistance =
            (
                Camera.CFrame.Position
                - part.Position
            ).Magnitude

        if worldDistance > Settings.AimDistance then
            continue
        end

        local screen, visible =
            Camera:WorldToViewportPoint(
                part.Position
            )

        if not visible or screen.Z <= 0 then
            continue
        end

        local screenPosition =
            Vector2.new(
                screen.X,
                screen.Y
            )

        local fovDistance =
            (
                screenPosition
                - center
            ).Magnitude

        if fovDistance > closestDistance then
            continue
        end

        if not CanSee(part) then
            continue
        end

        closestDistance = fovDistance
        closestNPC = npc
        closestPart = part
    end

    if closestNPC then

        return {
            NPC = closestNPC,
            Part = closestPart
        }
    end

    return nil
end

--=========================================================
-- AIM
--=========================================================

local function AimAt(part)

    if not part then
        return
    end

    Camera = Workspace.CurrentCamera

    if not Camera then
        return
    end

    local targetCFrame =
        CFrame.lookAt(
            Camera.CFrame.Position,
            part.Position
        )

    if Settings.AimMode == "Snap" then

        Camera.CFrame = targetCFrame
        return
    end

    local smooth =
        math.clamp(
            Settings.AimSmoothness / 100,
            0.01,
            1
        )

    if Settings.AimMode == "Mid" then
        smooth *= 0.45
    elseif Settings.AimMode == "Slow" then
        smooth *= 0.18
    end

    Camera.CFrame =
        Camera.CFrame:Lerp(
            targetCFrame,
            smooth
        )
end

local function UpdateAim()

    if not Settings.AimEnabled then

        LockedTarget = nil
        LockedNPC = nil

        return
    end

    if Settings.TargetType == "Players" then

        if Settings.AimLock then

            if LockedTarget then

                local character = LockedTarget.Parent
                local humanoid =
                    character
                    and GetHumanoid(character)

                if not character
                    or not humanoid
                    or humanoid.Health <= 0
                    or (
                        Settings.Wallcheck
                        and not CanSee(LockedTarget)
                    ) then

                    LockedTarget = nil
                end
            end

            if not LockedTarget then
                LockedTarget = GetClosestPlayerTarget()
            end

            if LockedTarget then
                AimAt(LockedTarget)
            end

        else

            LockedTarget = nil

            local target = GetClosestPlayerTarget()

            if target then
                AimAt(target)
            end
        end

    else

        if Settings.AimLock then

            if LockedNPC then

                if not IsValidNPC(LockedNPC) then

                    LockedNPC = nil

                else

                    local part =
                        GetNPCAimPart(LockedNPC)

                    if not part
                        or (
                            Settings.Wallcheck
                            and not CanSee(part)
                        ) then

                        LockedNPC = nil

                    else

                        AimAt(part)
                        return
                    end
                end
            end

            if not LockedNPC then

                local target =
                    GetClosestNPCTarget()

                if target then

                    LockedNPC = target.NPC
                    AimAt(target.Part)
                end
            end

        else

            LockedNPC = nil

            local target =
                GetClosestNPCTarget()

            if target then
                AimAt(target.Part)
            end
        end
    end
end

--=========================================================
-- FOV
--=========================================================

local FOVGui = Instance.new("ScreenGui")
FOVGui.Name = "meowdlc_FOV"
FOVGui.IgnoreGuiInset = true
FOVGui.ResetOnSpawn = false
FOVGui.DisplayOrder = 10
FOVGui.Parent = PlayerGui

local FOV = Instance.new("Frame")
FOV.AnchorPoint = Vector2.new(0.5, 0.5)
FOV.BackgroundTransparency = 1
FOV.BorderSizePixel = 0
FOV.Parent = FOVGui

local FOVCorner = Instance.new("UICorner")
FOVCorner.CornerRadius = UDim.new(1, 0)
FOVCorner.Parent = FOV

local FOVStroke = Instance.new("UIStroke")
FOVStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
FOVStroke.Parent = FOV

local function UpdateFOV()

    Camera = Workspace.CurrentCamera

    if not Camera then
        return
    end

    local viewport = Camera.ViewportSize

    FOV.Position =
        UDim2.fromOffset(
            viewport.X / 2,
            viewport.Y / 2
        )

    FOV.Size =
        UDim2.fromOffset(
            Settings.AimFOV * 2,
            Settings.AimFOV * 2
        )

    FOVStroke.Thickness =
        Settings.FOVThickness

    FOVStroke.Transparency =
        Settings.FOVTransparency

    FOVStroke.Color =
        Settings.AccentColor

    if Settings.FOVFilled then

        FOV.BackgroundColor3 =
            Settings.AccentColor

        FOV.BackgroundTransparency =
            Settings.FOVFillTransparency

    else

        FOV.BackgroundTransparency = 1
    end

    FOV.Visible = Settings.ShowFOV
end

--=========================================================
-- ESP GUI
--=========================================================

local ESPGui = Instance.new("ScreenGui")
ESPGui.Name = "meowdlc_ESP"
ESPGui.IgnoreGuiInset = true
ESPGui.ResetOnSpawn = false
ESPGui.DisplayOrder = 20
ESPGui.Parent = PlayerGui

--=========================================================
-- SCREEN BOX
--=========================================================

local function GetScreenBox(character)

    if not character then
        return nil
    end

    Camera = Workspace.CurrentCamera

    if not Camera then
        return nil
    end

    local cf, size = character:GetBoundingBox()
    local half = size / 2

    local points = {

        cf * Vector3.new(-half.X, -half.Y, -half.Z),
        cf * Vector3.new(-half.X, -half.Y, half.Z),
        cf * Vector3.new(-half.X, half.Y, -half.Z),
        cf * Vector3.new(-half.X, half.Y, half.Z),

        cf * Vector3.new(half.X, -half.Y, -half.Z),
        cf * Vector3.new(half.X, -half.Y, half.Z),
        cf * Vector3.new(half.X, half.Y, -half.Z),
        cf * Vector3.new(half.X, half.Y, half.Z)
    }

    local minX = math.huge
    local minY = math.huge
    local maxX = -math.huge
    local maxY = -math.huge

    local visible = false

    for _, point in ipairs(points) do

        local screen =
            Camera:WorldToViewportPoint(point)

        if screen.Z > 0 then

            visible = true

            minX = math.min(minX, screen.X)
            minY = math.min(minY, screen.Y)

            maxX = math.max(maxX, screen.X)
            maxY = math.max(maxY, screen.Y)
        end
    end

    if not visible then
        return nil
    end

    return
        minX,
        minY,
        maxX - minX,
        maxY - minY
end

--=========================================================
-- LINE
--=========================================================

local function NewLine(parent)

    local line = Instance.new("Frame")

    line.BorderSizePixel = 0
    line.BackgroundColor3 =
        Settings.AccentColor

    line.Parent = parent

    return line
end

--=========================================================
-- CORNERS
--=========================================================

local function UpdateCorners(c, x, y, w, h)

    local cw =
        math.clamp(
            w * 0.28,
            8,
            25
        )

    local ch =
        math.clamp(
            h * 0.20,
            8,
            25
        )

    c[1].Position = UDim2.fromOffset(x, y)
    c[1].Size = UDim2.fromOffset(cw, 2)

    c[2].Position = UDim2.fromOffset(x, y)
    c[2].Size = UDim2.fromOffset(2, ch)

    c[3].Position =
        UDim2.fromOffset(
            x + w - cw,
            y
        )

    c[3].Size =
        UDim2.fromOffset(
            cw,
            2
        )

    c[4].Position =
        UDim2.fromOffset(
            x + w - 2,
            y
        )

    c[4].Size =
        UDim2.fromOffset(
            2,
            ch
        )

    c[5].Position =
        UDim2.fromOffset(
            x,
            y + h - 2
        )

    c[5].Size =
        UDim2.fromOffset(
            cw,
            2
        )

    c[6].Position =
        UDim2.fromOffset(
            x,
            y + h - ch
        )

    c[6].Size =
        UDim2.fromOffset(
            2,
            ch
        )

    c[7].Position =
        UDim2.fromOffset(
            x + w - cw,
            y + h - 2
        )

    c[7].Size =
        UDim2.fromOffset(
            cw,
            2
        )

    c[8].Position =
        UDim2.fromOffset(
            x + w - 2,
            y + h - ch
        )

    c[8].Size =
        UDim2.fromOffset(
            2,
            ch
        )
end

--=========================================================
-- TRACER
--=========================================================

local function SetTracer(frame, startPos, endPos)

    local difference = endPos - startPos

    frame.Position =
        UDim2.fromOffset(
            (startPos.X + endPos.X) / 2,
            (startPos.Y + endPos.Y) / 2
        )

    frame.Size =
        UDim2.fromOffset(
            difference.Magnitude,
            1.5
        )

    frame.Rotation =
        math.deg(
            math.atan2(
                difference.Y,
                difference.X
            )
        )
end

--=========================================================
-- HEALTH BAR
--=========================================================

local function CreateHealthBar(parent)

    local holder = Instance.new("Frame")

    holder.BackgroundColor3 =
        Color3.fromRGB(25, 25, 28)

    holder.BackgroundTransparency = 0.25

    holder.BorderSizePixel = 0

    holder.Parent = parent

    local corner =
        Instance.new("UICorner")

    corner.CornerRadius =
        UDim.new(0, 2)

    corner.Parent = holder

    local fill =
        Instance.new("Frame")

    fill.AnchorPoint =
        Vector2.new(0, 1)

    fill.Position =
        UDim2.new(
            0,
            0,
            1,
            0
        )

    fill.Size =
        UDim2.new(
            1,
            0,
            1,
            0
        )

    fill.BorderSizePixel = 0

    fill.BackgroundColor3 =
        Color3.fromRGB(
            80,
            230,
            120
        )

    fill.Parent = holder

    local fillCorner =
        Instance.new("UICorner")

    fillCorner.CornerRadius =
        UDim.new(0, 2)

    fillCorner.Parent = fill

    return {
        Holder = holder,
        Fill = fill
    }
end

local function UpdateHealthBar(
    bar,
    health,
    maxHealth,
    x,
    y,
    w,
    h,
    style
)

    if not bar then
        return
    end

    local ratio =
        math.clamp(
            health / math.max(maxHealth, 1),
            0,
            1
        )

    if style == "Bottom" then

        bar.Holder.Position =
            UDim2.fromOffset(
                x,
                y + h + 3
            )

        bar.Holder.Size =
            UDim2.fromOffset(
                math.max(w, 8),
                4
            )

        bar.Fill.AnchorPoint =
            Vector2.new(
                0,
                0
            )

        bar.Fill.Position =
            UDim2.new(
                0,
                0,
                0,
                0
            )

        bar.Fill.Size =
            UDim2.new(
                ratio,
                0,
                1,
                0
            )

    else

        bar.Holder.Position =
            UDim2.fromOffset(
                x - 6,
                y
            )

        bar.Holder.Size =
            UDim2.fromOffset(
                4,
                math.max(h, 8)
            )

        bar.Fill.AnchorPoint =
            Vector2.new(
                0,
                1
            )

        bar.Fill.Position =
            UDim2.new(
                0,
                0,
                1,
                0
            )

        bar.Fill.Size =
            UDim2.new(
                1,
                0,
                ratio,
                0
            )
    end

    if ratio > 0.6 then

        bar.Fill.BackgroundColor3 =
            Color3.fromRGB(
                80,
                230,
                120
            )

    elseif ratio > 0.3 then

        bar.Fill.BackgroundColor3 =
            Color3.fromRGB(
                255,
                190,
                70
            )

    else

        bar.Fill.BackgroundColor3 =
            Color3.fromRGB(
                255,
                70,
                80
            )
    end

    bar.Holder.Visible = true
end

--=========================================================
-- PLAYER ESP DESTROY
--=========================================================

local function DestroyPlayerESP(player)

    local data = PlayerESP[player]

    if not data then
        return
    end

    if data.Gui then
        data.Gui:Destroy()
    end

    if data.Highlight then
        data.Highlight:Destroy()
    end

    PlayerESP[player] = nil
end

--=========================================================
-- PLAYER ESP CREATE
--=========================================================

local function CreatePlayerESP(player)

    DestroyPlayerESP(player)

    if player == LocalPlayer then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    local gui = Instance.new("Frame")

    gui.Name =
        "ESP_" .. player.Name

    gui.BackgroundTransparency = 1
    gui.BorderSizePixel = 0
    gui.Size = UDim2.fromScale(1, 1)
    gui.Parent = ESPGui

    local data = {
        Gui = gui
    }

    -- BOX

    local box = Instance.new("Frame")

    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = Settings.Box
    box.Parent = gui

    local boxStroke =
        Instance.new("UIStroke")

    boxStroke.Thickness = 1.25
    boxStroke.Color =
        Settings.AccentColor

    boxStroke.Parent = box

    data.Box = box
    data.BoxStroke = boxStroke

    -- CORNERS

    data.Corners = {}

    for i = 1, 8 do
        data.Corners[i] =
            NewLine(gui)
    end

    -- NAME

    local name =
        Instance.new("TextLabel")

    name.BackgroundTransparency = 1

    name.Font =
        Enum.Font.GothamBold

    name.TextSize = 10

    name.TextColor3 =
        COLORS.White

    name.TextStrokeTransparency =
        0.35

    name.TextXAlignment =
        Enum.TextXAlignment.Center

    name.Text =
        player.DisplayName ~= player.Name
        and (
            player.DisplayName
            .. "  @" .. player.Name
        )
        or player.Name

    name.Parent = gui

    data.Name = name

    -- DISTANCE

    local distance =
        Instance.new("TextLabel")

    distance.BackgroundTransparency = 1

    distance.Font =
        Enum.Font.GothamMedium

    distance.TextSize = 9

    distance.TextColor3 =
        Color3.fromRGB(
            205,
            205,
            210
        )

    distance.TextStrokeTransparency =
        0.4

    distance.Parent = gui

    data.Distance = distance

    -- TRACER

    local tracer =
        Instance.new("Frame")

    tracer.AnchorPoint =
        Vector2.new(
            0.5,
            0.5
        )

    tracer.BorderSizePixel = 0

    tracer.BackgroundColor3 =
        Settings.AccentColor

    tracer.Parent = gui

    data.Tracer = tracer

    -- HEALTH

    data.HealthBar =
        CreateHealthBar(gui)

    -- CHAMS

    local highlight =
        Instance.new("Highlight")

    highlight.Name =
        "meowdlc_Chams"

    highlight.Adornee =
        character

    highlight.DepthMode =
        Enum.HighlightDepthMode.AlwaysOnTop

    highlight.FillColor =
        Settings.AccentColor

    highlight.OutlineColor =
        COLORS.White

    highlight.FillTransparency =
        0.78

    highlight.OutlineTransparency =
        0.08

    highlight.Enabled =
        Settings.Chams

    highlight.Parent =
        ESPGui

    data.Highlight = highlight

    PlayerESP[player] = data
end

--=========================================================
-- PLAYER ESP UPDATE
--=========================================================

local function UpdatePlayerESP()

    Camera = Workspace.CurrentCamera

    if not Camera then
        return
    end

    for player, data in pairs(PlayerESP) do

        if not player.Parent then

            DestroyPlayerESP(player)
            continue
        end

        local character =
            player.Character

        if not character then

            data.Gui.Visible = false
            continue
        end

        local x, y, w, h =
            GetScreenBox(character)

        if not x then

            data.Gui.Visible = false
            continue
        end

        data.Gui.Visible = true

        -- BOX

        data.Box.Visible =
            Settings.Box

        data.Box.Position =
            UDim2.fromOffset(
                x,
                y
            )

        data.Box.Size =
            UDim2.fromOffset(
                w,
                h
            )

        data.BoxStroke.Color =
            Settings.AccentColor

        -- CORNERS

        for _, line in ipairs(data.Corners) do

            line.Visible =
                Settings.Corners

            line.BackgroundColor3 =
                Settings.AccentColor
        end

        if Settings.Corners then

            UpdateCorners(
                data.Corners,
                x,
                y,
                w,
                h
            )
        end

        -- NAME

        data.Name.Visible =
            Settings.Names

        data.Name.Position =
            UDim2.fromOffset(
                x,
                y - 17
            )

        data.Name.Size =
            UDim2.fromOffset(
                w,
                14
            )

        -- HEALTH

        if Settings.Health then

            local humanoid =
                GetHumanoid(character)

            if humanoid then

                UpdateHealthBar(
                    data.HealthBar,
                    humanoid.Health,
                    humanoid.MaxHealth,
                    x,
                    y,
                    w,
                    h,
                    Settings.HealthStyle
                )
            end

        else

            data.HealthBar.Holder.Visible = false
        end

        -- DISTANCE

        data.Distance.Visible =
            Settings.Distance

        if Settings.Distance then

            local root =
                GetRoot(character)

            if root then

                local distance =
                    (
                        Camera.CFrame.Position
                        - root.Position
                    ).Magnitude

                data.Distance.Text =
                    math.floor(distance)
                    .. " studs"

                local offset =
                    y + h + 10

                if Settings.Health
                    and Settings.HealthStyle == "Bottom" then

                    offset += 7
                end

                data.Distance.Position =
                    UDim2.fromOffset(
                        x,
                        offset
                    )

                data.Distance.Size =
                    UDim2.fromOffset(
                        w,
                        12
                    )
            end
        end

        -- TRACER

        data.Tracer.Visible =
            Settings.Tracers

        data.Tracer.BackgroundColor3 =
            Settings.AccentColor

        if Settings.Tracers then

            local viewport =
                Camera.ViewportSize

            local start =
                Vector2.new(
                    viewport.X / 2,
                    viewport.Y
                )

            local finish =
                Vector2.new(
                    x + w / 2,
                    y + h
                )

            SetTracer(
                data.Tracer,
                start,
                finish
            )
        end

        -- CHAMS

        data.Highlight.Enabled =
            Settings.Chams

        data.Highlight.Adornee =
            character

        data.Highlight.FillColor =
            Settings.AccentColor

        data.Highlight.OutlineColor =
            COLORS.White
    end
end

--=========================================================
-- PLAYER ESP REFRESH
--=========================================================

local function RefreshPlayerESP()

    for player in pairs(PlayerESP) do
        DestroyPlayerESP(player)
    end

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer then
            CreatePlayerESP(player)
        end
    end
end

--=========================================================
-- NPC ESP DESTROY
--=========================================================

local function DestroyNPCESP(npc)

    local data = NPCESP[npc]

    if not data then
        return
    end

    if data.Gui then
        data.Gui:Destroy()
    end

    if data.Highlight then
        data.Highlight:Destroy()
    end

    NPCESP[npc] = nil
end

--=========================================================
-- NPC ESP CREATE
--=========================================================

local function CreateNPCESP(npc)

    if NPCESP[npc]
        or not IsValidNPC(npc) then

        return
    end

    local gui =
        Instance.new("Frame")

    gui.Name =
        "NPCESP_" .. npc.Name

    gui.BackgroundTransparency = 1
    gui.BorderSizePixel = 0
    gui.Size = UDim2.fromScale(1, 1)
    gui.Parent = ESPGui

    local data = {
        Gui = gui
    }

    -- BOX

    local box =
        Instance.new("Frame")

    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Parent = gui

    local stroke =
        Instance.new("UIStroke")

    stroke.Thickness = 1.25
    stroke.Color =
        Settings.AccentColor

    stroke.Parent = box

    data.Box = box
    data.BoxStroke = stroke

    -- CORNERS

    data.Corners = {}

    for i = 1, 8 do
        data.Corners[i] =
            NewLine(gui)
    end

    -- NAME

    local name =
        Instance.new("TextLabel")

    name.BackgroundTransparency = 1

    name.Font =
        Enum.Font.GothamBold

    name.TextSize = 10

    name.TextColor3 =
        COLORS.White

    name.TextStrokeTransparency =
        0.35

    name.Parent = gui

    data.Name = name

    -- DISTANCE

    local distance =
        Instance.new("TextLabel")

    distance.BackgroundTransparency = 1

    distance.Font =
        Enum.Font.GothamMedium

    distance.TextSize = 9

    distance.TextColor3 =
        Color3.fromRGB(
            205,
            205,
            210
        )

    distance.TextStrokeTransparency =
        0.4

    distance.Parent = gui

    data.Distance = distance

    -- TRACER

    local tracer =
        Instance.new("Frame")

    tracer.AnchorPoint =
        Vector2.new(
            0.5,
            0.5
        )

    tracer.BorderSizePixel = 0

    tracer.BackgroundColor3 =
        Settings.AccentColor

    tracer.Parent = gui

    data.Tracer = tracer

    -- HEALTH

    data.HealthBar =
        CreateHealthBar(gui)

    -- CHAMS

    local highlight =
        Instance.new("Highlight")

    highlight.Name =
        "meowdlc_NPCChams"

    highlight.Adornee =
        npc

    highlight.DepthMode =
        Enum.HighlightDepthMode.AlwaysOnTop

    highlight.FillColor =
        Settings.AccentColor

    highlight.OutlineColor =
        COLORS.White

    highlight.FillTransparency =
        0.78

    highlight.OutlineTransparency =
        0.08

    highlight.Enabled =
        Settings.NPCChams

    highlight.Parent =
        ESPGui

    data.Highlight = highlight

    NPCESP[npc] = data
end

--=========================================================
-- NPC ESP UPDATE
--=========================================================

local function UpdateNPCESP()

    if not Settings.NPCESP then

        for npc in pairs(NPCESP) do
            DestroyNPCESP(npc)
        end

        return
    end

    Camera = Workspace.CurrentCamera

    if not Camera then
        return
    end

    for _, npc in ipairs(NPCs) do

        if npc
            and npc.Parent
            and IsValidNPC(npc) then

            CreateNPCESP(npc)
        end
    end

    for npc, data in pairs(NPCESP) do

        if not npc
            or not npc.Parent
            or not IsValidNPC(npc) then

            DestroyNPCESP(npc)
            continue
        end

        local x, y, w, h =
            GetScreenBox(npc)

        if not x then

            data.Gui.Visible = false
            continue
        end

        data.Gui.Visible = true

        -- BOX

        data.Box.Visible =
            Settings.NPCBox

        data.Box.Position =
            UDim2.fromOffset(
                x,
                y
            )

        data.Box.Size =
            UDim2.fromOffset(
                w,
                h
            )

        data.BoxStroke.Color =
            Settings.AccentColor

        -- CORNERS

        for _, line in ipairs(data.Corners) do

            line.Visible =
                Settings.NPCCorners

            line.BackgroundColor3 =
                Settings.AccentColor
        end

        if Settings.NPCCorners then

            UpdateCorners(
                data.Corners,
                x,
                y,
                w,
                h
            )
        end

        -- NAME

        data.Name.Visible =
            Settings.NPCName

        data.Name.Text =
            npc.Name

        data.Name.Position =
            UDim2.fromOffset(
                x,
                y - 17
            )

        data.Name.Size =
            UDim2.fromOffset(
                w,
                14
            )

        -- HEALTH

        local humanoid =
            GetHumanoid(npc)

        if Settings.NPCHealth
            and humanoid then

            UpdateHealthBar(
                data.HealthBar,
                humanoid.Health,
                humanoid.MaxHealth,
                x,
                y,
                w,
                h,
                Settings.NPCHealthStyle
            )

        else

            data.HealthBar.Holder.Visible =
                false
        end

        -- DISTANCE

        data.Distance.Visible =
            Settings.NPCDistance

        if Settings.NPCDistance then

            local root =
                GetRoot(npc)

            if root then

                local distance =
                    (
                        Camera.CFrame.Position
                        - root.Position
                    ).Magnitude

                data.Distance.Text =
                    math.floor(distance)
                    .. " studs"

                data.Distance.Position =
                    UDim2.fromOffset(
                        x,
                        y + h + (
                            Settings.NPCHealth
                            and Settings.NPCHealthStyle == "Bottom"
                            and 10
                            or 3
                        )
                    )

                data.Distance.Size =
                    UDim2.fromOffset(
                        w,
                        12
                    )
            end
        end

        -- TRACER

        data.Tracer.Visible =
            Settings.NPCTracer

        data.Tracer.BackgroundColor3 =
            Settings.AccentColor

        if Settings.NPCTracer then

            local viewport =
                Camera.ViewportSize

            local start =
                Vector2.new(
                    viewport.X / 2,
                    viewport.Y
                )

            local finish =
                Vector2.new(
                    x + w / 2,
                    y + h
                )

            SetTracer(
                data.Tracer,
                start,
                finish
            )
        end

        -- CHAMS

        data.Highlight.Enabled =
            Settings.NPCChams

        data.Highlight.FillColor =
            Settings.AccentColor

        data.Highlight.OutlineColor =
            COLORS.White
    end
end

--=========================================================
-- SELF ESP
--=========================================================

local SelfESPData = {}

local function DestroySelfESP()

    if SelfESPData.Gui then
        SelfESPData.Gui:Destroy()
    end

    if SelfESPData.Highlight then
        SelfESPData.Highlight:Destroy()
    end

    SelfESPData = {}
end

local function CreateSelfESP()

    DestroySelfESP()

    if not Settings.SelfESP then
        return
    end

    local character =
        LocalPlayer.Character

    if not character then
        return
    end

    local highlight =
        Instance.new("Highlight")

    highlight.Name =
        "meowdlc_SelfChams"

    highlight.Adornee =
        character

    highlight.DepthMode =
        Enum.HighlightDepthMode.Occluded

    highlight.FillColor =
        Settings.AccentColor

    highlight.OutlineColor =
        COLORS.White

    highlight.FillTransparency =
        0.88

    highlight.OutlineTransparency =
        0.05

    highlight.Enabled =
        Settings.SelfChams

    highlight.Parent =
        ESPGui

    SelfESPData.Highlight =
        highlight

    if Settings.SelfBox then

        local gui =
            Instance.new("Frame")

        gui.BackgroundTransparency = 1
        gui.Size =
            UDim2.fromScale(1, 1)

        gui.Parent =
            ESPGui

        SelfESPData.Gui = gui

        local box =
            Instance.new("Frame")

        box.BackgroundTransparency = 1
        box.BorderSizePixel = 0
        box.Parent = gui

        local stroke =
            Instance.new("UIStroke")

        stroke.Thickness = 1.25
        stroke.Color =
            Settings.AccentColor

        stroke.Parent = box

        SelfESPData.Box = box
        SelfESPData.Stroke = stroke
    end
end

local function UpdateSelfESP()

    if not Settings.SelfESP then
        return
    end

    local character =
        LocalPlayer.Character

    if not character then
        return
    end

    if SelfESPData.Highlight then

        SelfESPData.Highlight.Adornee =
            character

        SelfESPData.Highlight.Enabled =
            Settings.SelfChams

        SelfESPData.Highlight.FillColor =
            Settings.AccentColor

        SelfESPData.Highlight.OutlineColor =
            COLORS.White
    end

    if SelfESPData.Box then

        local x, y, w, h =
            GetScreenBox(character)

        if x then

            SelfESPData.Gui.Visible = true

            SelfESPData.Box.Position =
                UDim2.fromOffset(
                    x,
                    y
                )

            SelfESPData.Box.Size =
                UDim2.fromOffset(
                    w,
                    h
                )

            SelfESPData.Stroke.Color =
                Settings.AccentColor

        else

            SelfESPData.Gui.Visible =
                false
        end
    end
end

--=========================================================
-- FOOTSTEPS
--=========================================================

local function CreateFootstep(player)

    local character =
        player.Character

    local root =
        GetRoot(character)

    if not root then
        return
    end

    local params =
        RaycastParams.new()

    params.FilterType =
        Enum.RaycastFilterType.Exclude

    params.FilterDescendantsInstances = {
        character
    }

    local result =
        Workspace:Raycast(
            root.Position,
            Vector3.new(
                0,
                -10,
                0
            ),
            params
        )

    if not result then
        return
    end

    local part =
        Instance.new("Part")

    part.Anchored = true
    part.CanCollide = false
    part.CanTouch = false
    part.CanQuery = false

    part.Shape =
        Enum.PartType.Cylinder

    part.Material =
        Enum.Material.Neon

    part.Color =
        Settings.AccentColor

    part.Transparency = 0.2

    part.Size =
        Vector3.new(
            0.035,
            0.7,
            0.7
        )

    part.CFrame =
        CFrame.new(
            result.Position
            + Vector3.new(
                0,
                0.03,
                0
            )
        )
        * CFrame.Angles(
            0,
            0,
            math.rad(90)
        )

    part.Parent = Workspace

    Footsteps[#Footsteps + 1] = part

    task.delay(
        2,
        function()

            if part.Parent then
                part:Destroy()
            end
        end
    )
end

--=========================================================
-- POTATO
--=========================================================

local PotatoState = {
    Saved = false,
    Materials = {},
    CastShadows = {},
    Effects = {},
    GlobalShadows = nil,
    FogEnd = nil,
    Brightness = nil,
    EnvironmentDiffuseScale = nil,
    EnvironmentSpecularScale = nil
}

local function ApplyPotatoGraphics()

    if PotatoState.Saved then
        return
    end

    PotatoState.Saved = true

    PotatoState.GlobalShadows =
        Lighting.GlobalShadows

    PotatoState.FogEnd =
        Lighting.FogEnd

    PotatoState.Brightness =
        Lighting.Brightness

    PotatoState.EnvironmentDiffuseScale =
        Lighting.EnvironmentDiffuseScale

    PotatoState.EnvironmentSpecularScale =
        Lighting.EnvironmentSpecularScale

    Lighting.GlobalShadows = false
    Lighting.FogEnd = 100000
    Lighting.Brightness = 2

    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0

    for _, object in ipairs(
        Workspace:GetDescendants()
    ) do

        if object:IsA("BasePart") then

            PotatoState.Materials[object] =
                object.Material

            PotatoState.CastShadows[object] =
                object.CastShadow

            object.Material =
                Enum.Material.SmoothPlastic

            object.CastShadow = false

        elseif object:IsA("ParticleEmitter")
            or object:IsA("Trail")
            or object:IsA("Beam")
            or object:IsA("Smoke")
            or object:IsA("Fire")
            or object:IsA("Sparkles") then

            PotatoState.Effects[object] =
                object.Enabled

            object.Enabled = false
        end
    end
end

local function RestoreGraphics()

    if not PotatoState.Saved then
        return
    end

    Lighting.GlobalShadows =
        PotatoState.GlobalShadows

    Lighting.FogEnd =
        PotatoState.FogEnd

    Lighting.Brightness =
        PotatoState.Brightness

    Lighting.EnvironmentDiffuseScale =
        PotatoState.EnvironmentDiffuseScale

    Lighting.EnvironmentSpecularScale =
        PotatoState.EnvironmentSpecularScale

    for object, material in pairs(
        PotatoState.Materials
    ) do

        if object
            and object.Parent
            and object:IsA("BasePart") then

            object.Material =
                material

            object.CastShadow =
                PotatoState.CastShadows[object]
                ~= false
        end
    end

    for object, enabled in pairs(
        PotatoState.Effects
    ) do

        if object and object.Parent then
            object.Enabled = enabled
        end
    end

    PotatoState.Materials = {}
    PotatoState.CastShadows = {}
    PotatoState.Effects = {}
    PotatoState.Saved = false
end

--=========================================================
-- FLOATING BUTTON
--=========================================================

local ButtonGui =
    Instance.new("ScreenGui")

ButtonGui.Name =
    "meowdlc_FloatingButton"

ButtonGui.IgnoreGuiInset = true
ButtonGui.ResetOnSpawn = false
ButtonGui.DisplayOrder = 100
ButtonGui.ZIndexBehavior =
    Enum.ZIndexBehavior.Global

ButtonGui.Parent =
    PlayerGui

local AimButton =
    Instance.new("TextButton")

AimButton.AnchorPoint =
    Vector2.new(1, 1)

AimButton.BackgroundColor3 =
    COLORS.PanelDark

AimButton.BackgroundTransparency =
    Settings.ButtonTransparency

AimButton.BorderSizePixel = 0

AimButton.Text =
    "AIM"

AimButton.TextSize = 11

AimButton.TextColor3 =
    COLORS.Text

AimButton.Font =
    Enum.Font.GothamBold

AimButton.AutoButtonColor = false
AimButton.Active = true
AimButton.Visible = false

AimButton.Parent =
    ButtonGui

local ButtonCorner =
    Instance.new("UICorner")

ButtonCorner.CornerRadius =
    UDim.new(0, 15)

ButtonCorner.Parent =
    AimButton

local ButtonStroke =
    Instance.new("UIStroke")

ButtonStroke.Thickness = 1
ButtonStroke.Color = COLORS.Border
ButtonStroke.Transparency = 0.15
ButtonStroke.Parent = AimButton

local ButtonStatus =
    Instance.new("Frame")

ButtonStatus.AnchorPoint =
    Vector2.new(0.5, 0)

ButtonStatus.Position =
    UDim2.new(
        0.5,
        0,
        0,
        7
    )

ButtonStatus.Size =
    UDim2.fromOffset(
        6,
        6
    )

ButtonStatus.BorderSizePixel = 0
ButtonStatus.Parent = AimButton

local StatusCorner =
    Instance.new("UICorner")

StatusCorner.CornerRadius =
    UDim.new(1, 0)

StatusCorner.Parent =
    ButtonStatus

local function UpdateButton()

    AimButton.Size =
        UDim2.fromOffset(
            Settings.ButtonSize,
            Settings.ButtonSize
        )

    AimButton.Position =
        UDim2.new(
            1,
            Settings.ButtonX,
            1,
            Settings.ButtonY
        )

    AimButton.BackgroundTransparency =
        Settings.ButtonTransparency

    AimButton.Visible =
        Settings.ButtonEnabled

    if Settings.AimEnabled then

        AimButton.Text =
            "ON"

        AimButton.BackgroundColor3 =
            Settings.AccentColor

        AimButton.TextColor3 =
            COLORS.White

        ButtonStatus.BackgroundColor3 =
            COLORS.White

    else

        AimButton.Text =
            "AIM"

        -- OFF also follows current accent/theme
        AimButton.BackgroundColor3 =
            Settings.AccentColor:Lerp(
                COLORS.PanelDark,
                0.78
            )

        AimButton.TextColor3 =
            COLORS.Text

        ButtonStatus.BackgroundColor3 =
            Settings.AccentColor
    end

    ButtonStroke.Color =
        Settings.AccentColor
end

Connect(
    AimButton.MouseButton1Click,
    function()

        Settings.AimEnabled =
            not Settings.AimEnabled

        LockedTarget = nil
        LockedNPC = nil

        UpdateButton()
    end
)

--=========================================================
-- INFO ISLAND
--=========================================================

local InfoGui =
    Instance.new("ScreenGui")

InfoGui.Name =
    "meowdlc_InfoIsland"

InfoGui.IgnoreGuiInset = true
InfoGui.ResetOnSpawn = false
InfoGui.DisplayOrder = 90
InfoGui.Parent = PlayerGui

local InfoIsland =
    Instance.new("Frame")

InfoIsland.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

InfoIsland.Position =
    UDim2.new(
        0.5,
        0,
        0,
        10
    )

InfoIsland.Size =
    UDim2.fromOffset(
        250,
        32
    )

InfoIsland.BackgroundColor3 =
    COLORS.PanelDark

InfoIsland.BackgroundTransparency =
    0.08

InfoIsland.BorderSizePixel = 0

InfoIsland.Visible =
    false

InfoIsland.Parent =
    InfoGui

local IslandCorner =
    Instance.new("UICorner")

IslandCorner.CornerRadius =
    UDim.new(
        1,
        0
    )

IslandCorner.Parent =
    InfoIsland

local IslandStroke =
    Instance.new("UIStroke")

IslandStroke.Thickness = 1
IslandStroke.Transparency = 0.75
IslandStroke.Parent = InfoIsland

local InfoText =
    Instance.new("TextLabel")

InfoText.BackgroundTransparency = 1
InfoText.Size =
    UDim2.new(
        1,
        -24,
        1,
        0
    )

InfoText.Position =
    UDim2.fromOffset(
        12,
        0
    )

InfoText.Font =
    Enum.Font.GothamBold

InfoText.TextSize = 11

InfoText.TextColor3 =
    COLORS.Text

InfoText.TextXAlignment =
    Enum.TextXAlignment.Center

InfoText.TextYAlignment =
    Enum.TextYAlignment.Center

InfoText.Parent =
    InfoIsland

local function GetPing()

    local ok, result =
        pcall(function()

            return Stats.Network.ServerStatsItem[
                "Data Ping"
            ]:GetValueString()

        end)

    if ok and result then
        return result
    end

    return "-- ms"
end

local function GetFPS()

    local fps =
        math.floor(
            1 / math.max(
                RunService.RenderStepped:Wait(),
                1 / 240
            )
        )

    return math.clamp(
        fps,
        1,
        999
    )
end

local function UpdateInfoIsland()

    InfoIsland.Visible =
        Settings.InfoBar

    if not Settings.InfoBar then
        return
    end

    local items = {}

    if Settings.InfoFPS then
        table.insert(
            items,
            "FPS "
            .. tostring(
                math.floor(
                    1 / math.max(
                        _G.meowdlcLastDT or 0.016,
                        0.001
                    )
                )
            )
        )
    end

    if Settings.InfoPing then
        table.insert(
            items,
            "PING "
            .. GetPing()
        )
    end

    if Settings.InfoRegion then
        table.insert(
            items,
            "REGION"
        )
    end

    InfoText.Text =
        #items > 0
        and table.concat(
            items,
            "   •   "
        )
        or "MEOWDLC"
end

local function UpdateInfoTheme()

    local accent =
        Settings.AccentColor

    InfoIsland.BackgroundColor3 =
        accent:Lerp(
            COLORS.PanelDark,
            0.72
        )

    IslandStroke.Color =
        accent

    InfoText.TextColor3 =
        COLORS.Text
end

--=========================================================
-- COMBAT UI
--=========================================================

CombatTab:Section({
    Title = "AIM ASSIST"
})

CombatTab:Toggle({
    Title = "Aim Assist",
    Desc = "Enable aiming",
    Default = false,

    Callback = function(value)

        Settings.AimEnabled =
            value

        LockedTarget = nil
        LockedNPC = nil

        UpdateButton()
    end
})

CombatTab:Toggle({
    Title = "Aim Lock",
    Desc = "Keep selected target",
    Default = false,

    Callback = function(value)

        Settings.AimLock =
            value

        LockedTarget = nil
        LockedNPC = nil
    end
})

CombatTab:Dropdown({
    Title = "Target",
    Values = {
        "Players",
        "NPCs"
    },
    Value = "Players",

    Callback = function(value)

        Settings.TargetType =
            value

        LockedTarget = nil
        LockedNPC = nil
    end
})

CombatTab:Dropdown({
    Title = "Aim Mode",
    Values = {
        "Snap",
        "Mid",
        "Slow"
    },
    Value = "Mid",

    Callback = function(value)
        Settings.AimMode = value
    end
})

CombatTab:Dropdown({
    Title = "Aim Part",
    Values = {
        "Head",
        "Torso",
        "Root"
    },
    Value = "Head",

    Callback = function(value)

        Settings.AimPart = value

        LockedTarget = nil
        LockedNPC = nil
    end
})

CombatTab:Slider({
    Title = "Smoothness",

    Value = {
        Min = 1,
        Max = 100,
        Default = 25
    },

    Step = 1,

    Callback = function(value)
        Settings.AimSmoothness = value
    end
})

CombatTab:Slider({
    Title = "FOV",

    Value = {
        Min = 20,
        Max = 600,
        Default = 180
    },

    Step = 1,

    Callback = function(value)

        Settings.AimFOV =
            value

        UpdateFOV()
    end
})

CombatTab:Slider({
    Title = "Distance",

    Value = {
        Min = 100,
        Max = 3000,
        Default = 1000
    },

    Step = 10,

    Callback = function(value)
        Settings.AimDistance = value
    end
})

CombatTab:Toggle({
    Title = "Wall Check",
    Default = false,

    Callback = function(value)
        Settings.Wallcheck = value
    end
})

CombatTab:Section({
    Title = "FOV VISUALIZATION"
})

CombatTab:Toggle({
    Title = "Show FOV",
    Default = false,

    Callback = function(value)

        Settings.ShowFOV =
            value

        UpdateFOV()
    end
})

CombatTab:Slider({
    Title = "FOV Thickness",

    Value = {
        Min = 1,
        Max = 5,
        Default = 1.5
    },

    Step = 0.5,

    Callback = function(value)

        Settings.FOVThickness =
            value

        UpdateFOV()
    end
})

CombatTab:Slider({
    Title = "FOV Transparency",

    Value = {
        Min = 0,
        Max = 100,
        Default = 15
    },

    Step = 1,

    Callback = function(value)

        Settings.FOVTransparency =
            value / 100

        UpdateFOV()
    end
})

CombatTab:Toggle({
    Title = "Filled",
    Default = false,

    Callback = function(value)

        Settings.FOVFilled =
            value

        UpdateFOV()
    end
})

--=========================================================
-- PLAYER VISUALS
--=========================================================

VisualTab:Section({
    Title = "PLAYER ESP"
})

VisualTab:Toggle({
    Title = "Player ESP",
    Default = false,

    Callback = function(value)

        Settings.ESP = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "Names",
    Default = false,

    Callback = function(value)

        Settings.Names = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "Distance",
    Default = false,

    Callback = function(value)

        Settings.Distance = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "HP Bar",
    Default = false,

    Callback = function(value)

        Settings.Health = value
        RefreshPlayerESP()
    end
})

VisualTab:Dropdown({
    Title = "HP Bar Style",

    Values = {
        "Bottom",
        "Side"
    },

    Value = "Bottom",

    Callback = function(value)

        Settings.HealthStyle =
            value
    end
})

VisualTab:Toggle({
    Title = "2D Box",
    Default = false,

    Callback = function(value)

        Settings.Box = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "Corners",
    Default = false,

    Callback = function(value)

        Settings.Corners = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "Chams",
    Default = false,

    Callback = function(value)

        Settings.Chams = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "2D Tracers",
    Default = false,

    Callback = function(value)

        Settings.Tracers = value
        RefreshPlayerESP()
    end
})

VisualTab:Toggle({
    Title = "Footsteps",
    Default = false,

    Callback = function(value)
        Settings.Footsteps = value
    end
})

VisualTab:Section({
    Title = "SELF ESP"
})

VisualTab:Toggle({
    Title = "Self ESP",
    Default = false,

    Callback = function(value)

        Settings.SelfESP = value
        CreateSelfESP()
    end
})

VisualTab:Toggle({
    Title = "Self Box",
    Default = false,

    Callback = function(value)

        Settings.SelfBox = value
        CreateSelfESP()
    end
})

VisualTab:Toggle({
    Title = "Self Chams",
    Default = false,

    Callback = function(value)

        Settings.SelfChams = value
        CreateSelfESP()
    end
})

--=========================================================
-- NPC UI
--=========================================================

NPCTab:Section({
    Title = "NPC ESP / AIM"
})

NPCTab:Toggle({
    Title = "NPC Aim",
    Default = false,

    Callback = function(value)

        Settings.TargetType =
            "NPCs"

        Settings.AimEnabled =
            value

        LockedNPC = nil

        UpdateButton()
    end
})

NPCTab:Toggle({
    Title = "NPC ESP",
    Default = false,

    Callback = function(value)

        Settings.NPCESP =
            value

        UpdateNPCESP()
    end
})

NPCTab:Toggle({
    Title = "Name",
    Default = false,

    Callback = function(value)

        Settings.NPCName =
            value
    end
})

NPCTab:Toggle({
    Title = "Distance",
    Default = false,

    Callback = function(value)

        Settings.NPCDistance =
            value
    end
})

NPCTab:Toggle({
    Title = "NPC HP Bar",
    Default = false,

    Callback = function(value)

        Settings.NPCHealth =
            value
    end
})

NPCTab:Dropdown({
    Title = "NPC HP Bar Style",

    Values = {
        "Bottom",
        "Side"
    },

    Value = "Bottom",

    Callback = function(value)

        Settings.NPCHealthStyle =
            value
    end
})

NPCTab:Toggle({
    Title = "Box",
    Default = false,

    Callback = function(value)

        Settings.NPCBox =
            value
    end
})

NPCTab:Toggle({
    Title = "Corners",
    Default = false,

    Callback = function(value)

        Settings.NPCCorners =
            value
    end
})

NPCTab:Toggle({
    Title = "Chams",
    Default = false,

    Callback = function(value)

        Settings.NPCChams =
            value
    end
})

NPCTab:Toggle({
    Title = "Tracer",
    Default = false,

    Callback = function(value)

        Settings.NPCTracer =
            value
    end
})

NPCTab:Button({
    Title = "Rescan NPCs",

    Callback = function()

        ScanNPCs()
        UpdateNPCESP()
    end
})

--=========================================================
-- BUTTON UI
--=========================================================

ButtonTab:Section({
    Title = "FLOATING BUTTON"
})

ButtonTab:Toggle({
    Title = "Floating Button",
    Default = false,

    Callback = function(value)

        Settings.ButtonEnabled =
            value

        UpdateButton()
    end
})

ButtonTab:Slider({
    Title = "X Position",

    Value = {
        Min = -600,
        Max = 100,
        Default = -80
    },

    Step = 1,

    Callback = function(value)

        Settings.ButtonX =
            value

        UpdateButton()
    end
})

ButtonTab:Slider({
    Title = "Y Position",

    Value = {
        Min = -600,
        Max = 100,
        Default = -100
    },

    Step = 1,

    Callback = function(value)

        Settings.ButtonY =
            value

        UpdateButton()
    end
})

ButtonTab:Slider({
    Title = "Size",

    Value = {
        Min = 35,
        Max = 100,
        Default = 58
    },

    Step = 1,

    Callback = function(value)

        Settings.ButtonSize =
            value

        UpdateButton()
    end
})

ButtonTab:Slider({
    Title = "Transparency",

    Value = {
        Min = 0,
        Max = 90,
        Default = 8
    },

    Step = 1,

    Callback = function(value)

        Settings.ButtonTransparency =
            value / 100

        UpdateButton()
    end
})

--=========================================================
-- PERFORMANCE
--=========================================================

PerformanceTab:Section({
    Title = "PERFORMANCE PRESETS"
})

PerformanceTab:Dropdown({
    Title = "Performance Mode",

    Values = {
        "Low",
        "Balanced",
        "High"
    },

    Value = "Balanced",

    Callback = function(value)

        Settings.Performance =
            value

        ApplyPerformance()
    end
})

PerformanceTab:Paragraph({
    Title = "Low",
    Desc = "Minimal performance impact. ESP updates less frequently and visual effects are reduced."
})

PerformanceTab:Paragraph({
    Title = "Balanced",
    Desc = "Balanced FPS / visual quality."
})

PerformanceTab:Paragraph({
    Title = "High",
    Desc = "Most frequent ESP updates and highest visual responsiveness."
})

PerformanceTab:Toggle({
    Title = "Potato Graphics",
    Default = false,

    Callback = function(value)

        Settings.PotatoGraphics =
            value

        if value then
            ApplyPotatoGraphics()
        else
            RestoreGraphics()
        end
    end
})

--=========================================================
-- MISC
--=========================================================

MiscTab:Section({
    Title = "INFO BAR"
})

MiscTab:Toggle({
    Title = "Info Bar",
    Default = false,

    Callback = function(value)

        Settings.InfoBar =
            value

        UpdateInfoTheme()
        UpdateInfoIsland()
    end
})

MiscTab:Toggle({
    Title = "FPS",
    Default = true,

    Callback = function(value)

        Settings.InfoFPS =
            value
    end
})

MiscTab:Toggle({
    Title = "Ping",
    Default = true,

    Callback = function(value)

        Settings.InfoPing =
            value
    end
})

MiscTab:Toggle({
    Title = "Server Region",
    Default = true,

    Callback = function(value)

        Settings.InfoRegion =
            value
    end
})

MiscTab:Section({
    Title = "SYSTEM"
})

MiscTab:Button({
    Title = "Reset Character",

    Callback = function()

        local character =
            LocalPlayer.Character

        local humanoid =
            character
            and GetHumanoid(character)

        if humanoid then
            humanoid.Health = 0
        end
    end
})

MiscTab:Button({
    Title = "Rejoin",

    Callback = function()

        TeleportService:Teleport(
            game.PlaceId,
            LocalPlayer
        )
    end
})

MiscTab:Button({
    Title = "Reset Settings",

    Callback = function()

        Settings.AimEnabled = false
        Settings.AimLock = false
        Settings.TargetType = "Players"

        Settings.AimMode = "Mid"
        Settings.AimPart = "Head"

        Settings.AimSmoothness = 25
        Settings.AimFOV = 180
        Settings.AimDistance = 1000
        Settings.Wallcheck = false

        Settings.ESP = false
        Settings.Names = false
        Settings.Distance = false
        Settings.Health = false
        Settings.Box = false
        Settings.Corners = false
        Settings.Chams = false
        Settings.Tracers = false

        Settings.NPCESP = false
        Settings.NPCName = false
        Settings.NPCDistance = false
        Settings.NPCHealth = false
        Settings.NPCBox = false
        Settings.NPCCorners = false
        Settings.NPCChams = false
        Settings.NPCTracer = false

        Settings.SelfESP = false
        Settings.SelfBox = false
        Settings.SelfChams = false

        Settings.ButtonEnabled = false
        Settings.InfoBar = false

        LockedTarget = nil
        LockedNPC = nil

        DestroySelfESP()

        RefreshPlayerESP()
        UpdateNPCESP()
        UpdateButton()
        UpdateFOV()
        UpdateInfoIsland()

        WindUI:Notify({
            Title = "meowdlc",
            Content = "Settings reset",
            Duration = 2
        })
    end
})

MiscTab:Button({
    Title = "Unload",

    Callback = function()

        Destroyed = true

        for _, connection in ipairs(
            Connections
        ) do

            pcall(function()
                connection:Disconnect()
            end)
        end

        for player in pairs(PlayerESP) do
            DestroyPlayerESP(player)
        end

        for npc in pairs(NPCESP) do
            DestroyNPCESP(npc)
        end

        DestroySelfESP()

        for _, part in ipairs(Footsteps) do

            if part then

                pcall(function()
                    part:Destroy()
                end)
            end
        end

        if Settings.PotatoGraphics then
            RestoreGraphics()
        end

        if FOVGui then
            FOVGui:Destroy()
        end

        if ESPGui then
            ESPGui:Destroy()
        end

        if ButtonGui then
            ButtonGui:Destroy()
        end

        if InfoGui then
            InfoGui:Destroy()
        end

        pcall(function()
            Window:Destroy()
        end)
    end
})

--=========================================================
-- UI
--=========================================================

UITab:Section({
    Title = "MENU"
})

UITab:Keybind({
    Title = "Menu Keybind",
    Value = "RightShift",

    Callback = function(key)
        Settings.MenuKey = key
    end
})

UITab:Section({
    Title = "THEMES"
})

local themes = {}

pcall(function()

    for themeName in pairs(
        WindUI:GetThemes()
    ) do

        table.insert(
            themes,
            themeName
        )
    end
end)

if #themes == 0 then

    themes = {
        "SoftWhite",
        "Dark",
        "Light"
    }
end

table.sort(themes)

UITab:Dropdown({
    Title = "Theme Selector",

    Values = themes,

    Value = Settings.Theme,

    SearchBarEnabled = true,

    Callback = function(value)

        Settings.Theme =
            value

        pcall(function()
            WindUI:SetTheme(value)
        end)

        UpdateButton()
        UpdateInfoTheme()
        UpdateFOV()
    end
})

UITab:Colorpicker({
    Title = "Accent Color",

    Default =
        Settings.AccentColor,

    Transparency = 0,

    Callback = function(
        color,
        transparency
    )

        Settings.AccentColor =
            color

        COLORS.Accent =
            color

        COLORS.ESP =
            color

        UpdateButton()
        UpdateInfoTheme()
        UpdateFOV()

        for _, data in pairs(
            PlayerESP
        ) do

            if data.BoxStroke then
                data.BoxStroke.Color =
                    color
            end

            if data.Highlight then
                data.Highlight.FillColor =
                    color
            end

            if data.Highlight then
                data.Highlight.OutlineColor =
                    COLORS.White
            end

            if data.Tracer then
                data.Tracer.BackgroundColor3 =
                    color
            end

            if data.Corners then

                for _, line in ipairs(
                    data.Corners
                ) do

                    line.BackgroundColor3 =
                        color
                end
            end
        end

        for _, data in pairs(
            NPCESP
        ) do

            if data.BoxStroke then
                data.BoxStroke.Color =
                    color
            end

            if data.Highlight then
                data.Highlight.FillColor =
                    color
            end

            if data.Tracer then
                data.Tracer.BackgroundColor3 =
                    color
            end
        end

        if SelfESPData.Highlight then
            SelfESPData.Highlight.FillColor =
                color
        end

        if SelfESPData.Stroke then
            SelfESPData.Stroke.Color =
                color
        end
    end
})

UITab:Button({
    Title = "Reset Accent",

    Callback = function()

        Settings.AccentColor =
            DEFAULT_ACCENT

        UpdateButton()
        UpdateInfoTheme()
        UpdateFOV()
    end
})

--=========================================================
-- PLAYER EVENTS
--=========================================================

Connect(
    Players.PlayerAdded,
    function(player)

        Connect(
            player.CharacterAdded,
            function()

                task.wait(0.25)

                if Destroyed then
                    return
                end

                CreatePlayerESP(player)

                local root =
                    GetRoot(
                        player.Character
                    )

                if root then
                    LastPositions[player] =
                        root.Position
                end
            end
        )
    end
)

Connect(
    Players.PlayerRemoving,
    function(player)

        DestroyPlayerESP(player)

        LastPositions[player] =
            nil

        if LockedTarget
            and player.Character
            and LockedTarget:IsDescendantOf(
                player.Character
            ) then

            LockedTarget = nil
        end
    end
)

for _, player in ipairs(
    Players:GetPlayers()
) do

    if player ~= LocalPlayer then

        CreatePlayerESP(player)

        local root =
            GetRoot(
                player.Character
            )

        if root then

            LastPositions[player] =
                root.Position
        end

        Connect(
            player.CharacterAdded,
            function()

                task.wait(0.25)

                if not Destroyed then
                    CreatePlayerESP(player)
                end
            end
        )
    end
end

Connect(
    LocalPlayer.CharacterAdded,
    function()

        task.wait(0.25)

        if not Destroyed then
            CreateSelfESP()
        end
    end
)

Connect(
    LocalPlayer.CharacterRemoving,
    function()

        LockedTarget = nil
        LockedNPC = nil

        DestroySelfESP()
    end
)

--=========================================================
-- MAIN LOOP
--=========================================================

local aimAccumulator = 0
local espAccumulator = 0
local npcAccumulator = 0
local scanAccumulator = 0
local infoAccumulator = 0

Connect(
    RunService.RenderStepped,
    function(dt)

        if Destroyed then
            return
        end

        _G.meowdlcLastDT = dt

        Camera =
            Workspace.CurrentCamera

        if not Camera then
            return
        end

        -- FOV

        UpdateFOV()

        -- AIM

        aimAccumulator += dt

        if aimAccumulator >=
            Settings.AimInterval then

            aimAccumulator = 0

            UpdateAim()
        end

        -- PLAYER ESP

        espAccumulator += dt

        if espAccumulator >=
            Settings.ESPInterval then

            espAccumulator = 0

            if Settings.ESP
                or Settings.Names
                or Settings.Health
                or Settings.Distance
                or Settings.Box
                or Settings.Corners
                or Settings.Chams
                or Settings.Tracers then

                UpdatePlayerESP()
            end

            UpdateSelfESP()
        end

        -- NPC SCAN

        scanAccumulator += dt

        if scanAccumulator >=
            Settings.ScanInterval then

            scanAccumulator = 0

            ScanNPCs()
        end

        -- NPC ESP

        npcAccumulator += dt

        if npcAccumulator >=
            Settings.NPCInterval then

            npcAccumulator = 0

            UpdateNPCESP()
        end

        -- INFO

        infoAccumulator += dt

        if infoAccumulator >= 0.25 then

            infoAccumulator = 0

            UpdateInfoIsland()
        end

        -- BUTTON

        UpdateButton()
    end
)

--=========================================================
-- FOOTSTEP LOOP
--=========================================================

local footstepAccumulator = 0

Connect(
    RunService.Heartbeat,
    function(dt)

        if Destroyed
            or not Settings.Footsteps then

            return
        end

        footstepAccumulator += dt

        if footstepAccumulator <
            Settings.FootstepInterval then

            return
        end

        footstepAccumulator = 0

        for _, player in ipairs(
            Players:GetPlayers()
        ) do

            if IsEnemy(player) then

                local root =
                    GetRoot(
                        player.Character
                    )

                if root then

                    local old =
                        LastPositions[player]

                    if old then

                        local moved =
                            (
                                root.Position
                                - old
                            ).Magnitude

                        if moved > 0.35 then

                            CreateFootstep(
                                player
                            )
                        end
                    end

                    LastPositions[player] =
                        root.Position
                end
            end
        end
    end
)

--=========================================================
-- INITIALIZE
--=========================================================

UpdateFOV()
UpdateButton()
UpdateInfoTheme()

RefreshPlayerESP()
UpdateNPCESP()
CreateSelfESP()

WindUI:Notify({
    Title = "meowdlc",
    Content = "Universal AIM / ESP loaded",
    Duration = 3
})

print(
    "[meowdlc] Loaded successfully."
)

print(
    "[meowdlc] Created by meow2tie"
)
