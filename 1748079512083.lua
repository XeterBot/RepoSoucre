if not LPH_OBFUSCATED then
	LPH_JIT_MAX = (function(...) return ... end)
	LPH_NO_VIRTUALIZE = (function(...) return ... end)
	LPH_NO_UPVALUES = (function(...) return ... end)
end

spawn(function()
     for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
         if v.Name == "Death" or v.Name == "Spawn" then
             v:Destroy()
         end
     end
 end)

spawn(function()
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
            v.Enabled = false
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------
local Notif = {}

local CoreGUI = game:GetService("CoreGui")
local TS = game:GetService("TweenService")

local HIDEUI = get_hidden_gui or gethui
if syn and typeof(syn) == "table" and RenderWindow then syn.protect_gui = gethui; end
local function Hide_UI(gui)
    if HIDEUI then
        gui["Parent"] = HIDEUI()
    elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
        syn.protect_gui(gui)
        gui["Parent"] = CoreGUI
    elseif CoreGUI:FindFirstChild('RobloxGui') then
        gui["Parent"] = CoreGUI.RobloxGui
    else
        gui["Parent"] = CoreGUI
    end
end

local screen_gui = Instance.new("ScreenGui")
Hide_UI(screen_gui)

local frame = Instance.new("Frame")
frame.AnchorPoint = Vector2.new(0.5, 0.949999988079071)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.BackgroundTransparency = 1
frame.BorderColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.5, 0, 0.954999983, 0)
frame.Size = UDim2.new(0, 100, 0, 100)
frame.Visible = true
frame.Parent = screen_gui

local uilist_layout = Instance.new("UIListLayout")
uilist_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uilist_layout.SortOrder = Enum.SortOrder.LayoutOrder
uilist_layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
uilist_layout.Parent = frame
	
function Notif.New(text, timee)
    local frame_2 = Instance.new("Frame")
    frame_2.BackgroundColor3 = Color3.new(1, 1, 1)
    frame_2.BorderColor3 = Color3.new(0, 0, 0)
    frame_2.BorderSizePixel = 0
    frame_2.BackgroundTransparency = 1
    frame_2.Size = UDim2.new(0, 100, 0, 0)
    frame_2.Visible = true
    frame_2.Parent = frame
	
    -- Main Notification Frame
    local frame_3 = Instance.new("Frame")
    frame_3.AnchorPoint = Vector2.new(0.5, 1)
    frame_3.AutomaticSize = Enum.AutomaticSize.X
    frame_3.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
    frame_3.BackgroundTransparency = 0.20000000298023224
    frame_3.BorderColor3 = Color3.new(0, 0, 0)
    frame_3.Position = UDim2.new(0.5, 0, 1, 60)
    frame_3.Size = UDim2.new(0, 0, 0, 30)
    frame_3.Visible = true
    frame_3.Parent = frame_2

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 6)
    uicorner.Parent = frame_3

    local uipadding = Instance.new("UIPadding")
    uipadding.PaddingBottom = UDim.new(0, 3)
    uipadding.PaddingLeft = UDim.new(0, 3)
    uipadding.PaddingRight = UDim.new(0, 3)
    uipadding.PaddingTop = UDim.new(0, 3)
    uipadding.Parent = frame_3

    local uistroke = Instance.new("UIStroke")
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.Color = Color3.new(0.0313726, 0.0313726, 0.0313726)
    uistroke.Parent = frame_3

    local text_label = Instance.new("TextLabel")
    text_label.Font = Enum.Font.Gotham
    text_label.Text = text
    text_label.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
    text_label.TextSize = 14
    text_label.AutomaticSize = Enum.AutomaticSize.X
    text_label.BackgroundColor3 = Color3.new(1, 1, 1)
    text_label.BackgroundTransparency = 1
    text_label.BorderColor3 = Color3.new(0, 0, 0)
    text_label.BorderSizePixel = 0
    text_label.Size = UDim2.new(0, 0, 0, 24)
    text_label.Visible = true
    text_label.Parent = frame_3

    local uipadding_2 = Instance.new("UIPadding")
    uipadding_2.PaddingLeft = UDim.new(0, 5)
    uipadding_2.PaddingRight = UDim.new(0, 30)
    uipadding_2.Parent = text_label

    local text_button = Instance.new("TextButton")
    text_button.Font = Enum.Font.SourceSans
    text_button.Text = ""
    text_button.TextColor3 = Color3.new(0, 0, 0)
    text_button.TextSize = 14
    text_button.AnchorPoint = Vector2.new(1, 0.5)
    text_button.BackgroundColor3 = Color3.new(0, 0, 0)
    text_button.BackgroundTransparency = 1
    text_button.BorderColor3 = Color3.new(0, 0, 0)
    text_button.BorderSizePixel = 0
    text_button.Position = UDim2.new(1, 0, 0.5, 0)
    text_button.Size = UDim2.new(0, 24, 0, 24)
    text_button.Visible = true
    text_button.Parent = frame_3

    local uicorner_2 = Instance.new("UICorner")
    uicorner_2.CornerRadius = UDim.new(0, 5)
    uicorner_2.Parent = text_button

    local image_button = Instance.new("ImageButton")
    image_button.Image = "rbxassetid://3926305904"
    image_button.ImageColor3 = Color3.new(0.784314, 0.784314, 0.784314)
    image_button.ImageRectOffset = Vector2.new(924, 724)
    image_button.ImageRectSize = Vector2.new(36, 36)
    image_button.AnchorPoint = Vector2.new(0.5, 0.5)
    image_button.BackgroundTransparency = 1
    image_button.LayoutOrder = 3
    image_button.Position = UDim2.new(0.5, 0, 0.5, 0)
    image_button.Size = UDim2.new(0, 18, 0, 18)
    image_button.Visible = true
    image_button.ZIndex = 2
    image_button.Parent = text_button

    --Animations
    TS:Create(frame_3, TweenInfo.new(0.2, Enum.EasingStyle.Quint), { Position = UDim2.new(0.5, 0, 1, 0) }):Play()
    TS:Create(frame_2, TweenInfo.new(0.2, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 100, 0, 35) }):Play()

    -- Close Button
    local function close_notif()
        TS:Create(image_button, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TS:Create(text_button, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TS:Create(text_label, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        task.wait(.17)
        TS:Create(frame_3, TweenInfo.new(0.25, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TS:Create(uistroke, TweenInfo.new(0.24, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
        task.wait(.05)
        TS:Create(frame_2, TweenInfo.new(0.2, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 100, 0, 0) }):Play()
        task.wait(.2)
        frame_2:Destroy()
    end
    text_button.MouseEnter:Connect(function()
        TS:Create(text_button, TweenInfo.new(0.25, Enum.EasingStyle.Quint), { BackgroundTransparency = 0.8 }):Play()
        TS:Create(image_button, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
            { ImageColor3 = Color3.new(0.890196, 0.054902, 0.054902) }):Play()
    end)

    text_button.MouseLeave:Connect(function()
        TS:Create(text_button, TweenInfo.new(0.25, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TS:Create(image_button, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
            { ImageColor3 = Color3.new(0.784314, 0.784314, 0.784314) }):Play()
    end)

    text_button.MouseButton1Click:Connect(function()
        TS:Create(image_button, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TS:Create(text_button, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TS:Create(text_label, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
        task.wait(.17)
        TS:Create(frame_3, TweenInfo.new(0.25, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TS:Create(uistroke, TweenInfo.new(0.24, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
        task.wait(.05)
        TS:Create(frame_2, TweenInfo.new(0.2, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 100, 0, 0) }):Play()
        task.wait(.2)
        frame_2:Destroy()
    end)
    image_button.MouseButton1Click:Connect(close_notif)
    task.delay(tonumber(timee) and timee or 10, close_notif)
end

repeat wait(1) until game:IsLoaded()
local LocalPlayer = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}

pcall(function()
    userinfo = HttpService:JSONDecode(readfile(""));
end)
 
pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1,10))

local function SaveInfo()
    userinfo["pfp"] = pfp
    userinfo["user"] = user
    userinfo["tag"] = tag
    writefile("", HttpService:JSONEncode(userinfo));
end


local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
    
    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
        Position = pos
        })
        Tween:Play()
    end
    
    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position
    
                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
             end
        end
    )
    
    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )
    
    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local Update = {}
local pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"

function Update:Window(text,logo,keybind)
    local osfunc = {}
    local uihide = false
    local abc = false
    local currentpage = ""
    local keybind = keybind or Enum.KeyCode.RightControl
    local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

    local THUNDERZHUB = Instance.new("ScreenGui")
    THUNDERZHUB.Name = "THUNDERZHUB"
    THUNDERZHUB.Parent = game.CoreGui
    THUNDERZHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = THUNDERZHUB
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 540, 0, 340),"Out","Quad",0.4,true)

    local BtnStroke = Instance.new("UIStroke")

    BtnStroke.Name = "BtnStroke"
    BtnStroke.Parent = Main
    BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    BtnStroke.Color = Color3.fromRGB(255, 0, 0)
    BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
    BtnStroke.Thickness = 1
    BtnStroke.Transparency = 0
    BtnStroke.Enabled = true
    BtnStroke.Archivable = true

    local MCNR = Instance.new("UICorner")
    MCNR.Name = "MCNR"
    MCNR.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Top.Size = UDim2.new(0, 556, 0, 30)
    Top.BackgroundTransparency = 1.000
    local TCNR = Instance.new("UICorner")
    TCNR.Name = "TCNR"
    TCNR.Parent = Top
    TCNR.CornerRadius = UDim.new(0,5) 

    local ServerTime = Instance.new("TextLabel")
    ServerTime.Name = "ServerTime"
    ServerTime.Parent = Top
    ServerTime.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ServerTime.BackgroundTransparency = 1.000
    ServerTime.Position = UDim2.new(0.68, 0,0.074, 0)
    ServerTime.Size = UDim2.new(0, 225, 0, 25)
    ServerTime.Font = Enum.Font.GothamSemibold
    ServerTime.Text = ""
    ServerTime.TextSize = 11.000
    ServerTime.TextColor3 = Color3.fromRGB(255,255,255)
    ServerTime.TextXAlignment = Enum.TextXAlignment.Left

    function osfunc:Set(textadd)
        ServerTime.Text = textadd
    end

    local User = Instance.new("Frame")
    User.Name = "User"
    User.Parent = Top
    User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    User.BackgroundTransparency = 1.000
    User.Position = UDim2.new(0, 0,0, 25)
    User.Size = UDim2.new(0, 125, 0, 40)
    
    local UserText = Instance.new("TextLabel")
    UserText.Name = "UserText"
    UserText.Parent = User
    UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UserText.BackgroundTransparency = 1.000
    UserText.Position = UDim2.new(0.3,7 ,0, -18)
    UserText.TextColor3 = Color3.fromRGB(255, 255, 255)
    UserText.Size = UDim2.new(0, 80, 0, 25)
    UserText.Font = Enum.Font.GothamSemibold
    UserText.Text = "Hiếu Roblox"
    UserText.TextScaled = true
    UserText.TextSize = 18.000
    UserText.TextWrapped = true
    UserText.TextXAlignment = Enum.TextXAlignment.Left
    
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = UserText
    UITextSizeConstraint.MaxTextSize = 17
    
    local UserImage = Instance.new("ImageLabel")
    UserImage.Name = "UserImage"
    UserImage.Parent = User
    UserImage.BackgroundTransparency = 0
  --  UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    UserImage.Position = UDim2.new(0, 10, 0, -15)
    UserImage.Size = UDim2.new(0, 25, 0, 25)
    UserImage.Image = "rbxassetid://136478742457628"
    local UserImageCorner = Instance.new("UICorner")
    UserImageCorner.CornerRadius = UDim.new(0, 100)
    UserImageCorner.Name = "UserImageCorner"
    UserImageCorner.Parent = UserImage

    local Logo = Instance.new("ImageLabel")
	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, 20, 0, 30)
	Logo.Size = UDim2.new(0, 100, 0, 100)
	Logo.Image = "rbxassetid://99221772656923"
    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Tab.Position = UDim2.new(0, 5, 0, 135)
    Tab.Size = UDim2.new(0, 0, 0, 0)

    local TabCorner = Instance.new("UIListLayout")
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = Tab
    TabCorner.SortOrder = Enum.SortOrder.LayoutOrder
    TabCorner.Padding = UDim.new(0,15)
    local BtnStroke = Instance.new("UIStroke")
    local ScrollTab = Instance.new("ScrollingFrame")
    local Crner = Instance.new("UICorner")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.Size = UDim2.new(0, 133, 0, 203)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local PLL = Instance.new("UIListLayout")
    PLL.Name = "PLL"
    PLL.Parent = ScrollTab
    PLL.SortOrder = Enum.SortOrder.LayoutOrder
    PLL.Padding = UDim.new(0, 15)

    local PPD = Instance.new("UIPadding")
    PPD.Name = "PPD"
    PPD.Parent = ScrollTab
    PPD.PaddingLeft = UDim.new(0, 9)
    PPD.PaddingTop = UDim.new(0, 2)
    local BtnStroke = Instance.new("UIStroke")
    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Page.Position = UDim2.new(0.255426834, 0, 0.086000003, 0)
    Page.Size = UDim2.new(0, 410, 0, 308)

    local PCNR = Instance.new("UICorner")
    PCNR.Parent = Page
    PCNR.CornerRadius = UDim.new(0,3)

    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Parent = Page
    MainPage.ClipsDescendants = true
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BackgroundTransparency = 1.000
    MainPage.Size = UDim2.new(0, 410, 0, 308)

    local PageList = Instance.new("Folder")
    PageList.Name = "PageList"
    PageList.Parent = MainPage

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageList
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.FillDirection = Enum.FillDirection.Vertical
    UIPageLayout.Padding = UDim.new(0, 10)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false

    MakeDraggable(Top,Main)


    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightControl then
            if uihide == false then
                uihide = true
                Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
            else
                uihide = false
                Main:TweenSize(UDim2.new(0, 540, 0, 340),"Out","Quad",0.5,true)
            end
        end
    end)

    local uitab = {}

    function uitab:T(text,img)
        local BtnStroke = Instance.new("UIStroke")
        local bc = Instance.new("UICorner")
        local TabButton = Instance.new("TextButton")
        local title = Instance.new("TextLabel")
        local TUICorner = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        TabButton.Parent = ScrollTab
        TabButton.Name = text.."Server"
        TabButton.Text = ""
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 120, 0, 25)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 12.000
        TabButton.TextTransparency = 0.5

        Title.Parent = TabButton
        Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0, 25, 0, 0)
        Title.Size = UDim2.new(0, 100, 0, 25)
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = text
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 15.000
        Title.TextXAlignment = Enum.TextXAlignment.Left 

        local IDK = Instance.new("ImageLabel")
        IDK.Name = "LogoIDK"
        IDK.Parent = TabButton
        IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        IDK.BackgroundTransparency = 1.000
        IDK.Position = UDim2.new(0, 3, 0, 3)
        IDK.Size = UDim2.new(0, 20, 0, 20)
        IDK.Image = "rbxassetid://" .. tostring(img)
        TUICorner.CornerRadius = UDim.new(0, 3)
        TUICorner.Parent = TabButton

        BtnStroke.Name = "BtnStroke"
        BtnStroke.Parent = TabButton
        BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        BtnStroke.Color = Color3.fromRGB(255, 0, 0)
        BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
        BtnStroke.Thickness = 1
        BtnStroke.Transparency = 0
        BtnStroke.Enabled = true
        BtnStroke.Archivable = true 

        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = text.."_Page"
        MainFramePage.Parent = PageList
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 400, 0, 308)
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0

        local UIPadding = Instance.new("UIPadding")
        local UIListLayout = Instance.new("UIListLayout")

        UIPadding.Parent = MainFramePage
        UIPadding.PaddingLeft = UDim.new(0, 10)
        UIPadding.PaddingTop = UDim.new(0, 5)

        UIListLayout.Padding = UDim.new(0,15)
        UIListLayout.Parent = MainFramePage
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                    v,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0.5
                    }
                    ):Play()
                end
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {
                            TextTransparency = 0
                        }
                )   :Play()
            end

            for i,v in next, PageList:GetChildren() do
                currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
                if v.Name == currentpage then
                    UIPageLayout:JumpTo(v)
                end
            end
        end)

        if abc == false then
            for i,v in next, ScrollTab:GetChildren() do     
                if v:IsA("TextButton") then
                    TweenService:Create(
                    v,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0.5
                    }
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0
                    }
                ):Play()
            end
            UIPageLayout:JumpToIndex(1)
            abc = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
                ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
            end)
        end)

        function Update:AddNotification(textdesc)
        local NotificationHold = Instance.new("TextButton")
        local NotificationFrame = Instance.new("Frame")
        local OkayBtn = Instance.new("TextButton")
        local OkayBtnCorner = Instance.new("UICorner")
        local OkayBtnTitle = Instance.new("TextLabel")
        local NotificationTitle = Instance.new("TextLabel")
        local NotificationDesc = Instance.new("TextLabel")
        local NotifCorner = Instance.new("UICorner")
        local NotifHolderUIStroke = Instance.new("UIStroke")
        local Line = Instance.new("Frame")

        NotificationHold.Name = "NotificationHold"
        NotificationHold.Parent = Main
        NotificationHold.BackgroundColor3 = Color3.new(255, 0, 0)
        NotificationHold.BackgroundTransparency = 1
        NotificationHold.BorderSizePixel = 0
        NotificationHold.Size = UDim2.new(0, 589, 0, 378)
        NotificationHold.AutoButtonColor = false
        NotificationHold.Font = Enum.Font.SourceSans
        NotificationHold.Text = ""
        NotificationHold.TextColor3 = Color3.new(125,0,125)
        NotificationHold.TextSize = 13.000

        TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
        }):Play()
        wait(0.4)

        NotificationFrame.Name = "NotificationFrame"
        NotificationFrame.Parent = NotificationHold
        NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        NotificationFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        NotificationFrame.BorderColor3 = Color3.new(125,0,125)
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.Transparency = 0
        NotificationFrame.ClipsDescendants = true
        NotificationFrame.Position = UDim2.new(0, 295, 0, 190)
        NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

        NotificationFrame:TweenSize(UDim2.new(0, 400, 0, 250), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

        NotifCorner.Name = "NotifCorner"
        NotifCorner.Parent = NotificationFrame
        NotifCorner.CornerRadius = UDim.new(0, 5)

        NotifHolderUIStroke.Name = "NotifHolderUIStroke"
        NotifHolderUIStroke.Parent = NotificationFrame
        NotifHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        NotifHolderUIStroke.Color = Color3.new(125,0,125)
        NotifHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
        NotifHolderUIStroke.Thickness = 2
        NotifHolderUIStroke.Transparency = 0
        NotifHolderUIStroke.Enabled = true
        NotifHolderUIStroke.Archivable = true

        OkayBtn.Name = "OkayBtn"
        OkayBtn.Parent = NotificationFrame
        OkayBtn.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
        OkayBtn.BorderSizePixel = 2
        OkayBtn.BorderColor3 = Color3.new(125,0,125)
        OkayBtn.Position = UDim2.new(0, 125, 0, 190)
        OkayBtn.Size = UDim2.new(0, 150, 0, 30)
        OkayBtn.AutoButtonColor = true
        OkayBtn.Font = Enum.Font.SourceSans
        OkayBtn.Text = ""
        OkayBtn.TextColor3 = Color3.new(125,0,125)
        OkayBtn.TextSize = 13.000

        OkayBtnCorner.CornerRadius = UDim.new(0, 5)
        OkayBtnCorner.Name = "OkayBtnCorner"
        OkayBtnCorner.Parent = OkayBtn

        OkayBtnTitle.Name = "OkayBtnTitle"
        OkayBtnTitle.Parent = OkayBtn
        OkayBtnTitle.BackgroundColor3 = Color3.new(125,0,125)
        OkayBtnTitle.BackgroundTransparency = 1.000
        OkayBtnTitle.Size = UDim2.new(0, 150, 0, 30)
        OkayBtnTitle.Text = "OK"
        OkayBtnTitle.Font = Enum.Font.GothamSemibold
        OkayBtnTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
        OkayBtnTitle.TextSize = 22.000

        NotificationTitle.Name = "NotificationTitle"
        NotificationTitle.Parent = NotificationFrame
        NotificationTitle.BackgroundColor3 = Color3.new(125,0,125)
        NotificationTitle.BackgroundTransparency = 1.000
        NotificationTitle.Position = UDim2.new(0, 0, 0, 10)
        NotificationTitle.Size = UDim2.new(0, 400, 0, 25)
        NotificationTitle.ZIndex = 3
        NotificationTitle.Font = Enum.Font.GothamSemibold
        NotificationTitle.Text = "Notification"
        NotificationTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        NotificationTitle.TextSize = 22.000

        Line.Name = "Line"
        Line.Parent = NotificationFrame
        Line.BackgroundColor3 = Color3.new(125,0,125)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 10, 0, 40)
        Line.Size = UDim2.new(0, 380, 0, 1)

        NotificationDesc.Name = "NotificationDesc"
        NotificationDesc.Parent = NotificationFrame
        NotificationDesc.BackgroundColor3 = _G.SectionColor
        NotificationDesc.BackgroundTransparency = 1.000
        NotificationDesc.Position = UDim2.new(0, 10, 0, 80)
        NotificationDesc.Size = UDim2.new(0, 380, 0, 200)
        NotificationDesc.Font = Enum.Font.GothamSemibold
        NotificationDesc.Text = textdesc
        NotificationDesc.TextScaled = false
        NotificationDesc.TextColor3 = Color3.new(125,0,125)
        NotificationDesc.TextSize = 16.000
        NotificationDesc.TextWrapped = true
        NotificationDesc.TextXAlignment = Enum.TextXAlignment.Center
        NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

        OkayBtn.MouseEnter:Connect(function()
            TweenService:Create(OkayBtn, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(34,34,34)}):Play()
        end)

        OkayBtn.MouseLeave:Connect(function()
            TweenService:Create(OkayBtn, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
        end)

        OkayBtn.MouseButton1Click:Connect(function()
            NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

            wait(0.4)
        
            TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
            }):Play()
        
            wait(.3)
        
            NotificationHold:Destroy()
        end)
    end

    local main = {}
    function main:Button(text, callback)
        if logo == nil then
            logo = "15009422255"
        end
        local Button = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local TextBtn = Instance.new("TextButton")
        local ImageButton = Instance.new("ImageLabel")
        local UICorner_2 = Instance.new("UICorner")
        local Space = Instance.new("TextLabel")
        local Black = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")

        Button.Name = "Button"
        Button.Parent = MainFramePage
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Button.Size = UDim2.new(0, 387, 0, 31)

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Button

        TextBtn.Name = "TextBtn"
        TextBtn.Parent = Button
        TextBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        TextBtn.Position = UDim2.new(0, 1, 0, 1)
        TextBtn.Size = UDim2.new(0, 385, 0, 29)
        TextBtn.AutoButtonColor = false
        TextBtn.Font = Enum.Font.GothamSemibold
        TextBtn.Text = text
        TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
        TextBtn.TextSize = 15.000

        ImageButton.Name = "ImageButton"
        ImageButton.Parent = Button
        ImageButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.BorderSizePixel = 0
        ImageButton.Position = UDim2.new(0, 350, 0, 6)
        ImageButton.Size = UDim2.new(0, 20, 0, 20)
        ImageButton.Image = "rbxassetid://99221772656923"
        ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)

        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = TextBtn

        Space.Name = "Space"
        Space.Parent = Button
        Space.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Space.BackgroundTransparency = 1.000
        Space.Position = UDim2.new(0, 330, 0, 0)
        Space.Size = UDim2.new(0, 15, 0, 30)
        Space.Font = Enum.Font.GothamSemibold
        Space.Text = "|"
        Space.TextSize = 15.000
        Space.TextColor3 = Color3.fromRGB(255, 255, 255)
        Space.TextXAlignment = Enum.TextXAlignment.Right

        Black.Name = "Black"
        Black.Parent = Button
        Black.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Black.BackgroundTransparency = 1.000
        Black.BorderSizePixel = 0
        Black.Position = UDim2.new(0, 1, 0, 1)
        Black.Size = UDim2.new(0, 385, 0, 29)

        UICorner_3.CornerRadius = UDim.new(0, 5)
        UICorner_3.Parent = Black

        TextBtn.MouseEnter:Connect(
            function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end
        )
        TextBtn.MouseLeave:Connect(
            function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end
        )
        TextBtn.MouseButton1Click:Connect(
            function()
                TextBtn.TextSize = 0
                TweenService:Create(
                    TextBtn,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextSize = 15}
                ):Play()
                callback()
            end
        )
    end

    function main:Toggle(TogInfo ,default, callback)
        local toggle = false
        if logo == nil then
            logo = "15009422255"
        end
        local CheckFrame = Instance.new("Frame")
        local CheckFrame2 = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        local UIListLayout = Instance.new("UIListLayout")
        local UICorner = Instance.new("UICorner")
        local ImageLabel = Instance.new("ImageLabel")
        local Space = Instance.new("TextLabel")
        local Title = Instance.new("TextLabel")
        local ImageButton = Instance.new("ImageButton")

        -- Prop --
        CheckFrame.Name = TogInfo or "CheckFrame"
        CheckFrame.Parent = MainFramePage
        CheckFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        CheckFrame.BackgroundTransparency = 1.000
        CheckFrame.BorderSizePixel = 0
        CheckFrame.Size = UDim2.new(0, 387, 0, 31)

        CheckFrame2.Name = "CheckFrame2"
        CheckFrame2.Parent = CheckFrame
        CheckFrame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        CheckFrame2.BorderSizePixel = 0
        CheckFrame2.Position = UDim2.new(0, 3, 0, 0)
        CheckFrame2.Size = UDim2.new(0, 381, 0, 30)

        UIStroke.Name = "UIStroke"
        UIStroke.Parent = CheckFrame2
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(255, 0, 0)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 1
        UIStroke.Transparency = 0
        UIStroke.Enabled = true
        UIStroke.Archivable = true

        UICorner.Parent = CheckFrame2
        UICorner.CornerRadius = UDim.new(0, 3)

        ImageLabel.Name = "ImageLabel"
        ImageLabel.Parent = CheckFrame2
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0, 5, 0, 6)
        ImageLabel.Size = UDim2.new(0, 20, 0, 20)
        ImageLabel.Image = "rbxassetid://99221772656923"
        ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)

        Space.Name = "Space"
        Space.Parent = CheckFrame2
        Space.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Space.BackgroundTransparency = 1.000
        Space.Position = UDim2.new(0, 30, 0, 0)
        Space.Size = UDim2.new(0, 15, 0, 30)
        Space.Font = Enum.Font.GothamSemibold
        Space.Text = "|"
        Space.TextSize = 15.000
        Space.TextColor3 = Color3.fromRGB(255, 255, 255)
        Space.TextXAlignment = Enum.TextXAlignment.Center

        Title.Name = "Title"
        Title.Parent = CheckFrame2
        Title.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0, 50, 0, 0)
        Title.Size = UDim2.new(0, 280, 0, 30)
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = TogInfo or "checkBox Title"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 15.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        ImageButton.Name = "ImageButton"
        ImageButton.Parent = CheckFrame2
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.Position = UDim2.new(0, 352, 0, 4)
        ImageButton.Size = UDim2.new(0, 23, 0, 23)
        ImageButton.ZIndex = 2
        ImageButton.Image = "rbxassetid://3926311105"
        ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.ImageRectOffset = Vector2.new(940, 784)
        ImageButton.ImageRectSize = Vector2.new(48, 48)

        -- Toggle Script --

        if default == true then
            ImageButton.ImageRectOffset = Vector2.new(4, 836)
            game.TweenService:Create(
                ImageButton,
                TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)}
            ):Play()
            toggle = not toggle
            pcall(callback, toggle)
        end

        ImageButton.MouseButton1Click:Connect(
            function()
                if toggle == false then
                    game.TweenService:Create(
                        ImageButton,
                        TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                        {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                    ):Play()
                    ImageButton.ImageRectOffset = Vector2.new(4, 836)
                else
                    game.TweenService:Create(
                        ImageButton,
                        TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                        {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                    ):Play()
                    ImageButton.ImageRectOffset = Vector2.new(940, 784)
                end
                toggle = not toggle
                pcall(callback, toggle)
            end
        )
    end

    function main:Dropdown(text,option,callback)
        local isdropping = false
        local Dropdown = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local DropTitle = Instance.new("TextLabel")
        local DropScroll = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local DropButton = Instance.new("TextButton")
        local DropImage = Instance.new("ImageLabel")
        local UIStroke = Instance.new("UIStroke")

        Dropdown.Name = "Dropdown"
        Dropdown.Parent = MainFramePage
        Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Dropdown.ClipsDescendants = true
        Dropdown.Size = UDim2.new(0, 387, 0, 31)

        UIStroke.Name = "UIStroke"
        UIStroke.Parent = Dropdown
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(255, 0, 0)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 1
        UIStroke.Transparency = 0
        UIStroke.Enabled = true
        UIStroke.Archivable = true

        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = Dropdown

        DropTitle.Name = "DropTitle"
        DropTitle.Parent = Dropdown
        DropTitle.BackgroundColor3 = Color3.fromRGB(255,255,255)
        DropTitle.BackgroundTransparency = 1.000
        DropTitle.Size = UDim2.new(0, 385, 0, 31)
        DropTitle.Font = Enum.Font.GothamSemibold
        DropTitle.Text = text.. " : "
        DropTitle.TextColor3 = Color3.fromRGB(255,255,255)
        DropTitle.TextSize = 15.000

        DropScroll.Name = "DropScroll"
        DropScroll.Parent = DropTitle
        DropScroll.Active = true
        DropScroll.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        DropScroll.BackgroundTransparency = 1.000
        DropScroll.BorderSizePixel = 0
        DropScroll.Position = UDim2.new(0, 0, 0, 31)
        DropScroll.Size = UDim2.new(0, 385, 0, 100)
        DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        DropScroll.ScrollBarThickness = 3

        UIListLayout.Parent = DropScroll
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        UIPadding.Parent = DropScroll
        UIPadding.PaddingLeft = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)

        DropButton.Name = "DropButton"
        DropButton.Parent = Dropdown
        DropButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        DropButton.BackgroundTransparency = 1.000
        DropButton.Size = UDim2.new(0, 385, 0, 31)
        DropButton.Font = Enum.Font.SourceSans
        DropButton.Text = ""
        DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        DropButton.TextSize = 14.000

        DropImage.Name = "DropImage"
        DropImage.Parent = Dropdown
        DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropImage.BackgroundTransparency = 1.000
        DropImage.Position = UDim2.new(0, 350, 0, 6)
        DropImage.Rotation = 180.000
        DropImage.Size = UDim2.new(0, 20, 0, 20)
        DropImage.Image = "rbxassetid://6031090990"

        for i,v in next,option do
            local Item = Instance.new("TextButton")

            Item.Name = "Item"
            Item.Parent = DropScroll
            Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Item.BackgroundTransparency = 1.000
            Item.Size = UDim2.new(0, 385, 0, 26)
            Item.Font = Enum.Font.GothamSemibold
            Item.Text = tostring(v)
            Item.TextColor3 = Color3.fromRGB(255,255,255)
            Item.TextSize = 13.000
            Item.TextTransparency = 0.500

            Item.MouseEnter:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0
                    }
                ):Play()
            end)

            Item.MouseLeave:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0.5
                    }
                ):Play()
            end)

            Item.MouseButton1Click:Connect(function()
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Rotation = 180
                    }
                ):Play()
                callback(Item.Text)
                DropTitle.Text = text.." : "..Item.Text
            end)
        end

        DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

        DropButton.MouseButton1Click:Connect(function()
            if isdropping == false then
                isdropping = true
                Dropdown:TweenSize(UDim2.new(0,385,0,131),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Rotation = 0
                    }
                ):Play()
            else
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Rotation = 180
                    }
                ):Play()
            end
        end)

        local dropfunc = {}
        function dropfunc:Add(t)
            local Item = Instance.new("TextButton")
            Item.Name = "Item"
            Item.Parent = DropScroll
            Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Item.BackgroundTransparency = 1.000
            Item.Size = UDim2.new(0, 385, 0, 26)
            Item.Font = Enum.Font.GothamSemibold
            Item.Text = tostring(t)
            Item.TextColor3 = Color3.fromRGB(255,255,255)
            Item.TextSize = 13.000
            Item.TextTransparency = 0.500

            Item.MouseEnter:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                     TextTransparency = 0
                    }
                ):Play()
            end)

            Item.MouseLeave:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                     TextTransparency = 0.5
                    }
                ):Play()
            end)
        
            Item.MouseButton1Click:Connect(function()
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,387,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                     Rotation = 180
                    }
                ):Play()
                callback(Item.Text)
                DropTitle.Text = text.." : "..Item.Text
            end)
        end
        function dropfunc:Clear()
            DropTitle.Text = tostring(text).." : "
            isdropping = false
            Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
            TweenService:Create(
                DropImage,
                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {
                 Rotation = 180
                }
            ):Play()
            for i,v in next, DropScroll:GetChildren() do
                if v:IsA("TextButton") then
                    v:Destroy()
                end
            end
        end
        return dropfunc
    end
  
    function main:AddSlider(text, min, max, start, callback)
        local sliderfunc = {}
        local SliderFrame = Instance.new("Frame")
        local SliderFrame_2 = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        local UICorner = Instance.new("UICorner")
        local ImageLabel = Instance.new("ImageLabel")
        local Space = Instance.new("TextLabel")
        local Title = Instance.new("TextLabel")
        local SliderInput = Instance.new("Frame")
        local SliderButton = Instance.new("Frame")
        local SliderCount = Instance.new("Frame")
        local SliderCorner = Instance.new("UICorner")
        local SliderCorner2 = Instance.new("UICorner")
        local BoxFrame = Instance.new("Frame")
        local SliderBox = Instance.new("TextBox")
        local SliderStroke = Instance.new("UIStroke")
        local Title_2 = Instance.new("TextButton")
        local UICorner_2 = Instance.new("UICorner")
        local UICorner_3 = Instance.new("UICorner")
        
        -- Prop --
        SliderFrame.Name = slidertitle or "SliderFrame"
        SliderFrame.Parent = MainFramePage
        SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        SliderFrame.BackgroundTransparency = 1.000
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Size = UDim2.new(0, 387, 0, 60)
    
        SliderFrame_2.Name = "SliderFrame_2"
        SliderFrame_2.Parent = SliderFrame
        SliderFrame_2.BackgroundColor3 = Color3.fromRGB(0,0,0)
        SliderFrame_2.BackgroundTransparency = 0
        SliderFrame_2.BorderSizePixel = 0
        SliderFrame_2.Position = UDim2.new(0, 1, 0, 1)
        SliderFrame_2.Size = UDim2.new(0, 387, 0, 60)
        
        UIStroke.Name = "UIStroke"
        UIStroke.Parent = SliderFrame_2
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(255, 0, 0)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 1
        UIStroke.Transparency = 0
        UIStroke.Enabled = true
        UIStroke.Archivable = true
        
        UICorner.Parent = SliderFrame_2
        UICorner.CornerRadius = UDim.new(0, 3)
        
        ImageLabel.Name = "ImageLabel"
        ImageLabel.Parent = SliderFrame_2
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0, 7.5, 0, 7.5)
        ImageLabel.Size = UDim2.new(0, 30, 0, 30)
        ImageLabel.Image = "rbxassetid://136478742457628"
            
        Title.Parent = SliderFrame_2
        Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0, 45, 0, 5)
        Title.Size = UDim2.new(0, 280, 0, 30)
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = "|  "..text
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 15.000
        Title.TextXAlignment = Enum.TextXAlignment.Left
                
        SliderInput.Name = "SliderInput"
        SliderInput.Parent = SliderFrame_2
        SliderInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderInput.BackgroundTransparency = 0.7
        SliderInput.BorderSizePixel = 0
        SliderInput.Position = UDim2.new(0, 8, 0, 42)
        SliderInput.Size = UDim2.new(0, 365, 0, 6)
        
        SliderCorner2.CornerRadius = UDim.new(0, 100000)
        SliderCorner2.Parent = SliderInput
        
        SliderButton.Name = "SliderButton"
        SliderButton.Parent = SliderInput
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderButton.BackgroundTransparency = 1.000
        SliderButton.BorderSizePixel = 0
        SliderButton.Position = UDim2.new(0, 0, 0, -7)
        SliderButton.Size = UDim2.new(0, 346, 0, 25)
    
        SliderCount.Name = "SliderCount"
        SliderCount.Parent = SliderButton
        SliderCount.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        SliderCount.BackgroundTransparency = 0.3
        SliderCount.BorderSizePixel = 0
        SliderCount.Position = UDim2.new(0,start,0,0)
        SliderCount.Size = UDim2.new(0, 18, 0, 18)
    
        Title_2.Name = "Title_2"
        Title_2.Parent = SliderButton
        Title_2.AnchorPoint = Vector2.new(0, 0)
        Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_2.AutoButtonColor = false
        Title_2.BackgroundTransparency = 1.000
        Title_2.Position = UDim2.new(0,start,0,0)
        Title_2.Size = UDim2.new(0, 18, 0, 18)
        Title_2.Font = Enum.Font.GothamBold
        Title_2.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
        Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title_2.TextSize = 8.000
        Title_2.TextXAlignment = Enum.TextXAlignment.Center
        
        UICorner_2.Parent = Title_2
        UICorner_2.CornerRadius = UDim.new(0, 100000)
        
        SliderCorner.CornerRadius = UDim.new(0, 100000)
        SliderCorner.Parent = SliderCount
        
        SliderStroke.Name = "SliderStroke"
        SliderStroke.Parent = BoxFrame
        SliderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        SliderStroke.Color = Color3.fromRGB(255, 0, 0)
        SliderStroke.LineJoinMode = Enum.LineJoinMode.Round
        SliderStroke.Thickness = 1
        SliderStroke.Transparency = 0.5
        SliderStroke.Enabled = true
        SliderStroke.Archivable = true
        
        BoxFrame.Name = "BoxFrame"
        BoxFrame.Parent = SliderFrame_2
        BoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BoxFrame.BackgroundTransparency = 1.000
        BoxFrame.Size = UDim2.new(0, 50, 0, 15)
        BoxFrame.Position = UDim2.new(0, 323, 0, 8)
    
        SliderBox.Name = "SliderBox"
        SliderBox.Parent = BoxFrame
        SliderBox.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        SliderBox.BackgroundTransparency = 1.000
        SliderBox.Position = UDim2.new(0, 0, 0, 1.65)
        SliderBox.Size = UDim2.new(0, 50, 0, 15)
        SliderBox.ClearTextOnFocus = false
        SliderBox.Font = Enum.Font.Code
        SliderBox.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
        SliderBox.TextColor3 = Color3.fromRGB(200,200,200)
        SliderBox.TextSize = 10.000
        SliderBox.TextTransparency = 0
        SliderBox.TextXAlignment = Enum.TextXAlignment.Center
        SliderBox.TextEditable = true
        
        UICorner_3.Parent = BoxFrame
        UICorner_3.CornerRadius = UDim.new(0, 2)
        
        -- Slider Script --
        local dragging
        local SliderButtonStart
        local SliderButtonInput
        local slide = SliderButton
        
        local function slide(input)
            local slidein = UDim2.new(math.clamp((input.Position.X - SliderButton.AbsolutePosition.X) / SliderButton.AbsoluteSize.X, 0, 1), 0, 0, 0)
            SliderCount:TweenPosition(slidein, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
            Title_2:TweenPosition(slidein, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.12, true)
            local Value = math.floor(((slidein.X.Scale * max) / max) * (max - min) + min)
            SliderBox.Text = tostring(Value)
            Title_2.Text = tostring(Value)
            pcall(callback, Value, slidein)
        end
    
        SliderButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                SliderButtonInput = input
                SliderButtonStart = input.Position.X
                slidein = SliderButton.AbsolutePosition.X
                game.TweenService:Create(SliderCount, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0, Size = UDim2.new(0, 14, 0, 14)}):Play()
                game.TweenService:Create(Title_2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {AnchorPoint = Vector2.new(0.22, 0.8), TextSize = 13.000, BackgroundTransparency = 0, Size = UDim2.new(0, 25, 0, 25)}):Play()
                game.TweenService:Create(SliderBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
                game.TweenService:Create(SliderInput, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.5}):Play()
                game.TweenService:Create(SliderStroke, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0}):Play()
            end
            input.Changed:Connect(function(input)
                if input.UserInputType == Enum.UserInputState.End then
                dragging = false
                
                end
            end)
        end)
        SliderButton.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
                SliderButtonInput = input
                game.TweenService:Create(SliderCount, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.3, Size = UDim2.new(0, 18, 0, 18)}):Play()
                game.TweenService:Create(Title_2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {AnchorPoint = Vector2.new(0, 0), TextSize = 8.000, BackgroundTransparency = 1.000, Size = UDim2.new(0, 18, 0, 18)}):Play()
                game.TweenService:Create(SliderBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0.5}):Play()
                game.TweenService:Create(SliderInput, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.7}):Play()
                game.TweenService:Create(SliderStroke, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0.5}):Play()
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == SliderButtonInput and dragging then
                slide(input)
            end
        end)
        
        function set(property)
            if property == "Text" then
                if tonumber(SliderBox.Text) then 
                    if tonumber(SliderBox.Text) <= max then
                        Value = SliderBox.Text
                        Title_2.Text = SliderBox.Text
                        SliderCount:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                    if tonumber(SliderBox.Text) > max then
                        SliderBox.Text = max
                        Title_2.Text = max
                        Value = max
                        SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                    if tonumber(SliderBox.Text) >= min then
                        Value = SliderBox.Text
                        Title_2.Text = SliderBox.Text
                        SliderCount:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                    if tonumber(SliderBox.Text) < min then
                        Value = min
                        Title_2 = min
                        SliderCount.Position = UDim2.new(((min or min) - min) / (max - min), 0, 0, 0)
                        Title_2.Position = UDim2.new(((min or min) - min) / (max - min), 0, 0, 0)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                else
                    SliderBox.Text = "" or Value
                    Title_2.Text = Value
                end
            end
        end
        
        SliderBox.Focused:Connect(function()
            SliderBox.Changed:Connect(set)
        end)
        
        SliderBox.FocusLost:Connect(function(enterP)
            if not enterP then
                if SliderBox.Text == "" then
                    SliderBox.Text = min
                    Title_2.Text = min
                    Value = min
                    SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                    Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                    pcall(function()
                        callback(Value)
                    end)
                end
                if tonumber(SliderBox.Text) > tonumber(max) then
                    Value = max
                    SliderBox.Text = max
                    Title_2.Text = max
                    SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                    Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                    pcall(function()
                        callback(Value)
                    end)
                else
                    Value = tonumber(SliderBox.Text)
                end
                if tonumber(SliderBox.Text) < min then
                    SliderBox.Text = min
                    Title_2.Text = min
                    Value = min
                    SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                    Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                    pcall(function()
                        callback(Value)
                    end)
                else
                    Value = tonumber(SliderBox.Text)
                end
            end
            if tonumber(SliderBox.Text) > max then
                SliderBox.Text = max
                Title_2.Text = max
                Value = max
                SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                pcall(function()
                    callback(Value)
                end)
            else
                Value = tonumber(SliderBox.Text)
            end
            if tonumber(SliderBox.Text) < min then
                SliderBox.Text = min
                Title_2.Text = min
                Value = min
                SliderCount.Position = UDim2.new(((min) - min) / (max - min), 0, 0, 0)
                Title_2.Position = UDim2.new(((min) - min) / (max - min), 0, 0, 0)
                pcall(function()
                    callback(Value)
                end)
            else
                Value = tonumber(SliderBox.Text)
            end
            if SliderBox.Text == "" then
                SliderBox.Text = min
                Title_2.Text = min
                Value = min
                SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                pcall(function()
                    callback(Value)
                end)
            end
        end)
        return sliderfunc
    end

    function main:Textbox(text,disappear,callback)
        local Textbox = Instance.new("Frame")
        local TextboxCorner = Instance.new("UICorner")
        local Textboxx = Instance.new("Frame")
        local TextboxxCorner = Instance.new("UICorner")
        local TextboxLabel = Instance.new("TextLabel")
        local txtbtn = Instance.new("TextButton")
        local RealTextbox = Instance.new("TextBox")
        local UICorner = Instance.new("UICorner")

        Textbox.Name = "Textbox"
        Textbox.Parent = MainFramePage
        Textbox.BackgroundColor3 = Color3.new(255, 0, 0)
        Textbox.BackgroundTransparency = 0
        Textbox.Size = UDim2.new(0, 387, 0, 31)

        TextboxCorner.CornerRadius = UDim.new(0, 5)
        TextboxCorner.Name = "TextboxCorner"
        TextboxCorner.Parent = Textbox

        Textboxx.Name = "Textboxx"
        Textboxx.Parent = Textbox
        Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Textboxx.Position = UDim2.new(0, 1, 0, 1)
        Textboxx.Size = UDim2.new(0, 385, 0, 29)

        TextboxxCorner.CornerRadius = UDim.new(0, 5)
        TextboxxCorner.Name = "TextboxxCorner"
        TextboxxCorner.Parent = Textboxx

        TextboxLabel.Name = "TextboxLabel"
        TextboxLabel.Parent = Textbox
        TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 128,0)
        TextboxLabel.BackgroundTransparency = 1.000
        TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
        TextboxLabel.Text = text
        TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
        TextboxLabel.Font = Enum.Font.GothamSemibold
        TextboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextboxLabel.TextSize = 16.000
        TextboxLabel.TextTransparency = 0
        TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

        txtbtn.Name = "txtbtn"
        txtbtn.Parent = Textbox
        txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        txtbtn.BackgroundTransparency = 1.000
        txtbtn.Position = UDim2.new(0, 1, 0, 1)
        txtbtn.Size = UDim2.new(0, 387, 0, 29)
        txtbtn.Font = Enum.Font.SourceSans
        txtbtn.Text = ""
        txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        txtbtn.TextSize = 14.000

        RealTextbox.Name = "RealTextbox"
        RealTextbox.Parent = Textbox
        RealTextbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        RealTextbox.BackgroundTransparency = 0
        RealTextbox.Position = UDim2.new(0, 275, 0, 4)
        RealTextbox.Size = UDim2.new(0, 100, 0, 24)
        RealTextbox.Font = Enum.Font.GothamSemibold
        RealTextbox.Text = ""
        RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
        RealTextbox.TextSize = 11.000
        RealTextbox.TextTransparency = 0

        RealTextbox.FocusLost:Connect(function()
            callback(RealTextbox.Text)
            if disappear then
                RealTextbox.Text = ""
            end
        end)

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = RealTextbox
    end

    function main:Label(text)
        local Label = Instance.new("TextLabel")
        local PaddingLabel = Instance.new("UIPadding")
        local labelfunc = {}

        Label.Name = "Label"
        Label.Parent = MainFramePage
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Size = UDim2.new(0, 410, 0, 20)
        Label.Font = Enum.Font.GothamSemibold
        Label.TextColor3 = Color3.fromRGB(225, 225, 225)
        Label.TextSize = 16.000
        Label.Text = text
        Label.TextXAlignment = Enum.TextXAlignment.Left

        PaddingLabel.PaddingLeft = UDim.new(0,15)
        PaddingLabel.Parent = Label
        PaddingLabel.Name = "PaddingLabel"

        function labelfunc:Set(newtext)
            Label.Text = newtext
        end
        return labelfunc
    end

    function main:AddLabel1(text)
        local Label1 = Instance.new("TextLabel")
        local PaddingLabel1 = Instance.new("UIPadding")
        local Label1func = {}
        
        Label1.Name = "Label1"
        Label1.Parent = MainFramePage
        Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label1.BackgroundTransparency = 1.000
        Label1.Size = UDim2.new(0, 410, 0, 20)
        Label1.Font = Enum.Font.GothamSemibold
        Label1.TextColor3 = Color3.fromRGB(255,255,255)
        Label1.TextSize = 15.000
        Label1.Text = text
        Label1.TextXAlignment = Enum.TextXAlignment.Left
        
        PaddingLabel1.PaddingLeft = UDim.new(0,15)
        PaddingLabel1.Parent = Label1
        PaddingLabel1.Name = "PaddingLabel1"
        function Label1func:Refresh(tochange)
        Label1.Text = tochange
        end
        
        return Label1func
    end    

    function main:Textbox(text,disappear,callback)
        local Textbox = Instance.new("Frame")
        local TextboxCorner = Instance.new("UICorner")
        local Textboxx = Instance.new("Frame")
        local TextboxxCorner = Instance.new("UICorner")
        local TextboxLabel = Instance.new("TextLabel")
        local txtbtn = Instance.new("TextButton")
        local RealTextbox = Instance.new("TextBox")
        local UICorner = Instance.new("UICorner")
        
        Textbox.Name = "Textbox"
        Textbox.Parent = MainFramePage
        Textbox.BackgroundColor3 = Color3.new(255, 0, 0)
        Textbox.BackgroundTransparency = 0
        Textbox.Size = UDim2.new(0, 387, 0, 31)
        
        TextboxCorner.CornerRadius = UDim.new(0, 5)
        TextboxCorner.Name = "TextboxCorner"
        TextboxCorner.Parent = Textbox
        
        Textboxx.Name = "Textboxx"
        Textboxx.Parent = Textbox
        Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Textboxx.Position = UDim2.new(0, 1, 0, 1)
        Textboxx.Size = UDim2.new(0, 385, 0, 29)
        
        TextboxxCorner.CornerRadius = UDim.new(0, 3)
        TextboxxCorner.Name = "TextboxxCorner"
        TextboxxCorner.Parent = Textboxx
        
        TextboxLabel.Name = "TextboxLabel"
        TextboxLabel.Parent = Textbox
        TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        TextboxLabel.BackgroundTransparency = 1.000
        TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
        TextboxLabel.Text = text
        TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
        TextboxLabel.Font = Enum.Font.GothamSemibold
        TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
        TextboxLabel.TextSize = 16.000
        TextboxLabel.TextTransparency = 0
        TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        txtbtn.Name = "txtbtn"
        txtbtn.Parent = Textbox
        txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        txtbtn.BackgroundTransparency = 1.000
        txtbtn.Position = UDim2.new(0, 1, 0, 1)
        txtbtn.Size = UDim2.new(0, 387, 0, 29)
        txtbtn.Font = Enum.Font.SourceSans
        txtbtn.Text = ""
        txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        txtbtn.TextSize = 14.000
        
        RealTextbox.Name = "RealTextbox"
        RealTextbox.Parent = Textbox
        RealTextbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        RealTextbox.BackgroundTransparency = 0
        RealTextbox.Position = UDim2.new(0, 275, 0, 4)
        RealTextbox.Size = UDim2.new(0, 100, 0, 24)
        RealTextbox.Font = Enum.Font.GothamSemibold
        RealTextbox.Text = ""
        RealTextbox.TextColor3 = Color3.fromRGB(255, 0, 0)
        RealTextbox.TextSize = 11.000
        RealTextbox.TextTransparency = 0

        RealTextbox.FocusLost:Connect(function()
            callback(RealTextbox.Text)
            if disappear then
                RealTextbox.Text = ""
            end
        end)

        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = RealTextbox
    end
    
    function main:AddLabel(text)
        local Label = Instance.new("TextLabel")
        local PaddingLabel = Instance.new("UIPadding")
        local labelfunc = {}

        Label.Name = "Label"
        Label.Parent = MainFramePage
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Size = UDim2.new(0, 410, 0, 20)
        Label.Font = Enum.Font.GothamSemibold
        Label.TextColor3 = Color3.fromRGB(225, 225, 225)
        Label.TextSize = 16.000
        Label.Text = text
        Label.TextXAlignment = Enum.TextXAlignment.Left

        PaddingLabel.PaddingLeft = UDim.new(0,15)
        PaddingLabel.Parent = Label
        PaddingLabel.Name = "PaddingLabel"

        function labelfunc:Set(newtext)
            Label.Text = newtext
        end
        return labelfunc
    end

    function main:AddLabel1(text)
        local Label1 = Instance.new("TextLabel")
        local PaddingLabel1 = Instance.new("UIPadding")
        local Label1func = {}
        
        Label1.Name = "Label1"
        Label1.Parent = MainFramePage
        Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label1.BackgroundTransparency = 1.000
        Label1.Size = UDim2.new(0, 410, 0, 20)
        Label1.Font = Enum.Font.GothamSemibold
        Label1.TextColor3 = Color3.fromRGB(255,255,255)
        Label1.TextSize = 15.000
        Label1.Text = text
        Label1.RichText = true
        Label1.TextXAlignment = Enum.TextXAlignment.Left
        
        PaddingLabel1.PaddingLeft = UDim.new(0,15)
        PaddingLabel1.Parent = Label1
        PaddingLabel1.Name = "PaddingLabel1"
        function Label1func:Refresh(tochange)
            Label1.Text = tochange
        end

        return Label1func
    end

    function main:Dis(text,display)
        local Label1 = Instance.new("TextLabel")
        local PaddingLabel1 = Instance.new("UIPadding")
        local Label1func = {}

        Label1.Name = "Label1"
        Label1.Parent = MainFramePage
        Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label1.BackgroundTransparency = 1.000
        Label1.Size = UDim2.new(0, 410, 0, 20)
        Label1.Font = Enum.Font.GothamSemibold
        Label1.TextColor3 = Color3.fromRGB(255,255,255)
        Label1.TextSize = 15.000
        Label1.Text = text
        Label1.TextXAlignment = Enum.TextXAlignment.Left

        Labeld.Name = "Labeld"
        Labeld.Parent = MainFramePage
        Labeld.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Labeld.BackgroundTransparency = 1.000
        Labeld.Size = UDim2.new(0, 410, 0, 20)
        Labeld.Font = Enum.Font.GothamSemibold
        Labeld.TextColor3 = Color3.fromRGB(255, 255, 255)
        Labeld.TextSize = 15.000
        Labeld.Text = display or ""
        Labeld.TextXAlignment = Enum.TextXAlignment.Left

        PaddingLabel1.PaddingLeft = UDim.new(0,15)
        PaddingLabel1.Parent = Label1
        PaddingLabel1.Name = "PaddingLabel1"
        function Label1func:Refresh(tochange)
            Label1.Text = tochange
        end

        return Label1func
    end

    function main:Seperator(text)
        local Seperator = Instance.new("Frame")
        local Sep1 = Instance.new("Frame")
        local Sep2 = Instance.new("TextLabel")
        local Sep3 = Instance.new("Frame")

        Seperator.Name = "Seperator"
        Seperator.Parent = MainFramePage
        Seperator.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Seperator.BackgroundTransparency = 1.000
        Seperator.Size = UDim2.new(0, 310, 0, 20)

        Sep1.Name = "Sep1"
        Sep1.Parent = Seperator
        Sep1.BackgroundColor3 = Color3.new(255, 0, 0)
        Sep1.BorderSizePixel = 0
        Sep1.Position = UDim2.new(0, 0, 0, 10)
        Sep1.Size = UDim2.new(0, 80, 0, 1)

        Sep2.Name = "Sep2"
        Sep2.Parent = Seperator
        Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Sep2.BackgroundTransparency = 1.000
        Sep2.Position = UDim2.new(0, 140, 0, 0)
        Sep2.Size = UDim2.new(0, 100, 0, 20)
        Sep2.Font = Enum.Font.GothamSemibold
        Sep2.Text = text
        Sep2.TextColor3 = Color3.fromRGB(255,255,255)
        Sep2.TextSize = 14.000

        Sep3.Name = "Sep3"
        Sep3.Parent = Seperator
        Sep3.BackgroundColor3 = Color3.new(255, 0, 0)
        Sep3.BorderSizePixel = 0
        Sep3.Position = UDim2.new(0, 300, 0, 10)
        Sep3.Size = UDim2.new(0, 80, 0, 1)
    end

    function main:AddLine()
        local Linee = Instance.new("Frame")
        local Line = Instance.new("Frame")
        
        Linee.Name = "Linee"
        Linee.Parent = MainFramePage
        Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Linee.BackgroundTransparency = 1.000
        Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
        Linee.Size = UDim2.new(0, 310, 0, 20)
        
        Line.Name = "Line"
        Line.Parent = Linee
        Line.BackgroundColor3 = Color3.new(255, 0, 0)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 0, 0, 10)
        Line.Size = UDim2.new(0, 410, 0, 1)
    end

    return main
end
return uitab
end
--------------------------------------------------------------------------------------------------------
local L1 = Instance.new("ScreenGui")
local L2 = Instance.new("ImageButton")
local L3 = Instance.new("UICorner")
L1.Name = "ToggleUI"
L1.Parent = game.CoreGui
L1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
L2.Name = "ToggleButton"
L2.Parent = L1
L2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L2.BorderSizePixel = 0
L2.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
L2.Size = UDim2.new(0, 53.5, 0, 53.5)
L2.BackgroundTransparency = 1.000
L2.Image = "rbxassetid://136478742457628"
L2.Draggable = true
L2.MouseButton1Click:Connect(function()
  game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
L3.CornerRadius = UDim.new(0, 10)
L3.Parent = L2
------------------------------------------------------------------------------------------------------------------------------------
if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    end
    
function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059, 17, 1546)
            CFrameMon = CFrame.new(943, 45, 1562)
        elseif MyLevel == 10 or MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598, 37, 153)
            CFrameMon = CFrame.new(-1524, 50, 37)
        elseif MyLevel == 15 or MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598, 37, 153)
            CFrameMon = CFrame.new(-1128, 40, -451)
        elseif MyLevel == 30 or MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1140, 4, 3829)
            CFrameMon = CFrame.new(-1262, 40, 3905)
        elseif MyLevel == 40 or MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1140, 4, 3829)
            CFrameMon = CFrame.new(-976, 55, 4304)
        elseif MyLevel == 60 or MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(897, 6, 4389)
            CFrameMon = CFrame.new(924, 7, 4482)
        elseif MyLevel == 75 or MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(897, 6, 4389)
            CFrameMon = CFrame.new(1608, 9, 4371)
        elseif MyLevel == 90 or MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1385, 87, -1298)
            CFrameMon = CFrame.new(1362, 120, -1531)
        elseif MyLevel == 100 or MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1385, 87, -1298)
            CFrameMon = CFrame.new(1243, 140, -1437)
        elseif MyLevel == 120 or MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5035, 29, 4326)
            CFrameMon = CFrame.new(-4881, 23, 4274)
        elseif MyLevel == 150 or MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4844, 718, -2621)
            CFrameMon = CFrame.new(-4953, 296, -2899)
        elseif MyLevel == 175 or MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4844, 718, -2621)
            CFrameMon = CFrame.new(-5260, 391, -2229)
        elseif MyLevel == 190 or MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5306, 2, 477)
            CFrameMon = CFrame.new(5099, -0, 474)
        elseif MyLevel == 210 or MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5306, 2, 477)
            CFrameMon = CFrame.new(5655, 16, 866)
        elseif MyLevel == 250 or MyLevel <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1581, 7, -2982)
            CFrameMon = CFrame.new(-1820, 51, -2741)
        elseif MyLevel == 275 or MyLevel <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1581, 7, -2982)
            CFrameMon = CFrame.new(-1268, 30, -2996)
        elseif MyLevel == 300 or MyLevel <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5319, 12, 8515)
            CFrameMon = CFrame.new(-5335, 46, 8638)
        elseif MyLevel == 325 or MyLevel <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5319, 12, 8515)
            CFrameMon = CFrame.new(-5803, 86, 8829)
        elseif MyLevel == 375 or MyLevel <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122, 18, 1567)
            CFrameMon = CFrame.new(60998, 50, 1534)
        elseif MyLevel == 400 or MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122, 18, 1567)
            CFrameMon = CFrame.new(61866, 55, 1655)
        elseif MyLevel == 450 or MyLevel <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4720, 846, -1951)
            CFrameMon = CFrame.new(-4720, 846, -1951)
        elseif MyLevel == 475 or MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7861, 5545, -381)
            CFrameMon = CFrame.new(-7741, 5580, -395)
        elseif MyLevel == 525 or MyLevel <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7903, 5636, -1412)
            CFrameMon = CFrame.new(-7727, 5650, -1410)
        elseif MyLevel == 550 or MyLevel <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7903, 5636, -1412)
            CFrameMon = CFrame.new(-7894, 5640, -1629)
        elseif MyLevel == 625 or MyLevel <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5258, 39, 4052)
            CFrameMon = CFrame.new(5391, 70, 4023)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5258, 39, 4052)
            CFrameMon = CFrame.new(5985, 70, 4790)
        end
    elseif World2 then
        if MyLevel == 700 or MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-427, 73, 1835)
            CFrameMon = CFrame.new(-614, 90, 2240)
        elseif MyLevel == 725 or MyLevel <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-427, 73, 1835)
            CFrameMon = CFrame.new(-867, 110, 1621)
        elseif MyLevel == 775 or MyLevel <= 874 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(635, 73, 919)
            CFrameMon = CFrame.new(635, 73, 919)
        elseif MyLevel == 875 or MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2441, 73, -3219)
            CFrameMon = CFrame.new(-2552, 110, -3050)
        elseif MyLevel == 900 or MyLevel <= 949 then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2441, 73, -3219)
            CFrameMon = CFrame.new(-1695, 110, -3299)
        elseif MyLevel == 950 or MyLevel <= 974 then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5495, 48, -794)
            CFrameMon = CFrame.new(-5715, 90, -917)
        elseif MyLevel == 975 or MyLevel <= 999 then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5495, 48, -794)
            CFrameMon = CFrame.new(-6027, 50, -1130)
        elseif MyLevel == 1000 or MyLevel <= 1049 then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(607, 401, -5371)
            CFrameMon = CFrame.new(445, 440, -5175)
        elseif MyLevel == 1050 or MyLevel <= 1099 then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(607, 401, -5371)
            CFrameMon = CFrame.new(1224, 460, -5332)
        elseif MyLevel == 1100 or MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6061, 16, -4904)
            CFrameMon = CFrame.new(-5941, 50, -4322)
        elseif MyLevel == 1125 or MyLevel <= 1174 then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6061, 16, -4904)
            CFrameMon = CFrame.new(-6306, 50, -5752)
        elseif MyLevel == 1175 or MyLevel <= 1199 then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5430, 16, -5298)
            CFrameMon = CFrame.new(-5233, 60, -6227)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5430, 16, -5298)
            CFrameMon = CFrame.new(-4955, 60, -4836)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1033, 125, 32909)         
            CFrameMon = CFrame.new(1033, 125, 32909)    
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1033, 125, 32909)   
            CFrameMon = CFrame.new(809, 80, 33090)   
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(973, 125, 33245)         
            CFrameMon = CFrame.new(838, 160, 33408)      
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(973, 125, 33245)
            CFrameMon = CFrame.new(1238, 220, 33148)
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5668, 28, -6484)
            CFrameMon = CFrame.new(5836, 80, -6257)
        elseif MyLevel == 1375 or MyLevel <= 1424 then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5668, 28, -6484)
            CFrameMon = CFrame.new(5700, 80, -6724)
        elseif MyLevel == 1425 or MyLevel <= 1449 then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3056, 240, -10145)
            CFrameMon = CFrame.new(-2583, 80, -9821)
        elseif MyLevel >= 1450 then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3056, 240, -10145)
            CFrameMon = CFrame.new(-3339, 290, -10412)
        end
    elseif World3 then
        if MyLevel == 1500 or MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-291, 44, 5580)
            CFrameMon = CFrame.new(-44, 70, 5623)
        elseif MyLevel == 1525 or MyLevel <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-291, 44, 5580)
            CFrameMon = CFrame.new(219, 105, 6018)
        elseif MyLevel == 1575 or MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5834, 51, -1103)
            CFrameMon = CFrame.new(5992, 90, -1581)
        elseif MyLevel == 1600 or MyLevel <= 1624 then 
            Mon = "Dragon Crew Archer"
            NameQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5834, 51, -1103)
            CFrameMon = CFrame.new(6472, 370, -151)
        elseif MyLevel == 1625 or MyLevel <= 1649 then
            Mon = "Female Islander"
            NameQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5448, 602, 748)
            CFrameMon = CFrame.new(4836, 740, 928)
        elseif MyLevel == 1650 or MyLevel <= 1699 then 
            Mon = "Giant Islander"
            NameQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5448, 602, 748)
            CFrameMon = CFrame.new(4784, 660, 155)
        elseif MyLevel == 1700 or MyLevel <= 1724 then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180, 29, -6738)
            CFrameMon = CFrame.new(3156, 120, -7837)
        elseif MyLevel == 1725 or MyLevel <= 1774 then
            Mon = "Marine Rear Admiral"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2180, 29, -6738)
            CFrameMon = CFrame.new(3205, 120, -6742)
        elseif MyLevel == 1775 or MyLevel <= 1799 then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581, 332, -8758)   
            CFrameMon = CFrame.new(-10550, 380, -8574)
        elseif MyLevel == 1800 or MyLevel <= 1824 then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581, 332, -8758)   
            CFrameMon = CFrame.new(-10764, 380, -8799) 
        elseif MyLevel == 1825 or MyLevel <= 1849 then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13233, 332, -7626)
            CFrameMon = CFrame.new(-13335, 380, -7660)
        elseif MyLevel == 1850 or MyLevel <= 1899 then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13233, 332, -7626)   
            CFrameMon = CFrame.new(-13844, 520, -7016)
        elseif MyLevel == 1900 or MyLevel <= 1924 then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12682, 391, -9901)
            CFrameMon = CFrame.new(-12166, 380, -10375)
        elseif MyLevel == 1925 or MyLevel <= 1974 then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12682, 391, -9901)
            CFrameMon = CFrame.new(-13098, 450, -9831)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9481, 142, 5565)
            CFrameMon = CFrame.new(-8680, 190, 5852)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9481, 142, 5565)
            CFrameMon = CFrame.new(-10144, 140, 5932)
        elseif MyLevel == 2025 or MyLevel <= 2049 then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9515, 172, 607) 
            CFrameMon = CFrame.new(-9275, 210, 6166)
        elseif MyLevel == 2050 or MyLevel <= 2074 then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9515, 172, 607)
            CFrameMon = CFrame.new(-9442, 60, 6304)
        elseif MyLevel == 2075 or MyLevel <= 2099 then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104, 38, -10194)
            CFrameMon = CFrame.new(-1870, 100, -10225)
        elseif MyLevel == 2100 or MyLevel <= 2124 then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104, 38, -10194)
            CFrameMon = CFrame.new(-2005, 100, -10585)
        elseif MyLevel == 2125 or MyLevel <= 2149 then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-818, 66, -10964)
            CFrameMon = CFrame.new(-501, 100, -10883)
        elseif MyLevel == 2150 or MyLevel <= 2199 then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-818, 66, -10964)
            CFrameMon = CFrame.new(-690, 100, -11350)
        elseif MyLevel == 2200 or MyLevel <= 2224 then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2023, 38, -12028)
            CFrameMon = CFrame.new(-2332, 90, -12049)
        elseif MyLevel == 2225 or MyLevel <= 2249 then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2023, 38, -12028)
            CFrameMon = CFrame.new(-1514, 90, -12422)
        elseif MyLevel == 2250 or MyLevel <= 2274 then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1931, 38, -12840)
            CFrameMon = CFrame.new(-1930, 90, -12963)
        elseif MyLevel == 2275 or MyLevel <= 2299 then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1931, 38, -12840)
            CFrameMon = CFrame.new(-2123, 110, -12777)
        elseif MyLevel == 2300 or MyLevel <= 2324 then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(235, 25, -12199)
            CFrameMon = CFrame.new(110, 80, -12245)
        elseif MyLevel == 2325 or MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(235, 25, -12199)
            CFrameMon = CFrame.new(579, 80, -12413)
        elseif MyLevel == 2350 or MyLevel <= 2374 then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150, 25, -12777)
            CFrameMon = CFrame.new(-68, 80, -12692)
        elseif MyLevel == 2375 or MyLevel <= 2399 then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150, 25, -12777)
            CFrameMon = CFrame.new(17, 80, -12962)
        elseif MyLevel == 2400 or MyLevel <= 2424 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1148, 14, -14446)
            CFrameMon = CFrame.new(-1371, 70, -14405)
        elseif MyLevel == 2425 or MyLevel <= 2449 then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1148, 14, -14446)
            CFrameMon = CFrame.new(-836, 70, -14326)
        elseif MyLevel == 2450 or MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547, 56, -172)
            CFrameMon = CFrame.new(-16431, 90, -223)
        elseif MyLevel == 2475 or MyLevel <= 2499 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547, 56, -172)
            CFrameMon = CFrame.new(-16668, 70, -243)
        elseif MyLevel == 2500 or MyLevel <= 2524 then
            Mon = "Sun-kissed Warrior"
            LevelQuest = 1
            NameQuest = "TikiQuest2"
            NameMon = "kissed"
            CFrameQuest = CFrame.new(-16540, 56, 1051)
            CFrameMon = CFrame.new(-16345, 80, 1004)
        elseif MyLevel == 2525 or MyLevel <= 2549 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16540, 56, 1051)
            CFrameMon = CFrame.new(-16634, 85, 1106)
        elseif MyLevel == 2550 or MyLevel <= 2574 then
            Mon = "Serpent Hunter"
            LevelQuest = 1
            NameQuest = "TikiQuest3"
            NameMon = "Serpent Hunter"
            CFrameQuest = CFrame.new(-16665, 105, 1580)
            CFrameMon = CFrame.new(-16542.4824, 146.675156, 1529.61401, -0.999948919, 1.07298108e-08, 0.0101067368, 1.0128324e-08, 1, -5.95646625e-08, -0.0101067368, -5.94592571e-08, -0.999948919)
        elseif MyLevel == 2575 or MyLevel <= 2600 then
            Mon = "Skull Slayer"
            LevelQuest = 2
            NameQuest = "TikiQuest3"
            NameMon = "Skull Slayer"
            CFrameQuest = CFrame.new(-16665, 105, 1580)
            CFrameMon = CFrame.new(-16849.9336, 147.005066, 1640.88354, 0.470148534, 0.491874039, -0.732816696, 1.72165002e-08, 0.83030504, 0.55730921, 0.882587314, -0.262018114, 0.390366673)
        end
    end
end
--------------------------------------------------------------------------------------------------------
    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end       

    function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0,134,139)
						else
							name.TextColor3 = Color3.new(0,134,139)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth: ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if ChestESP then
					if string.find(v.Name,"Chest") then
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								name.TextColor3 = Color3.fromRGB(109, 109, 109)
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest2" then
								name.TextColor3 = Color3.fromRGB(173, 158, 21)
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest3" then
								name.TextColor3 = Color3.fromRGB(85, 255, 255)
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
						end
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then   
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					end
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end
function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then 
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 0, 0)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(0, 0, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end   
		end)
	end
end
function UpdateRealFruitChams() 
	for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 0, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 174, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(251, 255, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
end

function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(0,134,139)
						else
							name.TextColor3 = Color3.new(0,134,139)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth: ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if ChestESP then
					if string.find(v.Name,"Chest") then
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								name.TextColor3 = Color3.fromRGB(109, 109, 109)
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest2" then
								name.TextColor3 = Color3.fromRGB(173, 158, 21)
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest3" then
								name.TextColor3 = Color3.fromRGB(85, 255, 255)
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
						end
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then   
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					end
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end
function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then 
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 0, 0)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(0, 0, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end   
		end)
	end
end
function UpdateRealFruitChams() 
	for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 0, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 174, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(251, 255, 0)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
end

function UpdateIslandMirageESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then 
                if v.Name == "Mirage Island" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function UpdateLSDESP() 
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LADESP then 
                if v.Name == "Legendary Sword Dealer" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

    function InfAb()
        if InfAbility then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                local inf = Instance.new("ParticleEmitter")
                inf.Acceleration = Vector3.new(0,0,0)
                inf.Archivable = true
                inf.Drag = 20
                inf.EmissionDirection = Enum.NormalId.Top
                inf.Enabled = true
                inf.Lifetime = NumberRange.new(0,0)
                inf.LightInfluence = 0
                inf.LockedToPart = true
                inf.Name = "Agility"
                inf.Rate = 500
                local numberKeypoints2 = {
                    NumberSequenceKeypoint.new(0, 0);
                    NumberSequenceKeypoint.new(1, 4); 
                }
                inf.Size = NumberSequence.new(numberKeypoints2)
                inf.RotSpeed = NumberRange.new(9999, 99999)
                inf.Rotation = NumberRange.new(0, 0)
                inf.Speed = NumberRange.new(30, 30)
                inf.SpreadAngle = Vector2.new(0,0,0,0)
                inf.Texture = ""
                inf.VelocityInheritance = 0
                inf.ZOffset = 2
                inf.Transparency = NumberSequence.new(0)
                inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
                inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            end
        else
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
            end
        end
    end
    
    local LocalPlayer = game:GetService'Players'.LocalPlayer
    local originalstam = LocalPlayer.Character.Energy.Value
    function infinitestam()
        LocalPlayer.Character.Energy.Changed:connect(function()
            if InfiniteEnergy then
                LocalPlayer.Character.Energy.Value = originalstam
            end 
        end)
    end
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if InfiniteEnergy then
                    wait(0.1)
                    originalstam = LocalPlayer.Character.Energy.Value
                    infinitestam()
                end
            end
        end)
    end)
    
    function NoDodgeCool()
        if nododgecool then
            for i,v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.1" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not nododgecool
                            end
                        end
                    end
                end
            end
        end
    end
    
    function fly()
        local mouse=game:GetService("Players").LocalPlayer:GetMouse''
        localplayer=game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
    
    function Click()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    
    function EquipWeapon(ToolSe)
        if not Nill then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
    
    function BTP(p)
    	pcall(function()
	    	if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					wait(.05)
					game.Players.LocalPlayer.Character.Head:Destroy()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
				until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
			end
		end)
	end
   
local isTeleporting = false

function WaitHRP(q0)
    if not q0 then return end
    return q0.Character:WaitForChild("HumanoidRootPart", 9)
end

function CheckNearestTeleporter(aI)
    local vcspos = aI.Position
    local minDist = math.huge
    local chosenTeleport = nil
    local y = game.PlaceId

    local TableLocations = {}

    if y == 2753915549 then
        TableLocations = {
            ["Sky3"] = Vector3.new(-7894, 5547, -380),
            ["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
            ["UnderWater"] = Vector3.new(61163, 11, 1819),
            ["UnderwaterExit"] = Vector3.new(4050, -1, -1814)
        }
    elseif y == 4442272183 then
        TableLocations = {
            ["Swan Mansion"] = Vector3.new(-390, 332, 673),
            ["Swan Room"] = Vector3.new(2285, 15, 905),
            ["Cursed Ship"] = Vector3.new(923, 126, 32852),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    elseif y == 7449423635 then
        TableLocations = {
            ["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
            ["Hydra Island"] = Vector3.new(5745, 610, -267),
            ["Mansion"] = Vector3.new(-12462, 375, -7552),
            ["Castle"] = Vector3.new(-5036, 315, -3179),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Beautiful Room"] = Vector3.new(5314.58203, 22.5364361, -125.942276, 1, 2.14762768e-08, -1.99111154e-13, -2.14762768e-08, 1, -3.0510602e-08, 1.98455903e-13, 3.0510602e-08, 1),
            ["Temple of Time"] = Vector3.new(28286, 14897, 103)
        }
    end

    for _, v in pairs(TableLocations) do
        local dist = (v - vcspos).Magnitude
        if dist < minDist then
            minDist = dist
            chosenTeleport = v
        end
    end

    local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    if minDist <= (vcspos - playerPos).Magnitude then
        return chosenTeleport
    end
end

function requestEntrance(teleportPos)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", teleportPos)
    local char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = char.CFrame + Vector3.new(0, 50, 0)
    task.wait(0.5)
end

local isBypassEnabled = false

function topos(Pos)
    local plr = game.Players.LocalPlayer
    if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
        if not Pos then 
            return 
        end
        local Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude
        local nearestTeleport = CheckNearestTeleporter(Pos)
        if nearestTeleport then
            requestEntrance(nearestTeleport)
        end
        if not plr.Character:FindFirstChild("PartTele") then
            local PartTele = Instance.new("Part", plr.Character)
            PartTele.Size = Vector3.new(10,1,10)
            PartTele.Name = "PartTele"
            PartTele.Anchored = true
            PartTele.Transparency = 1
            PartTele.CanCollide = false
            PartTele.CFrame = WaitHRP(plr).CFrame 
            PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                if not isTeleporting then return end
                task.wait()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = PartTele.CFrame
                    WaitHRP(plr).CFrame = CFrame.new(targetCFrame.Position.X, Pos.Position.Y, targetCFrame.Position.Z)
                end
            end)
        end
        isTeleporting = true        
        if isBypassEnabled and Distance > distbyp then
            bypass(Pos)
        end
        local SpeedTw = getgenv().TweenSpeed
        if Distance <= 250 then
            SpeedTw = SpeedTw * 3
        end
        local targetCFrame = CFrame.new(Pos.Position.X, Pos.Position.Y, Pos.Position.Z)
        local Tween = game:GetService("TweenService"):Create(plr.Character.PartTele, TweenInfo.new(Distance / SpeedTw, Enum.EasingStyle.Linear), {CFrame = Pos})
        Tween:Play()
        Tween.Completed:Connect(function(status)
            if status == Enum.PlaybackState.Completed then
                if plr.Character:FindFirstChild("PartTele") then
                    plr.Character.PartTele:Destroy()
                end
                isTeleporting = false
            end
        end)
    end
end

function TP1(Pos)
    topos(Pos)
end

function TP2(Pos)
    local plr = game.Players.LocalPlayer
    if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude
        if not Pos then 
            return 
        end
        local nearestTeleport = CheckNearestTeleporter(Pos)
        if nearestTeleport then
            requestEntrance(nearestTeleport)
        end
        if not plr.Character:FindFirstChild("PartTele") then
            local PartTele = Instance.new("Part", plr.Character)
            PartTele.Size = Vector3.new(10,1,10)
            PartTele.Name = "PartTele"
            PartTele.Anchored = true
            PartTele.Transparency = 1
            PartTele.CanCollide = true
            PartTele.CFrame = WaitHRP(plr).CFrame 
            PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                if not isTeleporting then return end
                task.wait()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    WaitHRP(plr).CFrame = PartTele.CFrame
                end
            end)
        end
        isTeleporting = true
        local Tween = game:GetService("TweenService"):Create(plr.Character.PartTele, TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear), {CFrame = Pos})
        Tween:Play()
        Tween.Completed:Connect(function(status)
            if status == Enum.PlaybackState.Completed then
                if plr.Character:FindFirstChild("PartTele") then
                    plr.Character.PartTele:Destroy()
                end
                isTeleporting = false
            end
        end)
    end
end

function stopTeleport()
    isTeleporting = false
    local plr = game.Players.LocalPlayer
    if plr.Character:FindFirstChild("PartTele") then
        plr.Character.PartTele:Destroy()
    end
end

spawn(function()
    while task.wait() do
        if not isTeleporting then
            stopTeleport()
        end
    end
end)

spawn(function()
    local plr = game.Players.LocalPlayer
    while task.wait() do
        pcall(function()
            if plr.Character:FindFirstChild("PartTele") then
                if (plr.Character.HumanoidRootPart.Position - plr.Character.PartTele.Position).Magnitude >= 100 then
                    stopTeleport()
                end
            end
        end)
    end
end)

local plr = game.Players.LocalPlayer

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        stopTeleport()
    end)
end

plr.CharacterAdded:Connect(onCharacterAdded)

if plr.Character then
    onCharacterAdded(plr.Character)
end

function TPB(CFgo)
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat, info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end
    
Type = 1
spawn(function()
    while wait() do
		if Type == 1 then
			Pos = CFrame.new(0,PosY,-19)
		elseif Type == 2 then
			Pos = CFrame.new(19,PosY,0)
		elseif Type == 3 then
			Pos = CFrame.new(0,PosY,19)	
		elseif Type == 4 then
			Pos = CFrame.new(-19,PosY,0)
        end
        end
    end)

spawn(function()
    while wait(.1) do
        Type = 1
        wait(0.2)
        Type = 2
        wait(0.2)
        Type = 3
        wait(0.2)
        Type = 4
        wait(0.2)
    end
end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AdvanceDungeon or _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.Factory or _G.FarmBossHallow or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Kill_Ply or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.GrabChest or _G.Holy_Torch or _G.Level or _G.Clip or FarmBoss or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.FarmMaterial or _G.Guitar or _G.Dragon_Trident or _G.tushita or _G.d or _G.waden or _G.gay or _G.pole or _G.saw or _G.ObservationHakiV2 or _G.FarmNearest or _G.FarmChest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.FarmMob or _G.MysticIsland or _G.FarmDungeon or _G.RaidPirate or _G.QuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or Grab_Chest or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Position_Spawn or _G.Farmfast or _G.Race or _G.RaidPirate or Open_Color_Haki or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.bjirFishBoat or _G.KillGhostShip or _G.FrozenDimension or _G.FKitsune then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000,100000,100000)
                        Noclip.Velocity = Vector3.new(0,0,0)
                    end
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AdvanceDungeon or _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.Factory or _G.FarmBossHallow or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Kill_Ply or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.GrabChest or _G.Holy_Torch or _G.Level or _G.Clip or FarmBoss or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.FarmMaterial or _G.Guitar or _G.Dragon_Trident or _G.tushita or _G.d or _G.waden or _G.gay or _G.pole or _G.saw or _G.ObservationHakiV2 or _G.FarmNearest or _G.FarmChest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.FarmMob or _G.MysticIsland or _G.FarmDungeon or _G.RaidPirate or _G.QuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or Grab_Chest or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Position_Spawn or _G.Farmfast or _G.Race or _G.RaidPirate or _G.TushitaSword or Open_Color_Haki or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.bjirFishBoat or _G.KillGhostShip then
                    local player = game:GetService("Players").LocalPlayer
                    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then

                        local state = humanoid:GetState()
                         if state ~= Enum.HumanoidStateType.Seated and state ~= Enum.HumanoidStateType.Running and state ~= Enum.HumanoidStateType.Landed then
                            humanoid:ChangeState(5)
                        end
                    end

                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AdvanceDungeon or _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.Factory or _G.FarmBossHallow or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.NoClip or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Kill_Ply or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.GrabChest or _G.Holy_Torch or _G.Level or _G.Clip or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.FarmMaterial or _G.Guitar or _G.Dragon_Trident or _G.tushita or _G.waden or _G.pole or _G.saw or _G.ObservationHakiV2 or _G.FarmNearest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Kai or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.FarmMob or _G.MysticIsland or _G.FarmDungeon or _G.RaidPirate or _G.QuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Position_Spawn or _G.TPB or _G.Farmfast or _G.Race or _G.RaidPirate or Open_Color_Haki or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.FrozenDimension or _G.FKitsune then
                    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
    
    function InstancePos(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    function TP3(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    spawn(function()
        while wait() do
            if _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.FarmBossHallow or _G.Factory or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.NoClip or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.Level or _G.Clip or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.d or _G.waden or _G.gay or _G.ObservationHakiV2 or _G.FarmMaterial or _G.FarmNearest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.RaidPirate or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or _G.AttackDummy or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Farmfast or _G.RaidPirate or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.bjirFishBoat or _G.KillGhostShip == true then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                end)
            end    
        end
    end)
    
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Click or Fastattack then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
   end)

    function StopTween(target)
        if not target then
            _G.StopTween = true
            wait()
            topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            _G.StopTween = false
            _G.Clip = false
        end
        if game.Players.LocalPlayer.Character:FindFirstChild('Highlight') then
    		game.Players.LocalPlayer.Character:FindFirstChild('Highlight'):Destroy()
        end
    end
    
    spawn(function()
        pcall(function()
            while wait() do
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    
    PosY = 25
    
    Kill_At = 28
-------------------------------------------------------------------------------------------------------
local A = Update:Window("Hiếu Roblox","",Enum.KeyCode.RightControl);
local I = A:T("Trạng thái","10734984606")
local Mn = A:T("chung","15712703260")
local St = A:T("Cài Đặt ","15712711639")
local M = A:T("Vật Phẩm","15712717270")
local V4 = A:T("Tộc V4","15712776421")
local Ev = A:T("Sự Kiện","10709783577")
local P = A:T("Người Chơi","10747373176")
local V = A:T("Thị giác","10723346959")
local R = A:T("Tập Kích","10723345749")
local T = A:T("Di Chuyển","15712738876")
local S = A:T("Cửa Hàng","10734952479")
local D = A:T("Trái Ác Quỷ","15712758182")
local Mc = A:T("Máy Chủ","10709782582")
--------------------------------------------------------------------------------------------------------
I:Seperator("Vào Discord")

I:Label("Mọi Người Vào Giao Lưu")
I:Button("Sao Chép Link Discord",function()
setclipboard("https://discord.com/invite/hcJ8PHtkfy") 
end)

I:Seperator("Thời Gian")

Time = I:Label("Thời Gian Hoạt Động")

function UpdateTime()
local GameTime = math.floor(workspace.DistributedGameTime+0.5)
local Hour = math.floor(GameTime/(60^2))%24
local Minute = math.floor(GameTime/(60^1))%60
local Second = math.floor(GameTime/(60^0))%60
Time:Set("[Thời Gian Máy Chủ]: Giờ: "..Hour.." Phút: "..Minute.." Giây: "..Second)
end

spawn(function()
while task.wait() do
pcall(function()
UpdateTime()
end)
end
end)

Client = I:Label("Client")

function UpdateClient()
local Fps = workspace:GetRealPhysicsFPS()
Client:Set("[FPS]: "..Fps)
end

spawn(function()
while true do wait(.1)
UpdateClient()
end
end)

Client1 = I:Label("Client")

function UpdateClient1()
local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
Client1:Set("[PING]: "..Ping)
end

spawn(function()
while true do wait(.1)
UpdateClient1()
end
end)

    I:Seperator("Người Chơi")

    local localrace = I:Label("Tộc")
    
    spawn(function()
        while wait() do
            pcall(function()
                localrace:Set("Race:".." "..game:GetService("Players").LocalPlayer.Data.Race.Value)
            end)
        end
    end)
    
    local localbeli = I:Label("Beli")
    
    spawn(function()
        while wait() do
            pcall(function()
                localbeli:Set("Beli:".." "..game:GetService("Players").LocalPlayer.Data.Beli.Value)
            end)
        end
    end)
    
    local localfrag = I:Label("Điểm Tím")
    
    spawn(function()
        while wait() do
            pcall(function()
                localfrag:Set("Diểm Tím:".." "..game:GetService("Players").LocalPlayer.Data.Fragments.Value)
            end)
        end
    end)
    
    local localbountyhornor = I:Label("Tiền Thưởng")
    
    spawn(function()
        while wait() do
            pcall(function()
                localbountyhornor:Set("Tiền Thưởng:".." "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
            end)
        end
    end)
    
    local localDevil = I:Label("Trái")
    
    spawn(function()
        while wait() do
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                    localDevil:Set("Trái:".." "..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                else
                    localDevil:Set("Không Có Trái")
                end
            end)
        end
    end)
--------------------------------------------------------------------------------------------------------
Mn:Seperator("Vũ Khí")

local WeaponList = {"Võ","Kiếm","Trái","Súng"}
_G.SelectWeapon = "Võ"
Mn:Dropdown("Chọn Vũ Khí",WeaponList,function(V)
_G.SelectWeapon = V
end)

task.spawn(function()
	while wait() do
		pcall(function()
			if _G.SelectWeapon == "Võ" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Kiếm" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Súng" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Trái" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			end
		end)
	end
    end)

local AttackList = {"Bình Thường", "Nhanh", "Siêu Nhanh", "Cực Nhanh"}
_G.FastAttackDelay = "Bình Thường"
Mn:Dropdown("Tốc Độ Đánh", AttackList,function(V)
    _G.FastAttackDelay = V
end)
spawn(function()
    while wait(.1) do
        if _G.FastAttackDelay then
            pcall(function()
                if _G.FastAttackDelay == "Bình Thường" then
                    _G.FastAttackDelay = 0.13
                elseif _G.FastAttackDelay == "Nhanh" then
                    _G.FastAttackDelay = 0.07
                elseif _G.FastAttackDelay == "Siêu Nhanh" then
                    _G.FastAttackDelay = 0.04
                elseif _G.FastAttackDelay == "Cực Nhanh" then
                    _G.FastAttackDelay = 0
                end
            end)
        end
    end
end)

_G.FastAttack = true

if _G.FastAttack then
    local _ENV = (getgenv or getrenv or getfenv)()

    local function SafeWaitForChild(parent, childName)
        local success, result = pcall(function()
            return parent:WaitForChild(childName)
        end)
        if not success or not result then
            warn("noooooo: " .. childName)
        end
        return result
    end

    local function WaitChilds(path, ...)
        local last = path
        for _, child in {...} do
            last = last:FindFirstChild(child) or SafeWaitForChild(last, child)
            if not last then break end
        end
        return last
    end

    local VirtualInputManager = game:GetService("VirtualInputManager")
    local CollectionService = game:GetService("CollectionService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TeleportService = game:GetService("TeleportService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer

    if not Player then
        warn("Không tìm thấy người chơi cục bộ.")
        return
    end

    local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
    if not Remotes then return end

    local Validator = SafeWaitForChild(Remotes, "Validator")
    local CommF = SafeWaitForChild(Remotes, "CommF_")
    local CommE = SafeWaitForChild(Remotes, "CommE")

    local ChestModels = SafeWaitForChild(workspace, "ChestModels")
    local WorldOrigin = SafeWaitForChild(workspace, "_WorldOrigin")
    local Characters = SafeWaitForChild(workspace, "Characters")
    local Enemies = SafeWaitForChild(workspace, "Enemies")
    local Map = SafeWaitForChild(workspace, "Map")

    local EnemySpawns = SafeWaitForChild(WorldOrigin, "EnemySpawns")
    local Locations = SafeWaitForChild(WorldOrigin, "Locations")

    local RenderStepped = RunService.RenderStepped
    local Heartbeat = RunService.Heartbeat
    local Stepped = RunService.Stepped

    local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
    local Net = SafeWaitForChild(Modules, "Net")

    local sethiddenproperty = sethiddenproperty or function(...) return ... end
    local setupvalue = setupvalue or (debug and debug.setupvalue)
    local getupvalue = getupvalue or (debug and debug.getupvalue)

    local Settings = {
        AutoClick = true,
        ClickDelay = 0,
    }

    local Module = {}

    Module.FastAttack = (function()
        if _ENV.rz_FastAttack then
            return _ENV.rz_FastAttack
        end

        local FastAttack = {
            Distance = 100,
            attackMobs = true,
            attackPlayers = true,
            Equipped = nil
        }

        local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
        local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

        local function IsAlive(character)
            return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
        end

        local function ProcessEnemies(OthersEnemies, Folder)
            local BasePart = nil
            for _, Enemy in Folder:GetChildren() do
                local Head = Enemy:FindFirstChild("Head")
                if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                    if Enemy ~= Player.Character then
                        table.insert(OthersEnemies, { Enemy, Head })
                        BasePart = Head
                    end
                end
            end
            return BasePart
        end

        function FastAttack:Attack(BasePart, OthersEnemies)
            if not BasePart or #OthersEnemies == 0 then return end
            RegisterAttack:FireServer(Settings.ClickDelay or 0)
            RegisterHit:FireServer(BasePart, OthersEnemies)
        end

        function FastAttack:AttackNearest()
            local OthersEnemies = {}
            local Part1 = ProcessEnemies(OthersEnemies, Enemies)
            local Part2 = ProcessEnemies(OthersEnemies, Characters)
            if #OthersEnemies > 0 then
                self:Attack(Part1 or Part2, OthersEnemies)
            else
                task.wait(0)
            end
        end

        function FastAttack:BladeHits()
            local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
            if Equipped and Equipped.ToolTip ~= "Gun" then
                self:AttackNearest()
            else
                task.wait(0)
            end
        end

        task.spawn(function()
            while task.wait(Settings.ClickDelay) do
                if Settings.AutoClick then
                    FastAttack:BladeHits()
                end
            end
        end)

        _ENV.rz_FastAttack = FastAttack
        return FastAttack
    end)()
end

Mn:Seperator("Tự Động Cày")

    Mn:Toggle("Cày Cấp",_G.Farm,function(V)
        _G.Level = V
        StopTween(_G.Farm)
    end)
    
    spawn(function()
        while wait() do
            if _G.Level then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMagnet = false
                        CheckQuest()
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 3500 then
						BTP(CFrameQuest)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 3500 then
						TP1(CFrameQuest)
						end
					else
						TP1(CFrameQuest)
					end
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                            
                                                PosMon = v.HumanoidRootPart.CFrame
                                                TP1(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                StartMagnet = true
                                            until not _G.Level or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            StartMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            TP1(CFrameMon)
                            UnEquipWeapon(_G.SelectWeapon)
                            StartMagnet = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                             TP1(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    
if World1 then
    Mn:Toggle("Cày Cấp Nhanh ( Cấp 1-300 )",_G.FarmFast,function(V)
        _G.Farmfast = V
        StopTween(_G.Farmfast)
    end)
    
    spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 10 then
					    _G.Level = false
					    _G.Farmfast = true
					end
				end
			end
		end)
	end)
	
    spawn(function()
        while wait() do
            if _G.Farmfast and World1 then
                pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 10 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Shanda" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        StardMag = true
                                        FastMon = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        TP1(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Farmfast or not v.Parent or v.Humanoid.Health <= 0
                                    StardMag = false
                                    TP1(CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531))
                                    UnEquipWeapon(_G.SelectWeapon)
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Shanda") then
                            TP1(game:GetService("ReplicatedStorage"):FindFirstChild("Shanda").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                end)
            end
        end
    end)
	
	spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 75 then
						_G.Farmfast = false
						_G.PlayerHunter = true
					end
				end
			end
		end)
	end)

spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 200 then
				    	_G.Level = true
						_G.PlayerHunter = false
					end
				end
			end
		end)
	end)
end

Mn:Toggle("Cày Cấp Và Mua Item",false,function(V)
       _G.Level = V
       _G.SelectWeapon = "Combat"
       _G.Stats_Kaitun = V
       _G.Superhuman = V
       _G.SecondSea = V
       _G.ThirdSea = V
       _G.BuyLegendarySword = V
       _G.StoreFruit = V
       _G.Random_Auto = V
       _G.BuyAllAib = V
       _G.BuyAllSword = V
      StopTween(_G.Farm)
    end)
    
    spawn(function()
        while wait() do
            if _G.BuyAllSword then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
                    if _G.BuyHop then
                        wait(10)
                        Hop()
                    end
                end)
            end 
        end
    end)
    
    spawn(function()
        while wait() do
            if _G.BuyAllAib then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
                    if _G.HopBuy then
                        wait(10)
                        Hop()
                    end
                end)
            end 
        end
    end)
    
   Mn:Toggle("Đánh Quái Ở Gần",_G.FarmNearest,function(V)
   _G.FarmNearest = V
   StopTween(_G.FarmNearest)
 end)
   
spawn(function()
	while wait() do
		if _G.FarmNearest then
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name and v:FindFirstChild("Humanoid") then
			        if v.Humanoid.Health > 0 then
			            repeat wait()
			              EquipWeapon(_G.SelectWeapon)
			                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
			                	local args = {
				                	[1] = "Buso"
			                	}
			                	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			               	end
			                topos(v.HumanoidRootPart.CFrame * Pos)
			                v.HumanoidRootPart.CanCollide = false
			                Fastattack = true
			                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
				       	    AutoFarmNearestMagnet = true
				       	    PosMon = v.HumanoidRootPart.CFrame
			            until not _G.FarmNearest or not v.Parent or v.Humanoid.Health <= 0 
			            AutoFarmNearestMagnet = false
			            Fastattack = false
			        end
			    end
			end
		end
	end
    end)
  
Mn:Seperator("Rương")

Mn:Toggle("Nhặt Rương",false,function(V)
    _G.FarmChest = V
    StopTween(_G.FarmChest)
end)
 
spawn(function()
	while wait() do
		if _G.FarmChest then
			local Players = game:GetService("Players")
			local Player = Players.LocalPlayer
			local Character = Player.Character or Player.CharacterAdded:Wait()
			local Position = Character:GetPivot().Position
			local CollectionService = game:GetService("CollectionService")
			local Chests = CollectionService:GetTagged("_ChestTagged")
			local Distance, Nearest = math.huge
			for i = 1, #Chests do
				local Chest = Chests[i]
				local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
				if (not Chest:GetAttribute("IsDisabled") and (Magnitude < Distance)) then
					Distance, Nearest = Magnitude, Chest
				end
			end
			if Nearest then
				local ChestPosition = Nearest:GetPivot().Position
				local CFrameTarget = CFrame.new(ChestPosition)
				topos(CFrameTarget)
			end
		end
	end
end)

Mn:Toggle("Nhặt Rương Bypass (Anti Reset)",false,function(V)
	_G.ChestBypass = V
end)

spawn(function()
    while wait() do
        if _G.ChestBypass then
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local CollectionService = game:GetService("CollectionService")
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local StartTime = tick()
            while tick() - StartTime < 4 do
                Character = Player.Character or Player.CharacterAdded:Wait()
                local Position = Character:GetPivot().Position
                local Chests = CollectionService:GetTagged("_ChestTagged")
                local Distance, Nearest = math.huge
                for i = 1, #Chests do
                    local Chest = Chests[i]
                    local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                    if (not Chest:GetAttribute("IsDisabled") and (Magnitude < Distance)) then
                        Distance, Nearest = Magnitude, Chest
                    end
                end
                if Nearest then
                    local ChestPosition = Nearest:GetPivot().Position
                    Character:PivotTo(CFrame.new(ChestPosition))
                    task.wait(0.2)
                else
                    break
                end
            end
            if Player.Character then
                Player.Character:BreakJoints()
                Player.CharacterAdded:Wait()
            end
        end
    end
end)
    
    Mn:Seperator("Elite")
    
    local Elite_Hunter_Status = Mn:Label("N/A")

	spawn(function()
		while wait() do
			pcall(function()
				if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
					Elite_Hunter_Status:Set("Trạng thái: Có")	
				else
					Elite_Hunter_Status:Set("Trạng thái: Không")	
				end
			end)
		end
	end)
	
    Mn:Toggle("Đánh Elite Hunter",_G.Elitehunter,function(V)
        _G.Elitehunter = V
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        StopTween(_G.Elitehunter)
    end)
    
    spawn(function()
        while wait() do
            if _G.Elitehunter and World3 then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat wait()
												AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.Elitehunter == false or v.Humanoid.Health <= 0 or not v.Parent
										end
									end
								end
							else
								if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
								end
							end                    
						end
					else
						if _G.EliteHunterHop and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
							hop()
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
						end
					end
				end)
			end
		end
	end)
    
    Mn:Toggle("Đánh Elite Đổi Sever",_G.EliteHunterHop,function(V)
        _G.EliteHunterHop = V
    end)
       
    Mn:Seperator("Nhiệm Vụ")
   
local ListB = {"Không Nhận", "Nhận"}
Mode = "Nhận"
Mn:Dropdown("Nhận Nhiệm Vụ Xương Và Bánh ngọt", ListB,function(V)
    Mode = V
end)
    
    local CakeQuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
      
    spawn(function()
        while wait() do
            if Mode == "Nhận" and _G.DoughtBoss and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" or v.Name == "Dough King" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.DoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if Mode and _G.DoughtBoss and World3 and not game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, "Cookie Crafter") then
                        MagnetDought = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        MagnetDought = false
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakeQuestPos.Position).Magnitude > 3500 then
						BTP(CakeQuestPos)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakeQuestPos.Position).Magnitude < 3500 then
						topos(CakeQuestPos)
						end
					else
						topos(CakeQuestPos)
					end
                    if (CakeQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then                            
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CakeQuest1",1)
					end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                            
                                                PosMonCake = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                                MagnetDought = true
                                                PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                            until not _G.DoughtBoss or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                        else
                                            MagnetDought = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            MagnetDought = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                             topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local BoneQuestPos = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)

    spawn(function()
        while wait() do
            if Mode == "Nhận" and _G.Bone and World3 then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, "Demonic Soul") then
                        StartMagnetBoneMon = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMagnetBoneMon = false
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 3500 then
						BTP(BoneQuestPos)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude < 3500 then
						topos(BoneQuestPos)
						end
					else
						topos(BoneQuestPos)
					end
                    if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then    
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",1)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                            
                                                PosMonBone = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                                StartMagnetBoneMon = true
                                            until not _G.Bone or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            StartMagnetBoneMon = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            StartMagnetBoneMon = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]") then
                             topos(game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]").HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                            end
                        end
                    end
                end)
            end
        end
    end)
    
Mn:Seperator("Xương")
 
BoneCheck = Mn:Label("Xương Của Bạn: N/A")
    
    spawn(function()
        while wait() do
            pcall(function()
                BoneCheck:Set("Xương Của Bạn: "..(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check")))
            end)
        end
    end)

    Mn:Toggle("Cày Xương",_G.Bone,function(V)
        _G.Bone = V
        StopTween(_G.Bone)
    end)
   local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
    spawn(function()
        while wait() do 
            if Mode == "Không Nhận" and _G.Bone and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                               if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                   repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartMagnetBoneMon = true
                                        PosMonBone = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Bone or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 3500 then
			        BTP(BonePos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude < 3500 then
				    topos(BonePos)
					end
				else
				    topos(BonePos)
				end
				        UnEquipWeapon(_G.SelectWeapon)
                        StartMagnetBoneMon = false
						topos(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                        for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                            if v.Name == "Reborn Skeleton" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif v.Name == "Living Zombie" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif v.Name == "Demonic Soul" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif v.Name == "Posessed Mummy" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            end
                        end
                    end
                end)
            end
        end
    end)    

    Mn:Toggle("Đổi Xương",_G.Random_Bone,function(V)
        _G.Random_Bone = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Random_Bone then    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                end
            end
        end)
    end)
    
    Mn:Toggle("Tự động cầu nguyện",pry,function(V)
    _G.Pray = V
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Pray then    
                    TP1(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",1)
                end
            end
        end)
    end)
    
    Mn:Toggle("Tự động thử vận may",Trylux,function(V)
    _G.Trylux = V
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Trylux then    
                    TP1(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2)
                end
            end
        end)
    end)

    Mn:Seperator("Bột")

    local MobKilled = Mn:Label("Killed")
    
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    MobKilled:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    MobKilled:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    MobKilled:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
                else
                    MobKilled:Set("Boss Is Spawning")
                end
            end)
        end
    end)
    
    Mn:Toggle("Đánh Tư Lệnh Bột",_G.DoughtBoss,function(V)
        _G.DoughtBoss = V
        StopTween(_G.DoughtBoss)
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
                end
            end)
        end
    end)
    
    local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
    spawn(function()
        while wait() do
            if Mode == "Không Nhận" and _G.DoughtBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.DoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if KillMob == 0 then
                            end                    
                            if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false 
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    MagnetDought = true
                                                    PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                until not _G.DoughtBoss or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                            end
                                        end
                                    end
                                else
                                if BypassTP then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude > 3500 then
						        BTP(CakePos)
						        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude < 3500 then
						        topos(CakePos)
						        end
					        else
						        topos(CakePos)
					        end
                                    MagnetDought = false
                                    UnEquipWeapon(_G.SelectWeapon)
                                    topos(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                            else
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                                end
                                            end
                                        end
                                    end                       
                                end
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                    topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)    
    
    Mn:Toggle("Tự Động Triệu Hồi Tư Lệnh",false,function(V)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",value)
    end)
    
    Mn:Toggle("Vua bột tự động", _G.doughking,function(V)
         _G.doughking = V
        StopTween( _G.doughking)
    end)
    
    Mn:Toggle("Vua bột tự động Đổi Sever", _G.doughkingHop,function(V)
         _G.doughkingHop = V
    end)
    
    spawn(function()
        while wait() do
            if  _G.doughking and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Dough King" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.doughking or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-2662.818603515625, 1062.3480224609375, -11853.6953125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.doughkingHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
   Mn:Seperator("Thông Thạo")
    
    Mn:Toggle("Cày Thông Thạo Trái",_G.FarmFruitMastery,function(V)
        _G.FarmFruitMastery = V
        StopTween(_G.FarmFruitMastery)
        if _G.FarmFruitMastery == false then
            UseSkill = false 
        end
    end)
    
    spawn(function()
        while wait() do
            if _G.FarmFruitMastery then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        Magnet = false
                        UseSkill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMasteryFruitMagnet = false
                        UseSkill = false
                        CheckQuest()
                        repeat wait()
                            TP1(CFrameQuest)
                        until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.FarmFruitMastery
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                            wait(0.1)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            HealthMs = v.Humanoid.MaxHealth * Kill_At/100
                                            repeat task.wait()
                                                if v.Humanoid.Health <= HealthMs then
                                                    AutoHaki()
                                                    EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                    TP1(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                                    v.HumanoidRootPart.CanCollide = false
                                                    PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    UseSkill = true
                                                else           
                                                    UseSkill = false 
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    TP1(v.HumanoidRootPart.CFrame * Pos)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                end
                                                StartMasteryFruitMagnet = true
                                            until not _G.FarmFruitMastery or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            UseSkill = false
                                            StartMasteryFruitMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            TP1(CFrameMon)
                            UnEquipWeapon(_G.SelectWeapon)
                            StartMasteryFruitMagnet = false   
                            UseSkill = false 
                            local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                            if Mob then
                                TP1(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                            else
                                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                    task.wait()
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if UseSkill then
                pcall(function()
                    CheckQuest()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                            MasBF = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                            MasBF = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then                      
                            if _G.SkillZ then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                            end
                            if _G.SkillX then          
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                                wait(2)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then   
                            if _G.SkillZ then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                            end
                            if _G.SkillX then        
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                            end
                            if _G.SkillC then 
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                                wait(2)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                            if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                            end
                            if _G.SkillX then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                            end
                            if _G.SkillV then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                            if _G.SkillZ then 
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                            end
                            if _G.SkillX then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                            end
                            if _G.SkillV then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                if UseSkill then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                        if v.Name == "NotificationTemplate" then
                            if string.find(v.Text,"Skill locked!") then
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
        end)
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").RenderStepped:Connect(function()
                if UseSkill then
                    local args = {
                        [1] = PosMonMasteryFruit.Position
                    }
                    game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                end
            end)
        end)
    end)
    
    Mn:Toggle("Cày Thông Thạo Súng ",_G.FarmGunMastery,function(V)
        _G.FarmGunMastery = V
        StopTween(_G.FarmGunMastery)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.FarmGunMastery then
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        Magnet = false                                      
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMasteryGunMagnet = false
                        CheckQuest()
                        TP1(CFrameQuest)
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            pcall(function()
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Mon then
                                        repeat task.wait()
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                HealthMin = v.Humanoid.MaxHealth * Kill_At/100
                                                if v.Humanoid.Health <= HealthMin then                                                
                                                    EquipWeapon(SelectWeaponGun)
                                                    TP1(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(2,2,1)
                                                    v.Head.CanCollide = false                                                
                                                    local args = {
                                                        [1] = v.HumanoidRootPart.Position,
                                                        [2] = v.HumanoidRootPart
                                                    }
                                                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                                else
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Head.CanCollide = false               
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    TP1(v.HumanoidRootPart.CFrame * Pos)
                                                end
                                                StartMasteryGunMagnet = true 
                                                PosMonMasteryGun = v.HumanoidRootPart.CFrame
                                            else
                                                StartMasteryGunMagnet = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        until v.Humanoid.Health <= 0 or _G.FarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMasteryGunMagnet = false
                                    end
                                end
                            end)
                        else
                           TP1(CFrameMon)
                           UnEquipWeapon(_G.SelectWeapon)
                            _G.FarmGunMastery = false
                            local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                            if Mob then
                                TP1(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                            else
                                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                    task.wait()
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                end
                            end
                        end 
                    end
                end
            end
        end)
    end)
                
    Mn:Seperator("Quan sát")
    
    Mn:Toggle("Cày Điểm Haki Quan Sát",_G.Observation,function(V)
        _G.Observation = V
        StopTween(_G.Observation)
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Observation then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.Observation
                end
            end)
        end
    end)
   
    Mn:Toggle("Cày Điểm Haki Đổi Sever",_G.Observation_Hop,function(V)
        _G.Observation_Hop = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Observation then
                    if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                        wait(2)
                    else
                        if World2 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until _G.Observation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                            wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.Observation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until _G.Observation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                            end
                        elseif World1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until _G.Observation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.Observation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until _G.Observation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                            end
                        elseif World3 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until _G.Observation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.Observation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until _G.Observation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                            end
                        end
                    end
                end
            end
        end)
    end)
    
    Mn:Seperator("Trùm")
    
    local Boss = Mn:Label("Trạng thái : Chọn Trùm")

	spawn(function()
		while wait() do
			pcall(function()
				if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) or game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
					Boss:Set("Trạng thái : Có")	
				else
					Boss:Set("Trạng thái : Không")	
				end
			end)
		end
	end)
    
    if World1 then
        Mn:Dropdown("Chọn Trùm",{
            "The Gorilla King",
            "Bobby",
            "Yeti",
            "Mob Leader",
            "Vice Admiral",
            "Warden",
            "Chief Warden",
            "Swan",
            "Magma Admiral",
            "Fishman Lord",
            "Wysper",
            "Thunder God",
            "Cyborg",
            "Saber Expert"
            },function(V)
            _G.SelectBoss = V
        end)
    end
    
    if World2 then
        Mn:Dropdown("Chọn Trùm",{
            "Diamond",
            "Jeremy",
            "Fajita",
            "Don Swan",
            "Smoke Admiral",
            "Cursed Captain",
            "Darkbeard",
            "Order",
            "Awakened Ice Admiral",
            "Tide Keeper"
            },function(V)
            _G.SelectBoss = V
        end)
    end
    
    if World3 then
        Mn:Dropdown("Chọn Trùm",{
            "Stone",
            "Island Empress",
            "Kilo Admiral",
            "Captain Elephant",
            "Beautiful Pirate", 
            "rip_indra True Form",
            "Longma",
            "Soul Reaper",
            "Cake Queen"
            },function(V)
            _G.SelectBoss = V
        end)
    end
    
    Mn:Toggle("Đánh Trùm Đã Chọn",_G.FarmBoss,function(V)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        _G.FarmBoss = V
        StopTween(_G.FarmBoss)
    end)
    
    spawn(function()
        while wait() do
            if _G.FarmBoss and BypassTP then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.FarmBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
						if ((game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
							topos(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
						else
							BTP(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
					    end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if _G.FarmBoss and not BypassTP then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.FarmBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        end
                    end
                end)
            end
        end
    end)

    Mn:Toggle("Đánh Tất Cả Trùm",_G.AllBoss,function(V)
        _G.AllBoss = V
        StopTween(_G.AllBoss)
    end)
    
    Mn:Toggle("Đánh Tất Cả Trùm Đổi sever",_G.AllBossHop,function(V)
        _G.AllBossHop = V
    end)
    
    spawn(function()
        while wait() do
            if _G.AllBoss then
                pcall(function()
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if (v.Name == "rip_indra" or v.Name == "Ice Admiral") or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg") or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard") or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                    topos(v.HumanoidRootPart.CFrame*Pos)
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until v.Humanoid.Health <= 0 or _G.AllBoss == false or not v.Parent
                            end
                        else
                            if _G.AllBossHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
--------------------------------------------------------------------------------------------------------
St:Seperator("Cày Đặt")

St:Toggle("Duy Chuyển Dạng Reset",BypassTP,function(V)
BypassTP = V
end)

St:Seperator("Bay")

local SpeedList = {"100", "150", "250", "300", "325", "350"}
getgenv().TweenSpeed = "325"
St:Dropdown("Tốc Độ Bay", SpeedList,function(V)
    getgenv().TweenSpeed = V
end)

    St:Button("Dừng Bay",function()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        _G.Clip = false
    end)
 
St:Toggle("Gôm Quái",true,function(Mag)
    _G.BringMonster = Mag
    end)
    spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringMonster then
                    CheckQuest()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.Level and StartMagnet and v.Name == Mon and (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon == "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        elseif _G.Level and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        end
                    end
                end
            end)
        end
    end)
    
local Bring = {"Ít", "Vừa", "Nhiều"}
_G.BringMode = "Ít"
St:Dropdown("Chế Độ Gôm Quái", Bring,function(V)
    _G.BringMode = V
end)
spawn(function()
    while wait(.1) do
        if _G.BringMode then
            pcall(function()
                if _G.BringMode == "Ít" then
                    _G.BringMode = 250
                elseif _G.BringMode == "Vừa" then
                    _G.BringMode = 300
                elseif _G.BringMode == "Nhiều" then
                    _G.BringMode = 350
                end
            end)
        end
    end
end)
    
St:Toggle("Tự Động Mở Haki",true,function(V)
_G.Haki = V
end)
spawn(function()
    while wait(.1) do
        if _G.Haki then 
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

St:Toggle("Tự Động Nhấp chuột",false,function(V)
_G.Click = V
end)

St:Toggle("Tắt Thông Báo",false,function(V)
_G.Remove_trct = V
end)

spawn(function()
	while wait() do
		if _G.Remove_trct then
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
		else
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
		end
	end
end)

St:Toggle("Tắt Dame",true,function(Remo)
_G.KobenHeegeen = Remo
end)

spawn(function()
	while wait() do
		if _G.KobenHeegeen then
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
		else
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
		end
	end
end)

spawn(function()
   while wait() do
      if _G.WhiteScreen then
        for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
            if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "DamageCounter" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds" then
                v:Destroy() 
            end
        end
    end
    end
end) 
    
St:Toggle("Màng Hình Trắng",_G.WhiteScreen,function(V)
    _G.WhiteScreen = V
if _G.WhiteScreen == true then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
elseif _G.WhiteScreen == false then
    game:GetService("RunService"):Set3dRenderingEnabled(true)
end
end)

    St:Toggle("Ẩn Quái",_G.inv,function(V)
    _G.inv = V
    
         while wait() do
             if _G.inv then
             pcall(function()
     for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
         if v.ClassName == "MeshPart" then
             v.Transparency = 1
     end
     end
     for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
         if v.Name == "Head" then
         v.Transparency = 1
     end
     end
         for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
             if v.ClassName == "Accessory" then
                 v.Handle.Transparency = 1
             end
         end
         for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
             if v.ClassName == "Decal" then
             v.Transparency = 1
              end
            end
          end)
        end
      end
    end)
    
    St:Seperator("Cày Đặt Cày Thông Thạo")
    
    St:Toggle("Kỹ năng Z",true,function(V)
        _G.SkillZ = V
    end)
 
    St:Toggle("Kỹ năng X",true,function(V)
        _G.SkillX = V
    end)
    
    St:Toggle("Kỹ năng C",true,function(V)
        _G.SkillC = V
    end)
    
     St:Toggle("Kỹ năng V",true,function(V)
        _G.SkillV = V
    end)
--------------------------------------------------------------------------------------------------------
if World1 or World2 then
    M:Seperator("World")
end

    if World1 then
        M:Toggle("Tự Động Qua Biển 2",_G.SecondSea,function(V)
            _G.SecondSea = V
            StopTween(_G.SecondSea)
        end)
    
        spawn(function()
            while wait() do 
                if _G.SecondSea then
                    pcall(function()
                        local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if MyLevel >= 700 and World1 then
                            if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                                repeat topos(CFrame1) wait() until (CFrame1.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.SecondSea == false
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                                wait(0.5)
                                EquipWeapon("Key")
                                repeat topos(CFrame.new(1347.7124, 37.3751602, -1325.6488)) wait() until (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.SecondSea == false
                                wait(0.5)
                            else
                                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Ice Admiral" then
                                                if not v.Humanoid.Health <= 0 then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        OldCFrameSecond = v.HumanoidRootPart.CFrame
                                                        repeat task.wait()
                                                            AutoHaki()
                                                            EquipWeapon(_G.SelectWeapon)
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                            v.HumanoidRootPart.CFrame = OldCFrameSecond
                                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until not _G.SecondSea or not v.Parent or v.Humanoid.Health <= 0
                                                    end
                                                else 
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                                end
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end

    if World2 then

        M:Toggle("Tự Động Qua Biển 3",_G.ThirdSea,function(V)
            _G.ThirdSea = V
            StopTween(_G.ThirdSea)
        end)
    
        spawn(function()
            while wait() do
                if _G.ThirdSea then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                            _G.Level = false
                            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then
                                topos(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                                if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                                end
                                wait(1.8)
                                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "rip_indra" then
                                            OldCFrameThird = v.HumanoidRootPart.CFrame
                                            repeat task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CFrame = OldCFrameThird
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.ThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                                    topos(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
    
    if World2 then
        M:Toggle("Đánh Nhà Máy",_G.Factory,function(V)
            _G.Factory = V
            StopTween(_G.Factory)
        end)
    
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.Factory then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()         
                                        EquipWeapon(_G.SelectWeapon)           
                                        topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                                    until v.Humanoid.Health <= 0 or _G.Factory == false
                                end
                            end
                        else
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    end
                end)
            end
        end)
    end

    M:Seperator("Võ")
    
    M:Toggle("Tự Động Superhuman",_G.Superhuman,function(V)
        _G.Superhuman = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do 
                if _G.Superhuman then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                        UnEquipWeapon("Combat")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end   
                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                        _G.SelectWeapon = "Superhuman"
                    end  
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                            _G.SelectWeapon = "Black Leg"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            _G.SelectWeapon = "Electro"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            _G.SelectWeapon = "Fishman Karate"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            _G.SelectWeapon = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end 
                    end
                end
            end
        end)
    end)
    
    M:Toggle("Tự Động Chân Đen",_G.DeathStep,function(V)
        _G.DeathStep = V
    end)
    
    spawn(function()
        while wait() do wait()
            if _G.DeathStep then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                        _G.SelectWeapon = "Black Leg"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end
            end
        end
    end)
    
    M:Toggle("Tự Động Võ Người Cá",_G.Sharkman,function(V)
        _G.Sharkman = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Sharkman then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                        else 
                            Ms = "Tide Keeper"
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then    
                                        OldCFrameShark = v.HumanoidRootPart.CFrame
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.Head.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.HumanoidRootPart.CFrame = OldCFrameShark
                                            topos(v.HumanoidRootPart.CFrame*CFrame.new(2,20,2))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.Sharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                    end
                                end
                            else
                                topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))
                                wait(3)
                            end
                        end
                    else 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end
                end
            end
        end)
    end)
    
    M:Toggle("Tự Động Võ Điện",_G.ElectricClaw,function(V)
        _G.ElectricClaw = V
        StopTween(_G.ElectricClaw)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do 
                if _G.ElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
                            _G.SelectWeapon = "Electro"
                        end 
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                end
                if _G.ElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            if _G.Level == false then
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.ElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.ElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.ElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif _G.Level == true then
                                _G.Level = false
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.ElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.ElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.ElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                _G.SelectWeapon = "Electric Claw"
                                wait(.1)
                                _G.Level = true
                            end
                        end
                    end
                end
            end
        end)
    end)
    
    M:Toggle("Tự Động Võ Rồng",_G.DragonTalon,function(V)
        _G.DragonTalon = V
    end)
    
    spawn(function()
        while wait() do
            if _G.DragonTalon then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                        _G.SelectWeapon = "Dragon Claw"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                end
            end
        end
    end)
    
    M:Toggle("Tự Động GodHuman",_G.God_Human,function(V)
 _G.God_Human = V
end)
spawn(function()
    while task.wait() do
		if _G.God_Human then
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
						end
					else
					
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						end
					else
					
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						end
					else
					
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
						end
					else
					
					end
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then
							if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true), "Bring") then
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
							end
						end
					else
					
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
				end
			end)
		end
	end
end)

M:Seperator("Nguyên Liệu")

if World2 then
M:Toggle("Cày Vật Chất Phóng Xạ",false,function(V)
Radioactive = V
StopTween(Radioactive)
end)

local MaterialsPos1 = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
    spawn(function()
        while wait() do
            if Radioactive and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Factory Staff" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Radioactive or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos1.Position).Magnitude > 3500 then
			        BTP(MaterialsPos1)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos1.Position).Magnitude < 3500 then
				    topos(MaterialsPos1)
					end
				else
				    topos(MaterialsPos1)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
  
if World2 then  
M:Toggle("Cày Giọt Nước Huyền Bí",false,function(V)
_G.Makori_gay = V
StopTween(_G.Makori_gay)
end)

local MaterialsPos2 = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
spawn(function()
        while wait() do
            if _G.Makori_gay and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Water Fighter" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Makori_gay or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos2.Position).Magnitude > 3500 then
			        BTP(MaterialsPos2)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos2.Position).Magnitude < 3500 then
				    topos(MaterialsPos2)
					end
				else
				    topos(MaterialsPos2)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
    
if World1 or World2 then
M:Toggle("Cày Quặng Nham Thạch",_G.Makori_gay,function(V)
_G.Umm = V
StopTween(_G.Umm)
end)

local MaterialsPos3 = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
spawn(function()
        while wait() do
            if _G.Umm and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Military Spy") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Military Spy" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Umm or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos3.Position).Magnitude > 3500 then
			        BTP(MaterialsPos3)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos3.Position).Magnitude < 3500 then
				    topos(MaterialsPos3)
					end
				else
				    topos(MaterialsPos3)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
   
local MaterialsPos4 = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
spawn(function()
        while wait() do
            if _G.Umm and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Lava Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Umm or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos4.Position).Magnitude > 3500 then
			        BTP(MaterialsPos4)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos4.Position).Magnitude < 3500 then
				    topos(MaterialsPos4)
					end
				else
				    topos(MaterialsPos4)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
    
if World1 then  
M:Toggle("Cày Đôi cánh thiên thần",_G.Makori_gay,function(V)
_G.Wing = V
StopTween(_G.Wing)
end)

local MaterialsPos5 = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
spawn(function()
        while wait() do
            if _G.Wing and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Royal Soldier") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Royal Soldier" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Wing or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos5.Position).Magnitude > 3500 then
			        BTP(MaterialsPos5)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos5.Position).Magnitude < 3500 then
				    topos(MaterialsPos5)
					end
				else
				    topos(MaterialsPos5)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end

if World1 or World2 or World3 then   
M:Toggle("Cày Da",_G.Makori_gay,function(V)
_G.Leather = V
StopTween(_G.Leather)
end)

local MaterialsPos6 = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
spawn(function()
        while wait() do
            if _G.Leather and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Leather or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos6.Position).Magnitude > 3500 then
			        BTP(MaterialsPos6)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos6.Position).Magnitude < 3500 then
				    topos(MaterialsPos6)
					end
				else
				    topos(MaterialsPos6)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos7 = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
    spawn(function()
        while wait() do
            if _G.Leather and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Marine Captain") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Marine Captain" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Leather or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos7.Position).Magnitude > 3500 then
			        BTP(MaterialsPos7)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos7.Position).Magnitude < 3500 then
				    topos(MaterialsPos7)
					end
				else
				    topos(MaterialsPos7)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos8 = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
    spawn(function()
        while wait() do
            if _G.Leather and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jungle Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Jungle Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.Leather or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos8.Position).Magnitude > 3500 then
			        BTP(MaterialsPos8)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos8.Position).Magnitude < 3500 then
				    topos(MaterialsPos8)
					end
				else
				    topos(MaterialsPos8)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
 end
  
if World1 or world2 or World3 then    
M:Toggle("Cày Kim loại phế liệu",false,function(V)
Scrap = V
StopTween(Scrap)
end)

local MaterialsPos9 = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
spawn(function()
        while wait() do
            if Scrap and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Brute") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Brute" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Scrap or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos9.Position).Magnitude > 3500 then
			        BTP(MaterialsPos9)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos9.Position).Magnitude < 3500 then
				    topos(MaterialsPos9)
					end
				else
				    topos(MaterialsPos9)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Brute") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Brute").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos10 = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
    spawn(function()
        while wait() do
            if Scrap and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Mercenary") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Mercenary" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Scrap or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos10.Position).Magnitude > 3500 then
			        BTP(MaterialsPos10)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos10.Position).Magnitude < 3500 then
				    topos(MaterialsPos10)
					end
				else
				    topos(MaterialsPos10)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local MaterialsPos11 = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
    spawn(function()
        while wait() do
            if Scrap and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pirate Millionaire") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pirate Millionaire" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Scrap or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos11.Position).Magnitude > 3500 then
			        BTP(MaterialsPos11)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos11.Position).Magnitude < 3500 then
				    topos(MaterialsPos11)
					end
				else
				    topos(MaterialsPos11)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
    
if World3 then  
M:Toggle("Cày Bột Ca cao",false,function(V)
Cocoafarm = V
StopTween(Cocoafarm)
end)

local MaterialsPos12 = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
spawn(function()
        while wait() do
            if Cocoafarm and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Chocolate Bar Battler" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Cocoafarm or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos12.Position).Magnitude > 3500 then
			        BTP(MaterialsPos12)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos12.Position).Magnitude < 3500 then
				    topos(MaterialsPos12)
					end
				else
				    topos(MaterialsPos12)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
 
if World3 then     
M:Toggle("Cày Vảy Rồng",false,function(V)
Dragon_Scale = V
StopTween(Dragon_Scale)
end)

local MaterialsPos13 = CFrame.new(6752, 565, 315)
spawn(function()
        while wait() do
            if Dragon_Scale and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Dragon Crew Archer" or v.Name == "Dragon Crew Warrior" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Dragon_Scale or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos13.Position).Magnitude > 3500 then
			        BTP(MaterialsPos13)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos13.Position).Magnitude < 3500 then
				    topos(MaterialsPos13)
					end
				else
				    topos(MaterialsPos13)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(6752, 565, 315))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Archer") or game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior") then
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Archer") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Archer").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                         elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                         end
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
  
if World3 then    
M:Toggle("Cày Thuốc Súng",false,function(V)
Gunpowder = V
StopTween(Gunpowder)
end)

local MaterialsPos14 = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
spawn(function()
        while wait() do
            if Gunpowder and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Pistol Billionaire") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pistol Billionaire" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Gunpowder or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos14.Position).Magnitude > 3500 then
			        BTP(MaterialsPos14)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos14.Position).Magnitude < 3500 then
				    topos(MaterialsPos14)
					end
				else
				    topos(MaterialsPos14)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
 
if World3 then     
M:Toggle("Cày Đuôi Cá",false,function(V)
Fish = V
StopTween(Fish)
end)

local MaterialsPos15 = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
spawn(function()
        while wait() do
            if Fish and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Captain") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Fishman Captain" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not Fish or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos15.Position).Magnitude > 3500 then
			        BTP(MaterialsPos15)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos15.Position).Magnitude < 3500 then
				    topos(MaterialsPos15)
					end
				else
				    topos(MaterialsPos15)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end
    
if World3 then  
M:Toggle("Cày Sừng Tê Giác",false,function(V)
MiniHee = V
StopTween(MiniHee)
end)

local MaterialsPos16 = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
spawn(function()
        while wait() do
            if MiniHee and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Mythological Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        MakoriGayMag = true
                                        PosGay = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not MiniHee or not v.Parent or v.Humanoid.Health <= 0
                                    MakoriGayMag = false
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos16.Position).Magnitude > 3500 then
			        BTP(MaterialsPos16)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialsPos16.Position).Magnitude < 3500 then
				    topos(MaterialsPos16)
					end
				else
				    topos(MaterialsPos16)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.StardHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
end

    M:Seperator("nâng cao")
    
    M:Toggle("Tự động đột kích Phoenix",_G.AdvanceDungeon,function(V)
        _G.AdvanceDungeon = V
        StopTween(_G.AdvanceDungeon)
    end)
    
    spawn(function()
        while wait() do
            if _G.AdvanceDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                                topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                                if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                                end
                            end
                        elseif game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            if game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                                topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                                if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Label("Biển 1")
    
    M:Seperator("Saw")
    
    M:Toggle("Đánh Sharks saw", _G.doughking,function(V)
         _G.saw = V
        StopTween( _G.saw)
    end)
    
    M:Toggle("Đánh Shark Saw Đổi Sever", _G.doughkingHop,function(V)
         _G.sawhop = V
    end)
    
    local SharkPos = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
    spawn(function()
        while wait() do
            if  _G.saw and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "The Saw" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.saw or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude > 3500 then
			        BTP(SharkPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude < 3500 then
				    topos(SharkPos)
					end
				else
				    topos(SharkPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                        else
                            if  _G.sawhop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if (_G.FarmSwanGlasses and _G.FarmSwanGlasses_Hop) and World2 and not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                    Hop()
                end
            end
        end)
    end)
    
	M:Seperator("Thanh kiếm Waden")
	
	M:Toggle("Lấy kiếm Waden", _G.waden,function(V)
         _G.waden = V
        StopTween( _G.waden)
    end)
    
    M:Toggle("kiếm Waden Đổi Sever", _G.wadenhop,function(V)
         _G.wadenhop = V
    end)
    
    local NamfonPos = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
    spawn(function()
        while wait() do
            if  _G.waden and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Chief Warden" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.waden or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 3500 then
			        BTP(TridentPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 3500 then
				    topos(TridentPos)
					end
				else
				    topos(TridentPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.wadenhop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Seperator("Râu Xám")
    
    M:Toggle("Đánh Râu Xám", _G.doughking,function(V)
         _G.gay = V
        StopTween( _G.gay)
    end)
    
    M:Toggle("Đánh Râu Xám Đổi Sever", _G.doughkingHop,function(V)
         _G.gayhop = V
    end)
    
    local GayMakPos = CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375)
    spawn(function()
        while wait() do
            if  _G.gay and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Greybeard") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Greybeard" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.gay or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GayMakPos.Position).Magnitude > 3500 then
			        BTP(GayMakPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GayMakPos.Position).Magnitude < 3500 then
				    topos(GayMakPos)
					end
				else
				    topos(GayMakPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.gayhop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Seperator("Saber")
    
    M:Toggle("Tự Động Lấy Saber",_G.Saber,function(V)
				_G.Saber = V
				StopTween(_G.Saber)
			end)
			
			M:Toggle("Saber Đổi Sever",_G.SaberHop,function(V)
				_G.SaberHop = V
			end)
			
 spawn(function()
        while task.wait() do
            if _G.Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
                pcall(function()
                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                wait(1)
                            else
                                topos(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                            end
                        else
                            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                    EquipWeapon("Torch")
                                    topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                                  else
                                  topos(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                                end
                            else
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                    wait(0.5)
                                    EquipWeapon("Cup")
                                    wait(0.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                    wait(0)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                else
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
										topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if v.Name == "Mob Leader" then
                                                   if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        repeat task.wait()
                                                        AutoHaki()
                                                        EquipWeapon(_G.SelectWeapon)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until v.Humanoid.Health <= 0 or not _G.Saber
                                                     end
                                                end
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Farm_Mode)
                                                end
                                            end
                                        end
                                     end
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                        wait(0.5)
                                        EquipWeapon("Relic")
                                        wait(0.5)
                                        topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Saber Expert" then
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            --v.Humanoid:ChangeState(11)
                                            --v.Humanoid:ChangeState(14)
                                            FarmPos = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                        until v.Humanoid.Health <= 0 or not _G.Saber
                                        if v.Humanoid.Health <= 0 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Seperator("Lôi Thể")
    
    M:Toggle("Lấy Gậy Lôi Thể v1", _G.doughking,function(V)
         _G.pole = V
        StopTween( _G.pole)
    end)
    
    M:Toggle("Gậy Lôi Thể Đổi Sever", _G.doughkingHop,function(V)
         _G.polehop = V
    end)
     
local PolePos = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
    spawn(function()
        while wait() do
            if  _G.pole and World1 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Thunder God" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.pole or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PolePos.Position).Magnitude > 3500 then
			        BTP(PolePos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PolePos.Position).Magnitude < 3500 then
				    topos(PolePos)
					end
				else
				    topos(TridentPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.polehop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Label("Biển 2")
    
    M:Seperator("Kiếm Huyền Thoại")

    M:Toggle("Mua Kiếm Huyền Thoại",_G.BuyLegendarySword,function(V)
        _G.BuyLegendarySword = V
    end)
    
    spawn(function()
        while wait() do
            if _G.BuyLegendarySword then
                pcall(function()
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "1"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "3"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    if _G.BuyLegendarySword_Hop and _G.BuyLegendarySword and World2 then
                        wait(10)
                        Hop()
                    end
                end)
            end 
        end
    end)
    
    M:Toggle("Kiếm Huyền Thoại Đổi Sever",_G.BuyLegendarySword_Hop,function(V)
        _G.BuyLegendarySword_Hop = V
    end)
    
    M:Seperator("Haki Màu")
    
    local KuyKoben = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1")
    
    M:Toggle("Mua Haki Màu",_G.BuyEnchancementColour,function(V)
        _G.BuyEnchancementColour = V
    end)
    
    M:Toggle("Haki Màu Đổi Sever",_G.BuyEnchancementColour_Hop,function(V)
        _G.BuyEnchancementColour_Hop = V
    end)
    
    spawn(function()
        while wait() do
            if _G.BuyEnchancementColour then
                local args = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if _G.BuyEnchancementColour_Hop and _G.BuyEnchancementColour and not World1 then
                    wait(10)
                    Hop()
                end
            end 
        end
    end)
    
    M:Seperator("Bartlio")
    
    M:Toggle("Làm Nhiệm Vụ Bartlio",_G.Bartilo,function(V)
        _G.Bartilo = V
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Bartilo then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                                Ms = "Swan Pirate"
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        pcall(function()
                                            repeat task.wait()
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Transparency = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)													
                                                PosMonBarto =  v.HumanoidRootPart.CFrame
                                                AutoBartiloBring = true
                                            until not v.Parent or v.Humanoid.Health <= 0 or _G.Bartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            AutoBartiloBring = false
                                        end)
                                    end
                                end
                            else
                                repeat topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
                            end
                        else
                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end 
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                            Ms = "Jeremy"
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameBartlio
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.Bartilo == false
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                            wait(1)
                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                            wait(2)
                        else
                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        repeat topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.Bartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                    end
                end 
            end
        end)
    end)
    
    M:Seperator("Kính Thiên Nga")
    
    M:Toggle("Lấy Kính Thiên Nga",_G.FarmSwanGlasses,function(V)
        _G.FarmSwanGlasses = V
        StopTween(_G.FarmSwanGlasses)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.FarmSwanGlasses then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Don Swan" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    end)
                                until _G.FarmSwanGlasses == false or v.Humanoid.Health <= 0
                            end
                        end
                    else 
                        repeat task.wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625)) 
                        until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or _G.FarmSwanGlasses == false
                    end
                end
            end
        end)
    end)
    
    M:Toggle("Kính Thiên Nga Đổi Sever",_G.FarmSwanGlasses_Hop,function(V)
        _G.FarmSwanGlasses_Hop = V
    end)
    
    M:Toggle("Tự Động Nâng Tộc V2",_G.EvoRace,function(V)
        _G.EvoRace = V
        StopTween(_G.EvoRace)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.EvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    topos(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    topos(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Zombie" then
                                                repeat task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    PosMonEvo = v.HumanoidRootPart.CFrame
                                                    StartEvoMagnet = true
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.EvoRace == false
                                                StartEvoMagnet = false
                                            end
                                        end
                                    else
                                        StartEvoMagnet = false
                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                    end
                                end
                            end)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                        end
                    end
                end
            end
        end)
    end)
    
    M:Seperator("Vật Chất Kì Dị")
    
    M:Toggle("Cày Vật Chất Kì Dị",_G.Ectoplasm,function(V)
        _G.Ectoplasm = V
        StopTween(_G.Ectoplasm)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Ectoplasm then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    if string.find(v.Name,"Ship") then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        EctoplasmMon = v.HumanoidRootPart.CFrame
                                        StartEctoplasmMagnet = true
                                    else
                                        StartEctoplasmMagnet = false
                                        topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                                    end
                                until _G.Ectoplasm == false or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))                         
                        StartEctoplasmMagnet = false
                        local Distance = (Vector3.new(911.35827636719, 125.95812988281, 33159.5390625) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance > 18000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                    end
                end
            end
        end)
    end)
    
    M:Seperator("Rengoku")
    
    M:Toggle("Lấy Rengoku",_G.Rengoku,function(V)
        _G.Rengoku = V
        StopTween(_G.Rengoku)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Rengoku then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipWeapon("Hidden Key")
                        topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    RengokuMon = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    StartRengokuMagnet = true
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.Rengoku == false or not v.Parent or v.Humanoid.Health <= 0
                                StartRengokuMagnet = false
                            end
                        end
                    else
                        StartRengokuMagnet = false
                        topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)
    
    M:Seperator("Trident")
    
	M:Toggle("Lấy Dragon Trident", _G.Dragon_Trident,function(V)
         _G.Dragon_Trident = V
        StopTween(_G.Dragon_Trident)
    end)
    
    M:Toggle("Lấy Dragon Trident Đổi Sever", _G.Dragon_Trident_Hop,function(V)
         _G.Dragon_Trident_Hop = V
    end)
    
    local TridentPos = CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125)
    spawn(function()
        while wait() do
            if  _G.Dragon_Trident and World2 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Tide Keeper" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Dragon_Trident or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 3500 then
			        BTP(TridentPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 3500 then
				    topos(TridentPos)
					end
				else
				    topos(TridentPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.Dragon_Trident_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Label("Biển 3")
    
    M:Seperator("Rip Indra")
    
    M:Toggle("Đánh Rip_Indra True",_G.DarkDagger,function(V)
        _G.DarkDagger = V
        StopTween(_G.DarkDagger)
    end)
        
    local AdminPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
    spawn(function()
        pcall(function()
            while wait() do
                if _G.DarkDagger then
                    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    end)
                                until _G.DarkDagger == false or v.Humanoid.Health <= 0
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AdminPos.Position).Magnitude > 3500 then
			        BTP(AdminPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AdminPos.Position).Magnitude < 3500 then
				    topos(AdminPos)
					end
				else
				    topos(AdminPos)
				end
				        UnEquipWeapon(_G.SelectWeapon)
                        topos(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                    end
                end
            end
        end)
    end)
    
    M:Toggle("Rip_Indra True Đổi Sever",_G.DarkDagger_Hop,function(V)
        _G.DarkDagger_Hop = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if (_G.DarkDagger_Hop and _G.DarkDagger) and World3 and not game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    Hop()
                end
            end
        end)
    end)
    
M:Toggle("Tự động nhấn nút Haki",_G.Ob_Color,function(V)
	Open_Color_Haki = V
	StopTween(Open_Color_Haki)
end)

spawn(function()
    while wait(.3) do
        pcall(function()
            if Open_Color_Haki then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
            	wait(0.5)
            	repeat topos(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() 
                until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                wait(0.5)
                repeat topos(CFrame.new(-5414.41357, 309.865753, -2212.45776)) wait() 
                until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                wait(0.5)
                repeat topos(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() 
                until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
                wait(0.5)
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
                wait(3)
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
            end
        end) 
    end
end)
    
function EquipAllWeapon()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
                wait(1)
			end
		end
	end)
end

    M:Seperator("Yama")

    M:Toggle("Lấy Yama",_G.Yama,function(V)
        _G.Yama = V
        StopTween(_G.Yama)
    end)
    
    spawn(function()
        while wait() do
            if _G.Yama then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.Yama
                end
            end
        end
    end)
    
    M:Seperator("Musketeer")
    
    M:Toggle("Lấy Musketeer Hat",_G.MusketeerHat,function(V)
        _G.MusketeerHat = V
        StopTween(_G.MusketeerHat)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.MusketeerHat then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Forest Pirate" then
                                        repeat task.wait()
                                            pcall(function()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                MusketeerHatMon = v.HumanoidRootPart.CFrame
                                                StartMagnetMusketeerhat = true
                                            end)
                                        until _G.MusketeerHat == false or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMagnetMusketeerhat = false
                                    end
                                end
                            else
                                StartMagnetMusketeerhat = false
                                topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Captain Elephant" then
                                        OldCFrameElephant = v.HumanoidRootPart.CFrame
                                        repeat task.wait()
                                            pcall(function()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.CFrame = OldCFrameElephant
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            end)
                                        until _G.MusketeerHat == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    end
                                end
                            else
                                topos(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
                        topos(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                    end
                end
            end
        end)
    end)
    
    M:Seperator("Twin Hook")
    
    M:Toggle("Lấy Twin Hook", _G.TwinHook,function(V)
         _G.TwinHook = V
        StopTween( _G.TwinHook)
    end)
    
    M:Toggle("Lấy Twin Hook Đổi Sever", _G.TwinHook_Hop,function(V)
         _G.TwinHook_Hop = V
    end)
    
    local ElephantPos = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
    spawn(function()
        while wait() do
            if  _G.TwinHook and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Captain Elephant" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.TwinHook or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude > 3500 then
			        BTP(ElephantPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude < 3500 then
				    topos(ElephantPos)
					end
				else
				    topos(ElephantPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.TwinHook_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Seperator("Haki")
    
    M:Toggle("Lấy Haki Màu",_G.Rainbow_Haki,function(V)
        _G.Rainbow_Haki = V
        StopTween(_G.Rainbow_Haki)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Rainbow_Haki then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Stone" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Island Empress" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Kilo Admiral" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Beautiful Pirate" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                        end
                    else
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    end
                end
            end
        end)
    end)
    
    M:Toggle("Lấy Haki Quan Sát V2",_G.Observationv2,function(V)
        _G.Observationv2 = V
        StopTween(_G.Observationv2)
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Observationv2 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 then
                        _G.MusketeerHat = false
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and  game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                            repeat 
                                topos(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
                                wait() 
                            until not _G.Observationv2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                            repeat 
                                topos(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
                                wait() 
                            until not _G.Observationv2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
                        else
                            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                                if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
                                    v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
                                    wait()
                                    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
                                    wait()
                                end
                            end   
                        end
                    else
                        _G.MusketeerHat = true
                    end
                end
            end)
        end
    end)
    
    M:Seperator("Carvander")

    M:Toggle("Lấy Cavander", _G.Carvender,function(V)
         _G.Carvender = V
        StopTween( _G.Carvender)
    end)
    
    M:Toggle("Lấy Carvander Đổi Sever", _G.Carvenderhop,function(V)
         _G.Carvenderhop = V
    end)
    
    local CavandisPos = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)
    spawn(function()
        while wait() do
            if  _G.Carvender and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Beautiful Pirate" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Carvender or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude > 3500 then
			        BTP(CavandisPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude < 3500 then
				    topos(CavandisPos)
					end
				else
				    topos(CavandisPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.Cavanderhop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
	M:Seperator("Tushita")

M:Toggle("Lấy Tushita", _G.tushita,function(V)
         _G.tushita = V
        StopTween( _G.tushita)
    end)
    
    M:Toggle("Lấy Tushita Đổi Sever", _G.tushitahop,function(V)
         _G.tushitahop = V
    end)
    
    local TushitaPos = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
    spawn(function()
        while wait() do
            if  _G.tushita and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Longma" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.tushita or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TushitaPos.Position).Magnitude > 3500 then
			        BTP(TushitaPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TushitaPos.Position).Magnitude < 3500 then
				    topos(TushitaPos)
					end
				else
				    topos(TushitaPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.tushitahop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Seperator("Hallow Scythe")
    
    M:Toggle("Lấy Lưỡi Hái",_G.FarmBossHallow,function(V)
        _G.FarmBossHallow = V
        StopTween(_G.FarmBossHallow)
    end)
    
    M:Toggle("Lưỡi Hái Đổi Sever",_G.FarmBossHallowHop,function(V)
        _G.FarmBossHallowHop = V
    end)
    
    spawn(function()
        while wait() do
            if _G.FarmBossHallow then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name , "Soul Reaper") then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame*Pos)
                                    v.HumanoidRootPart.Transparency = 1
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until v.Humanoid.Health <= 0 or _G.FarmBossHallow == false
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                        repeat topos(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8                        
                        EquipWeapon("Hallow Essence")
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.FarmBossHallowHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    M:Seperator("Buddy Sword")
    
    M:Toggle("Lấy Kiếm Buddy",_G.BudySword,function(V)
        _G.BudySword = V
        StopTween(_G.BudySword)
    end)
    
    M:Toggle("Kiếm Buddy Đổi Sever",_G.BudySwordHop,function(V)
        _G.BudySwordHop = V
    end)
    
    local BigMomPos = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
    spawn(function()
        while wait() do
            if _G.BudySword and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Queen" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.BudySword or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BigMomPos.Position).Magnitude > 3500 then
			        BTP(BigMomPos)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BigMomPos.Position).Magnitude < 3500 then
				    topos(BigMomPos)
					end
				else
				    topos(BigMomPos)
				end
				    UnEquipWeapon(_G.SelectWeapon)
                    topos(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if _G.BudySwordHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringMonster then
                    CheckQuest()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.Level and StartMagnet and v.Name == Mon and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        elseif _G.Level and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        end
                        if _G.Ectoplasm and StartEctoplasmMagnet then
                            if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - EctoplasmMon.Position).Magnitude <= _G.BringMode then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CFrame = EctoplasmMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Rengoku and StartRengokuMagnet then
                            if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and (v.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(1500,1500,1500)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = RengokuMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.MusketeerHat and StartMagnetMusketeerhat then
                            if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = MusketeerHatMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.ObservationHakiV2 and Mangnetcitzenmon then
                            if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosHee
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.EvoRace and StartEvoMagnet then
                            if v.Name == "Zombie" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonEvo
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Bartilo and AutoBartiloBring then
                            if v.Name == "Swan Pirate" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBarto
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.FarmFruitMastery and StartMasteryFruitMagnet then
                            if v.Name == "Monkey" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == "Factory Staff" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                        if _G.FarmGunMastery and StartMasteryGunMagnet then
                            if v.Name == "Monkey" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == "Factory Staff" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                        if _G.Bone and StartMagnetBoneMon then
                            if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBone
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.FarmCandy and StartCandyMagnet then
                            if (v.Name == "Ice Cream Chef" or v.Name == "Ice Cream Commander") and (v.HumanoidRootPart.Position - CandyMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = CandyMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if StardFarm and FarmMag then
                            if (v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel") and (v.HumanoidRootPart.Position - PosGG.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosGG
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Farmfast and StardMag then
                            if (v.Name == "Shanda" or v.Name == "Shanda") and (v.HumanoidRootPart.Position - FastMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = FastMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.DoughtBoss and MagnetDought then
                            if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end
            end)
      end
end)

task.spawn(function()
	while true do wait()
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

--BringMobNearrest

function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then 
			return true
		end
		return false
	end
end

task.spawn(function()
	while task.wait() do
		pcall(function()
			if MakoriGayMag and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosGay
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if Anchor and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosNarathiwat
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
    
task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.FarmNearest and AutoFarmNearestMagnet or SelectMag and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
    end)
--------------------------------------------------------------------------------------------------------
    if World1 or World2 then
V4:Label("Hãy Qua Sea 3")
end

if World3 then
    V4:Seperator("Đảo Bí Ẩn")

V4:Toggle("Bay Lại Đảo Bí Ẩn",_G.MysticIsland,function(V)
        _G.MysticIsland = V
        StopTween(_G.MysticIsland)
        end)
    
spawn(function()
    pcall(function()
        while wait() do
            if _G.MysticIsland then
                local mysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if mysticIsland then
                    local position = mysticIsland.WorldPivot.Position
                    topos(CFrame.new(position.X, 500, position.Z))
                end
            end
        end
    end)
end)

V4:Toggle("Bay Đến Chổ Bán Trái",_G.TPNPC,function(V)
             _G.Miragenpc = V
             StopTween(_G.Miragenpc)
        end)

spawn(function()
    pcall(function()
    while wait() do
        if _G.Miragenpc then
            if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
                topos(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
                end
            end
        end
    end)
end)

V4:Button("Đến Chổ Bán Trái", function()
                TweenNpc()
                end)

                function TweenNpc()
                    repeat
                        wait()
                    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                        AllNPCS = getnilinstances()
                        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                            table.insert(AllNPCS, v)
                        end
                        for r, v in pairs(AllNPCS) do
                            if v.Name == "Advanced Fruit Dealer" then
                                topos(v.HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                    
V4:Toggle("Bay Đến Bánh Răng",_G.TweenMGear,function(V)
_G.TweenMGear = V
StopTween(_G.TweenMGear)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
				if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
						if v:IsA("MeshPart")then 
                            if v.Material ==  Enum.Material.Neon then  
                                topos(v.CFrame)
                            end
                        end
					end
				end
			end
        end
    end)
    end)
end

if World3 then
    V4:Seperator("Tộc V4")
    
V4:Button("Bay Đến Đỉnh Cay Đại Thụ",function()
  topos(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625))
end)
    
V4:Button("Dịch chuyển đến đền Thờ thời gian",function()
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
end)
    
V4:Button("Bay Đến Cần Gạt",function()
  topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
end)

V4:Button("Bay Đến Chỗ Bán Bánh Răng",function()
  topos(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
end)

V4:Button("Truy cập đồng hồ", function()
    game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove()
    game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove()
end)

V4:Toggle("Mua Bánh Răng",_G.Bone4,function(V)
 _G.Bone4 = V
 StopTween(_G.Bone4)
end)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Bone4 then
    local args = {
    [1] = true
}

local args = {
    [1] = "UpgradeRace",
    [2] = "Buy"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            end
end 
end)  
end)
 
  V4:Button("Bay Đến Tộc Của Bạn",function()
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
    wait(.1)
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
    wait(.1)
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
    wait(.1)
    Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  wait(0.6)
  topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
  elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  wait(0.6)
  topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
  elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  wait(0.6)
  topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
  elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  wait(0.6)
  topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
  elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  wait(0.6)
  topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
  elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103)
  wait(0.6)
  topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
  end
  end)
  
V4:Button("Bay Đến Đồng Hồ",function()
  topos(CFrame.new(29551.9941, 15069.002, -85.5179291))
end)

  V4:Toggle("Tự Động Hoàng Thành Ải",false,function(v)
  _G.QuestRace = v
  StopTween(_G.QuestRace)
  end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.QuestRace then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.QuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
					for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
						if v.Name ==  "snowisland_Cylinder.081" then
							topos(v.CFrame* CFrame.new(0,0,0))
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
					for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name ==  "HumanoidRootPart" then
							topos(v.CFrame* CFrame.new(PosX,PosY,PosZ))
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
					
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
					topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.QuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
					for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if v.Name == "StartPoint" then
							topos(v.CFrame* CFrame.new(0,10,0))
					  	end
				   	end
				end
			end
        end
    end)
end)

V4:Toggle("Tự Động Cày Và Bậc V4",false,function(V)
    _G.Bone = V
    _G.Bone4 = V
    _G.ActiveV4 = V
    StopTween(_G.Bone)
end)

V4:Toggle("Giết Người Chơi Trial",false,function(V)
    _G.KillAfterTrials = V
    _G.Click = V
    _G.TurnKen = V
    _G.AimNearest = V
    _G.Aimbot_Skill = V
    StopTween(_G.KillAfterTrials)
end)

spawn(function()
    while wait() do 
        pcall(function()
            if _G.KillAfterTrials then
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                        if v.Humanoid.Health > 0 then
                            repeat wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                NameTarget = v.Name
                                TP1(v.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
                                Click()
                            until not _G.KillAfterTrials or not v.Parent or v.Humanoid.Health <= 0 
                        end
                    end
                end
            end
        end)
    end
end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.TurnKen then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.Observation
                end
            end)
        end
    end)

V4:Toggle("Tự động khóa mặt trăng",_G.LockCamToMoon,function(V)
    _G.LockCamToMoon = V
end)

function CamToMoon()
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
end

spawn(function()
pcall(function()
while wait() do
if _G.LockCamToMoon then
   CamToMoon()
end
end
end)
end)
  
  V4:Button("Mua nhiệm vụ cổ đại",function(t)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
  end)
end
--------------------------------------------------------------------------------------------------------
local Cp = Ev:Label("Kiểm Tra Đảo: ")

task.spawn(function()
	while task.wait() do
		pcall(function()
			if game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				Cp:Set("Đảo Núi Lửa : Có!")
			else
				Cp:Set("Đảo Núi Lửa : Không")
			end
		end)
	end
end) 

Ev:Button("Xoá Dung Nham Ở Đảo Núi Lửa",function()
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
		for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
	end)

Ev:Button("Lấp Năm Châm",function()
        local args = {"CraftItem", "Craft", "Volcanic Magnet"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    
Ev:Toggle("Bay Đến Đảo Tiki",false,function(V)
     _G.TpSpy = V
      StopTween(_G.TpSpy)
        task.spawn(function()
            while _G.TpSpy do
                task.wait()
                topos(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
            end
        end)
    end)
    
Ev:Toggle("Tìm Đảo Núi Lửa",false,function(V)
    _G.AutoFindPrehistoric = V
end)

local seatHistory = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Workspace = game:GetService("Workspace")
local SetSpeedBoat = 350  

game:GetService("RunService").RenderStepped:Connect(function()
    for boatName, seat in pairs(seatHistory) do
        if seat and seat.Parent and seat.Name == "VehicleSeat" and not seat.Occupant then
            seatHistory[boatName] = seat
        end
    end
end)

local function tpToMyBoat()
    for boatName, seat in pairs(seatHistory) do
        if seat and seat.Parent and seat.Name=="VehicleSeat" and not seat.Occupant then
            topos(seat.CFrame)
        end
    end
end

local isTeleporting = false
local notified = false
RunService.RenderStepped:Connect(function()
    if not _G.AutoFindPrehistoric then
        notified = false
        return
    end
    local player = Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("Humanoid") then return end
    local function tpToMyBoat()
        if isTeleporting then return end
        isTeleporting = true
        for boatName, seat in pairs(seatHistory) do
            if seat and seat.Parent and seat.Name == "VehicleSeat" and not seat.Occupant then
                topos(seat.CFrame)
                break
            end
        end
        isTeleporting = false
    end
    local humanoid = character.Humanoid
    local boatFound = false
    local currentBoat = nil
    for _, b in pairs(Workspace.Boats:GetChildren()) do
        local seat = b:FindFirstChild("VehicleSeat")
        if seat and seat.Occupant == humanoid then
            boatFound = true
            currentBoat = seat
            seatHistory[b.Name] = seat
        elseif seat and seat.Occupant == nil then
            tpToMyBoat()
        end
    end
    if not boatFound then return end
    currentBoat.MaxSpeed = SetSpeedBoat
    currentBoat.CFrame = CFrame.new(Vector3.new(currentBoat.Position.X, currentBoat.Position.Y, currentBoat.Position.Z)) * currentBoat.CFrame.Rotation
    VirtualInputManager:SendKeyEvent(true, "W", false, game)
    for _, v in pairs(Workspace.Boats:GetDescendants()) do
        if v:IsA("BasePart") then v.CanCollide = false end
    end
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BasePart") then v.CanCollide = false end
    end
    local islandsToDelete = { 
        "ShipwreckIsland", 
        "SandIsland", 
        "TreeIsland",
        "TinyIsland", 
        "MysticIsland", 
        "KitsuneIsland", 
        "FrozenDimension" 
    }
    for _, islandName in ipairs(islandsToDelete) do
        local island = Workspace.Map:FindFirstChild(islandName)
        if island and island:IsA("Model") then
            island:Destroy()
        end
    end
    local prehistoricIsland = Workspace.Map:FindFirstChild("PrehistoricIsland")
    if prehistoricIsland then
        VirtualInputManager:SendKeyEvent(false, "W", false, game)
        _G.AutoFindPrehistoric = false
        if not notified then
            notified = true
        end
        return
    end
end)

Ev:Toggle("Bay Lại Đầu Lâu Đảo Núi Lửa",false,function(V)
    _G.TpPrehistoric = V
    StopTween(_G.TpPrehistoric)
end)

spawn(function()
    local island
    while not island do
        island = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        if _G.TpPrehistoric then
            local prehistoricIslandCore = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIslandCore then
                local relic = prehistoricIslandCore:FindFirstChild("Core") and prehistoricIslandCore.Core:FindFirstChild("PrehistoricRelic")
                local skull = relic and relic:FindFirstChild("Skull")
                if skull then
                    topos(CFrame.new(skull.Position))
                    _G.TpPrehistoric = false
                end
            end
        end
    end
end)

Ev:Toggle("Đánh Golem",false,function(V)
    _G.Kill_Aura = V
    _G.KillGolem = V
    StopTween(_G.KillGolem)
end)

spawn(function()
    while wait() do
        if _G.KillGolem and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Lava Golem") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Lava Golem" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not  _G.KillGolem or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                UnEquipWeapon(_G.SelectWeapon)
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Golem").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.Kill_Aura then
                local player = game:GetService("Players").LocalPlayer
                local enemies = game:GetService("Workspace").Enemies:GetChildren()
                local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
                if playerPos then
                    for _, enemy in pairs(enemies) do
                        if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            local distance = (enemy.HumanoidRootPart.Position - playerPos).Magnitude
                            if distance <= 1000 then
                                pcall(function()
                                    repeat wait()
                                        sethiddenproperty(player, "SimulationRadius", math.huge)
                                        enemy.Humanoid.Health = 0
                                        enemy.HumanoidRootPart.CanCollide = false
                                    until not _G.Kill_Aura or not enemy.Parent or enemy.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

Ev:Toggle("Tự Động Lấp Núi Lửa",false,function(V)
    _G.DefendVolcano = V
    StopTween(_G.DefendVolcano)
end)

local function useSkill(skillKey)
	game:GetService("VirtualInputManager"):SendKeyEvent(true, skillKey, false, game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false, skillKey, false, game)
end

local function removeLava()
	local interiorLavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
	if interiorLavaModel and interiorLavaModel:IsA("Model") then
		interiorLavaModel:Destroy()
	end

	local prehistoricIsland1 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
	if prehistoricIsland1 then
		for _, descendant in pairs(prehistoricIsland1:GetDescendants()) do
			if descendant:IsA("Part") and descendant.Name:lower():find("lava") then
				descendant:Destroy()
			end
		end
	end

	local prehistoricIsland2 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
	if prehistoricIsland2 then
		for _, model in pairs(prehistoricIsland2:GetDescendants()) do
			if model:IsA("Model") then
				for _, child in pairs(model:GetDescendants()) do
					if child:IsA("MeshPart") and child.Name:lower():find("lava") then
						child:Destroy()
					end
				end
			end
		end
	end
end

local function findValidRock()
	local volcanoRocksFolder = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
	for _, Rock in pairs(volcanoRocksFolder:GetChildren()) do
		if Rock:IsA("Model") then
			local volcanorock = Rock:FindFirstChild("volcanorock")
			if volcanorock and volcanorock:IsA("MeshPart") then
				local color = volcanorock.Color
				if color == Color3.fromRGB(185, 53, 56) or color == Color3.fromRGB(185, 53, 57) then
					return volcanorock
				end
			end
		end
	end
	return nil
end

local function equipAndUseSkill(toolType)
	local player = game.Players.LocalPlayer
	local backpack = player.Backpack
	for _, item in pairs(backpack:GetChildren()) do
		if item:IsA("Tool") and item.ToolTip == toolType then
			item.Parent = player.Character
			for _, skill in ipairs({"Z", "X", "C", "V", "F"}) do
				wait()
				pcall(function()
					useSkill(skill)
				end)
			end
			item.Parent = backpack
			break
		end
	end
end

spawn(function()
	while wait() do
		if _G.DefendVolcano then
			AutoHaki()
			pcall(removeLava)
			local currentTarget = findValidRock()
			if currentTarget then
				local targetPosition = CFrame.new(currentTarget.Position)
				topos(targetPosition)
				local color = currentTarget.Color
				if color ~= Color3.fromRGB(185, 53, 56) and color ~= Color3.fromRGB(185, 53, 57) then
					currentTarget = findValidRock()
				else
					local currentPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					local distance = (currentPosition - currentTarget.Position).Magnitude
					if distance <= 1 then
						if _G.UseMelee then
							equipAndUseSkill("Melee")
						end
						if _G.UseSword then
							equipAndUseSkill("Sword")
						end
						if _G.UseGun then
							equipAndUseSkill("Gun")
						end
					end
					_G.TpPrehistoric = false
				end
			else
				_G.TpPrehistoric = true
			end
		end
	end
end)

Ev:Toggle("Lụm Xương",false,function(V)
    _G.CollectBone = V
end)

spawn(function()
    while wait() do
        if _G.CollectBone then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "DinoBone" then
                    topos(CFrame.new(obj.Position))
                end
            end
        end
    end
end)

Ev:Toggle("Lụm Trứng",false,function(V)
    _G.CollectEgg = V
end)

spawn(function()
	while wait() do
		if _G.CollectEgg then
			local dragonEggs = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
			if #dragonEggs > 0 then
				local randomEgg = dragonEggs[math.random(1, #dragonEggs)]
				if randomEgg:IsA("Model") and randomEgg.PrimaryPart then
					topos(randomEgg.PrimaryPart.CFrame)
					local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					local eggPosition = randomEgg.PrimaryPart.Position
					local distance = (playerPosition - eggPosition).Magnitude
					if distance <= 1 then
						game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
						wait(1.5)
						game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
					end
				end
			end
		end
	end
end)

Ev:Seperator("Cài Đặt")

Ev:Toggle("Sử Dụng Võ",true,function(V)
    _G.UseMelee = V
end)

Ev:Toggle("Sử Dụng Kiếm",false,function(V)
    _G.UseSword = V
end)

Ev:Toggle("Sử Dụng Súng",false,function(V)
    _G.UseGun = V
end)
------------------------------------------------------------------------------------------------------------------------------------
V:Seperator("Định Vị")

V:Toggle("Định Vị Người Chơi",false,function(a)
        ESPPlayer = a
	UpdatePlayerChams()
    end)
    
V:Toggle("Định Vị Đảo Kitsune",false,function(V)
        IslandESP = V
        while IslandESP do wait()
            UpdateIslandESPKitsune() 
        end
    end)

function UpdateIslandESPKitsune()
    for i, v in pairs(game:GetService("Workspace").Map.KitsuneIsland.ShrineActive:GetChildren()) do
        pcall(function()
            if IslandESP then
                if v.Name ~= "NeonShrinePart" then
                    if not v:FindFirstChild('IslandESP') then
                        local bill = Instance.new('BillboardGui', v)
                        bill.Name = 'IslandESP'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel', bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = "Kitsune Island"
                    else
                        v['IslandESP'].TextLabel.Text = "Kitsune Island"
                    end
                end
            else
                if v:FindFirstChild('IslandESP') then
                    v:FindFirstChild('IslandESP'):Destroy()
                end
            end
        end)
    end
end
    
    V:Toggle("Định Vị Rương",false,function(a)
        ChestESP = a
	UpdateChestChams() 
    end)
    
    V:Toggle("Định Vị Trái Ác Quỷ",false,function(a)
        DevilFruitESP = a
        while DevilFruitESP do wait()
            UpdateDevilChams() 
        end
    end)
    
    V:Toggle("Định Vị Trái Cây",RealFruitESP,function(a)
        RealFruitESP = a
	UpdateRealFruitChams() 
    end)
    
    V:Toggle("Định Vị Hoa",false,function(a)
        FlowerESP = a
	UpdateFlowerChams() 
    end)
    spawn(function()
	    while wait() do
		    if FlowerESP then
			    UpdateFlowerChams() 
		    end
		    if DevilFruitESP then
			    UpdateDevilChams() 
		    end
		    if ChestESP then
			    UpdateChestChams() 
		    end
		    if ESPPlayer then
			    UpdatePlayerChams()
		    end
		    if RealFruitESP then
			    UpdateRealFruitChams()
		    end
	    end
    end)
V:Toggle("Định Vị Đảo",IslandESP,function(V)
        IslandESP = V
        while IslandESP do wait()
            UpdateIslandESP() 
        end
    end)

V:Toggle("Định Vị Đảo Bí Ẩn", false, function(V)
    MirageIslandESP = V
        while MirageIslandESP do wait()
            UpdateIslandMirageESP()
        end
    end)

V:Seperator("Chơi khăm")

V:Button('Mưa Trái', function()
for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
            v.Parent = game.Workspace.Map
            v:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
            if v.Fruit:FindFirstChild("AnimationController") then
                v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
            end
            v.Handle.Touched:Connect(function(otherPart)
                if otherPart.Parent == game.Players.LocalPlayer.Character then
                    v.Parent = game.Players.LocalPlayer.Backpack
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end)
        end
end)

V:Button('Làm Giả Cấp/Beli/Kinh Nghiệm', function()
local plr = game:GetService("Players").LocalPlayer
        local Notification = require(game:GetService("ReplicatedStorage").Notification)
        local Data = plr:WaitForChild("Data")
        local EXPFunction = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
        local LevelUp = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp)
        local Sound = require(game:GetService("ReplicatedStorage").Util.Sound)
        local LevelUpSound = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")
        function v129(p15)
            local v130 = p15;
            while true do
                local v131, v132 = string.gsub(v130, "^(-?%d+)(%d%d%d)", "%1,%2");
                v130 = v131;
                if v132 == 0 then
                    break;
                end;    
            end;
            return v130;
        end;
        
        Notification.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
        Notification.new("Earned <Color=Yellow>9,999,999,999,999 Exp.<Color=/> (+ None)"):Display()
        Notification.new("Earned <Color=Green>$9,999,999,999,999<Color=/>"):Display()
        plr.Data.Exp.Value = 999999999999
        plr.Data.Beli.Value = plr.Data.Beli.Value + 999999999999
        
        delay = 0
        count = 0
        while plr.Data.Exp.Value - EXPFunction(Data.Level.Value) > 0 do
            plr.Data.Exp.Value = plr.Data.Exp.Value - EXPFunction(Data.Level.Value)
            plr.Data.Level.Value = plr.Data.Level.Value + 1
            plr.Data.Points.Value = plr.Data.Points.Value + 3
            LevelUp({ plr })
            Sound.Play(Sound, LevelUpSound.Value)
            Notification.new("<Color=Green>LEVEL UP!<Color=/> (" .. plr.Data.Level.Value .. ")"):Display()
            count = count + 1
            if count >= 5 then
                delay = tick()
                count = 0
                wait(2)
            end
        end
end)
	
	V:Textbox("Làm Giả Cấp",true,function(V)
        game:GetService("Players").LocalPlayer.Data.Level.Value = V
    end)
    
    V:Textbox("Làm Giả Kinh Nghiệm",true,function(V)
        game:GetService("Players").LocalPlayer.Data.Exp.Value = V
    end)
    
    V:Textbox("Làm Giả Tiền",true,function(V)
        game:GetService("Players").LocalPlayer.Data.Beli.Value = V
    end)
    
    V:Textbox("Làm Giả Điểm Tím",true,function(V)
        game:GetService("Players").LocalPlayer.Data.Fragments.Value = V
    end)
    
    V:Textbox("Làm Giả Điểm",true,function(V)
        game:GetService("Players").LocalPlayer.Data.Points.Value = V
    end)
    
    V:Textbox("Làm Giả Tiền Thưởng",true,function(V)
        game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value = V
    end)

V:Seperator("Điểm nổi bật")

V:Toggle("Hiển thị trò chuyện", _G.chat, function(V)
    _G.chat = V
    if _G.chat == true then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)    
elseif _G.chat == false then
local StarterGui = game:GetService('StarterGui')
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)    
end
  end)

  V:Toggle("Hiển thị bảng xếp hạng", _G.leaderboard, function(a)
    _G.leaderboard = a
    if _G.leaderboard == true then
local StarterGui = game:GetService('StarterGui')
game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)   
elseif _G.leaderboard == false then
local StarterGui = game:GetService('StarterGui')
game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)   
end
  end)
	
    V:Seperator("Gian lận")
    V:Button("Mở khóa Buso",function()
    
local Ability = "Buso"
-- local Ability = {Buso,Soru,Geppo}
if type(Ability) == 'string' then
   game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character,Ability)
elseif type(Ability) == 'table' then
   for i,v in next , Ability do
       game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character,v)
   end
   end
   end)
   
   V:Button("Mở Khoá Soru",function()

local Ability = "Soru"
-- local Ability = {Buso,Soru,Geppo}
if type(Ability) == 'string' then
   game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character,Ability)
elseif type(Ability) == 'table' then
   for i,v in next , Ability do
       game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character,v)
   end
   end
   end)
   
   V:Button("Mở Khoá Geppo",function()

local Ability = "Geppo"
-- local Ability = {Buso,Soru,Geppo}
if type(Ability) == 'string' then
   game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character,Ability)
elseif type(Ability) == 'table' then
   for i,v in next , Ability do
       game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character,v)
   end
   end
   end)
    
    V:Button("Thu phóng tối đa", function()
		while wait() do
			game.Players.LocalPlayer.CameraMaxZoomDistance = 9223372036854718
			end
	end)

V:Button("Hiển Thị Tài Khoản", function(V)
		local cac = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.UIController.Inventory)
		local Inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
		local Items = {}
		local RaityLevel = {"Mythical","Legendary","Rare","Uncommon","Common"}
		local RaityColor =  {
			["Common"] = Color3.fromRGB(179, 179, 179),
			["Uncommon"] = Color3.fromRGB(92, 140, 211),
			["Rare"] =  Color3.fromRGB(140, 82, 255),
			["Legendary"] = Color3.fromRGB(213, 43, 228) ,
			["Mythical"] =  Color3.fromRGB(238, 47, 50)
		}
		function GetRaity(color)
			for k,v in pairs(RaityColor) do 
				if v==color then return k end
			end
		end

		for k,v in pairs(Inventory) do 
			Items[v.Name] = v
		end

		local total = #getupvalue(cac.UpdateRender,4)
		local rac = {}
		local allitem = {}
		local total2 = 0
		while total2<total do 
			local i = 0
			while i < 25000 and total2<total do 
				game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0,i)
				for k,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetChildren()) do 
					if v:IsA("Frame") and not rac[v.ItemName.Text] and v.ItemName.Visible==true then 
						local vaihuhu = GetRaity(v.Background.BackgroundColor3)
						if vaihuhu then
							print("Rac")
							if not allitem[vaihuhu] then 
								allitem[vaihuhu] = {}
							end
							table.insert(allitem[vaihuhu],v:Clone())
						end
						total2=total2+1
						rac[v.ItemName.Text] = true
					end
				end
				i=i+20
			end
			wait()
		end
		function GetXY(vec) 
			return vec*100
		end

		local tvk = Instance.new("UIListLayout")
		tvk.FillDirection = Enum.FillDirection.Vertical
		tvk.SortOrder = 2
		tvk.Padding = UDim.new(0,10)

		local Left = Instance.new("Frame",game.Players.LocalPlayer.PlayerGui.BubbleChat)
		Left.BackgroundTransparency = 1
		Left.Size = UDim2.new(.5,0,1,0) 
		tvk.Parent = Left

		local Right = Instance.new("Frame",game.Players.LocalPlayer.PlayerGui.BubbleChat)
		Right.BackgroundTransparency = 1
		Right.Size = UDim2.new(.5,0,1,0) 
		Right.Position = UDim2.new(.6,0,0,0)
		tvk:Clone().Parent = Right
		for k,v in pairs(allitem) do 
			local cac = Instance.new("Frame",Left)
			cac.BackgroundTransparency = 1
			cac.Size = UDim2.new(1,0,0,0) 
			cac.LayoutOrder = table.find(RaityLevel,k)

			local cac2 = Instance.new("Frame",Right)
			cac2.BackgroundTransparency = 1
			cac2.Size = UDim2.new(1,0,0,0) 
			cac2.LayoutOrder = table.find(RaityLevel,k)

			local tvk = Instance.new("UIGridLayout",cac)
			tvk.CellPadding = UDim2.new(.005,0,.005,0)
			tvk.CellSize =  UDim2.new(0,70,0,70)
			tvk.FillDirectionMaxCells = 100
			tvk.FillDirection = Enum.FillDirection.Horizontal

			local ccc = tvk:Clone()
			ccc.Parent = cac2
			for k,v in pairs(v) do 
				if Items[v.ItemName.Text] and Items[v.ItemName.Text].Mastery then 
					if v.ItemLine2.Text~="Accessory" then 
						local bucac = v.ItemName:Clone()
						bucac.BackgroundTransparency = 1
						bucac.TextSize = 10
						bucac.TextXAlignment  = 2
						bucac.TextYAlignment  = 2
						bucac.ZIndex  = 5
						bucac.Text = Items[v.ItemName.Text].Mastery
						bucac.Size = UDim2.new(.5,0,.5,0)
						bucac.Position = UDim2.new(.5,0,.5,0)
						bucac.Parent = v
					end
					v.Parent = cac
				elseif v.ItemLine2.Text == "Blox Fruit" then 
					v.Parent = cac2
				end
			end
			cac.AutomaticSize = 2
			cac2.AutomaticSize = 2
		end
		local ListHuhu = {
			["Superhuman"] = Vector2.new(3,2),
			["GodHuman"] = Vector2.new(3,2),
			["DeathStep"] = Vector2.new(4,3),
			["ElectricClaw"] = Vector2.new(2,0),
			["SharkmanKarate"] = Vector2.new(0,0),
			["DragonTalon"] = Vector2.new(1,5)
		}
		local MeleeG = Instance.new("Frame",Left)
		MeleeG.BackgroundTransparency = 1
		MeleeG.Size = UDim2.new(1,0,0,0) 
		MeleeG.LayoutOrder = table.find(RaityLevel,k)
		MeleeG.AutomaticSize=2
		MeleeG.LayoutOrder = 100
		local tvk = Instance.new("UIGridLayout",MeleeG)
		tvk.CellPadding = UDim2.new(.005,0,.005,0)
		tvk.CellSize =  UDim2.new(0,70,0,70)
		tvk.FillDirectionMaxCells = 100
		tvk.FillDirection = Enum.FillDirection.Horizontal

		local cac = {"Superhuman","ElectricClaw","DragonTalon","SharkmanKarate","DeathStep","GodHuman"}
		for k,v in pairs(cac) do
			if ListHuhu[v] and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"..v,true) == 1 then 
				local huhu = Instance.new("ImageLabel",MeleeG)
				huhu.Image = "rbxassetid://9945562382"
				huhu.ImageRectSize = Vector2.new(100,100)
				huhu.ImageRectOffset = ListHuhu[v]*100
			end
		end
		function formatNumber(v)
			return tostring(v):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
		end
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.Position = UDim2.new(0,800,0,500)
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Position = UDim2.new(0,800,0,550)

		local thieunang = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone()
		thieunang.Parent = game:GetService("Players").LocalPlayer.PlayerGui.BubbleChat
		thieunang.Position = UDim2.new(0,800,0.63,0)
		local n = formatNumber(game.Players.LocalPlayer.Data.Fragments.Value)
		thieunang.Text = "Ã†â€™"..n
		print("Done")
		pcall(function() 
			game:GetService("Players").LocalPlayer.PlayerGui.Main.MenuButton:Destroy()
		end)
		pcall(function() 
			game:GetService("Players").LocalPlayer.PlayerGui.Main.HP:Destroy()
		end)
		pcall(function() 
			game:GetService("Players").LocalPlayer.PlayerGui.Main.Energy:Destroy()
		end)
		for k,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main:GetChildren()) do 
			if v:IsA("ImageButton") then 
				v:Destroy()
			end
		end
		pcall(function() 
			game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass:Destroy()
		end)
	end)
	
V:Seperator("Đồ Hoạ")
    
    V:Button("Xoá Sương Mù ( Biển 3 )",function(qww)
	game:GetService("Lighting").LightingLayers:Destroy()
	game:GetService("Lighting").Sky:Destroy()
end)

V:Toggle("Xoá Sương Mù",RemoveFog,function(V)
    RemoveFog = V
    
        if not RemoveFog then return end
        while RemoveFog do wait()
            game.Lighting.FogEnd = 9e9
            if not RemoveFog then
                game.Lighting.FogEnd = 2500
            end
        end
    end)
    
    V:Toggle("Loại Bỏ Thiệt Hại",true,function()
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "DamageCounter" then   
				v:Destroy()
			end
		end
		for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "DamageCounter" then   
				v:Destroy()
			end
		end
	end)
    
    V:Button("Mở Khoá FPS",function()
        setfpscap(9999999)
    end)
    
    V:Button("Giảm Lag", function()
	for i,v in pairs(game.Workspace.Map:GetDescendants()) do
		if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
			v:Destroy()
		end
	end 
	for i,v in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
		if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
			v:Destroy()
		end
	end
	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("Accessory") or v.Name == "Pants" or v.Name == "Shirt" then
			v:Destroy()
		end
	end
	local decalsyeeted = true
	local g = game
	local w = g.Workspace
	local l = g.Lighting
	local t = w.Terrain
	t.WaterWaveSize = 0
	t.WaterWaveSpeed = 0
	t.WaterReflectance = 0
	t.WaterTransparency = 0
	l.GlobalShadows = false
	l.FogEnd = 9e9
	l.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.TextureID = 10385902758728957
		end
	end
	for i, e in pairs(l:GetChildren()) do
		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
			e.Enabled = false
		end
	end
    end)

    V:Seperator("Khả năng")
    
    V:Toggle("Né tránh không có thời gian hồi chiêu",false,function(V)
        nododgecool = V
        NoDodgeCool()
    end)
    
    V:Toggle("Năng lượng vô hạn",false,function(V)
        InfiniteEnergy = V
        originalstam = LocalPlayer.Character.Energy.Value
    end)
    
    V:Toggle("Tự Động Bậc V3",_G.ActiveV3,function(V)
        _G.ActiveV3 = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.ActiveV3 then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
            end
        end)
    end)
    
    V:Toggle("Tự Động Bậc V4",_G.ActiveV4,function(V)
        _G.ActiveV4 = V
    end)

spawn(function()
    while wait() do
		pcall(function()
			if _G.ActiveV4 then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
			end
		end)
    end
end)
    
    V:Toggle("Khả năng vô hạn",false,function(V)
        InfAbility = V
        if value == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end)
    
    spawn(function()
        while wait() do
            if InfAbility then
                InfAb()
            end
        end
    end)
    
    V:Toggle("Phạm vi quan sát vô hạn",getgenv().InfiniteObRange,function(V)
        getgenv().InfiniteObRange = V
        local VS = game:GetService("Players").LocalPlayer.VisionRadius.Value
        while getgenv().InfiniteObRange do
            wait()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local VisionRadius = player.VisionRadius
            if player then
                if char.Humanoid.Health <= 0 then 
                    wait(5) 
                end
                VisionRadius.Value = math.huge
            elseif getgenv().InfiniteObRange == false and player then
                VisionRadius.Value = VS
            end
        end
    end)
    
    V:Toggle("Geppo vô hạn",getgenv().InfGeppo,function(V)
        getgenv().InfGeppo = V
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfGeppo then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Geppo then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Geppo then
                                for i2,v2 in next, getupvalues(v) do
                                    if tostring(i2) == "9" then
                                        repeat wait(.1)
                                            setupvalue(v,i2,0)
                                        until not getgenv().InfGeppo or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    V:Toggle("vô hạn Soru",_G.Infsoru,function(V)
        _G.Infsoru = V
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Infsoru and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Soru then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
                                for i2,v2 in next, getupvalues(v) do
                                    if typeof(v2) == "table" then
                                        repeat wait(0.1)
                                            v2.LastUse = 0
                                        until not _G.Infsoru or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    V:Toggle("Đi Trên Nước",true,function(V)
        _G.WalkWater = V
    end)
    
    spawn(function()
			while task.wait() do
				pcall(function()
					if _G.WalkWater then
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
					else
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
					end
				end)
			end
		end)
    
    V:Toggle("Xuyên Tường",_G.NoClip,function(V)
        _G.NoClip = V
    end)
	
    spawn(function()
        while wait() do
            if sethiddenproperty then
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",100)
            end
            if setscriptable then
                setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
                game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 0 / 0 * 0 / 0 * 0 / 0 * 0 / 0 * 0 / 0
            end
        end
    end)
    
    V:Button("Xoá Dung Nham",function()
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
		for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
	end)
--------------------------------------------------------------------------------------------------------
    local plyserv = P:Label("Người Chơi")

    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players:".." "..i.." ".."/".." ".."12".." ".."(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player:".." "..i.." ".."/".." ".."12")
                    else
                        plyserv:Set("Players:".." "..i.." ".."/".." ".."12")
                    end
                end
            end)
        end
    end)
    
    Playerslist = {}
    
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Playerslist,v.Name)
    end
    
    local SelectedPly = P:Dropdown("Chọn Người Chơi",Playerslist,function(V)
        _G.SelectPly = V
    end)
    
    P:Button("Làm Mới Người Chơi",function()
        Playerslist = {}
        SelectedPly:Clear()
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            SelectedPly:Add(v.Name)
        end
    end)
    
    P:Toggle("Quan Sát Người Chơi",false,function(V)
        SpectatePlys = V
        local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        repeat wait(.1)
            game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
        until SpectatePlys == false 
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    end)
    
    P:Toggle("Bay Đến Người Chơi",false,function(V)
        _G.TeleportPly = V
        pcall(function()
            if _G.TeleportPly then
                repeat topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
    end)
    
    P:Toggle("Bay Đến Người Chơi Bypass",false,function(bool)
                                    _G.Teleport = bool
                                    if _G.Teleport == false then
                                        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                    end
                                    while _G.Teleport do task.wait()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
                                        game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    end
                                end)

    P:Seperator("Nhiệm Vụ")
    
    P:Button("Nhận Nhiệm Vụ Thợ Săn",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
    end)
    
    P:Toggle("Giết Người Chơi Nhận Nhiệm Vụ",_G.PlayerHunter,function(Killzps)
		_G.PlayerHunter = Killzps
        StopTween(_G.PlayerHunter)
	end)

	spawn(function()
		game:GetService("RunService").Heartbeat:connect(function()
			pcall(function()
				if _G.PlayerHunter then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end
			end)
		end)
	end)

	   spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.PlayerHunter then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)

	spawn(function()
		while wait() do
			if _G.PlayerHunter then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
				else
					for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
							repeat wait()
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								EquipWeapon(_G.SelectWeapon)
								Useskill = true
								topos(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
								game:GetService'VirtualUser':CaptureController()
								game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
							until _G.PlayerHunter == false or v.Humanoid.Health <= 0
							Useskill = false
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
					end
				end
			end
		end
	end)
	
	spawn(function()
    while wait() do
		pcall(function()
			if Useskill then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
			end
		end)
    end
    end)

    P:Seperator("PvP")
    
    P:Toggle("Aimbot gần nhất",false,function(V)
    _G.AimNearest = V
end)

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService('RunService')

local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if player.Team ~= LocalPlayer.Team and player.Team.Name ~= "Marines" then
                local targetPos = player.Character.HumanoidRootPart.Position
                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - targetPos).Magnitude
                if dist < shortestDistance then
                    closestPlayer = player
                    shortestDistance = dist
                end
            end
        end
    end

    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if _G.AimNearest then
        local closestPlayer = GetClosestPlayer()
        if closestPlayer then
            _G.Aim_Players = closestPlayer
        end
    end
end)

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if _G.AimNearest and _G.Aim_Players then
                    args[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
                    return old(unpack(args))
                end
            end
        end
    end
    return old(...)
end)
setreadonly(gg, true)
    
    P:Toggle("Enabled PvP",false,function(V)
        _G.EnabledPvP = V
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.EnabledPvP then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)


P:Button("Đặt vị trí Hồi Sinh",function()
	_G.Pos_Spawn = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	Com()
end)

    P:Toggle("Chế độ an toàn",false,function(V)
        _G.Safe_Mode = V
        StopTween(_G.Safe_Mode)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Safe_Mode then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    end)
    
    P:Button("hồi sinh",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
        wait()
    end)
    
P:Seperator("Thống kê")

  local Pointstat = P:Label("Điểm chỉ số")
    
    spawn(function()
        while wait() do
            pcall(function()
                Pointstat:Set("Điểm chỉ số: "..tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value))
            end)
        end
    end)
    
local Melee = P:Label("Võ: ")
local Defense = P:Label("Phòng Thủ: ")
local Sword = P:Label("Kiếm: ")
local Gun = P:Label("Súng: ")
local Fruit = P:Label("Trái: ")

    spawn(function()
        while wait() do
            pcall(function()
                Melee:Set("Võ: "..game.Players.localPlayer.Data.Stats.Melee.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Defense:Set("Phòng Thủ: "..game.Players.localPlayer.Data.Stats.Defense.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Sword:Set("Kiếm: "..game.Players.localPlayer.Data.Stats.Sword.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Gun:Set("Súng: "..game.Players.localPlayer.Data.Stats.Gun.Level.Value)
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                Fruit:Set("Trái: "..game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value)
            end)
        end
    end)
       
P:Toggle("Tự Động Nâng Chỉ Số",_G.Stats_Kaitun,function(V)
_G.Stats_Kaitun = V
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.Stats_Kaitun then
				if World1 then
					local args = {
						[1] = "AddPoint",
						[2] = "Melee",
						[3] = _G.Point
						}
						
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				elseif World2 then
					local args = {
						[1] = "AddPoint",
						[2] = "Melee",
						[3] = _G.Point
						}
						
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					local args = {
						[1] = "AddPoint",
						[2] = "Defense",
						[3] = _G.Point
						}
						
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end)
	end
end)

P:Toggle("Võ",false,function(V)
melee = V    
end)
P:Toggle("Phòng Thủ",false,function(V)
defense = V
end)
P:Toggle("Kiếm",false,function(V)
sword = V
end)
P:Toggle("Súng",false,function(V)
gun = V
end)
P:Toggle("Trái Ác Quỷ",false,function(V)
demonfruit = V
end)

PointStats = 100

spawn(function()
		while wait() do
			if game.Players.localPlayer.Data.Points.Value >= PointStats then
				if melee then
					local args = {
						[1] = "AddPoint",
						[2] = "Võ",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if defense then
					local args = {
						[1] = "AddPoint",
						[2] = "Phòng Thủ",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if sword then
					local args = {
						[1] = "AddPoint",
						[2] = "Kiếm",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if gun then
					local args = {
						[1] = "AddPoint",
						[2] = "Súng",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
				if demonfruit then
					local args = {
						[1] = "AddPoint",
						[2] = "Trái Ác Quỷ",
						[3] = PointStats
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
		end
	end)
-------------------------------------------------------------------------------------------------------- 
    R:Seperator("Tập Kích")
    
    _G.SelectChip = selectraids or ""
	Raidslist = {}
	RaidsModule = require(game.ReplicatedStorage.Raids)
	for i,v in pairs(RaidsModule.raids) do
		table.insert(Raidslist,v)
	end
	for i,v in pairs(RaidsModule.advancedRaids) do
		table.insert(Raidslist,v)
	end
	
    R:Dropdown("Chọn Chip",Raidslist,function(V)
        _G.SelectChip = V
    end)
    
    R:Toggle("Tự động chọn Đột Kích",_G.SelectDungeon,function(V)
        _G.SelectDungeon = V
    end)
    
    spawn(function()
        while wait() do
            if _G.SelectDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame-Flame") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame-Flame") then
                        _G.SelectChip = "Flame"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice-Ice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice-Ice") then
                        _G.SelectChip = "Ice"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake-Quake") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake-Quake") then
                        _G.SelectChip = "Quake"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light-Light") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light-Light") then
                        _G.SelectChip = "Light"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark-Dark") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark-Dark") then
                        _G.SelectChip = "Dark"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("String-String") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String-String") then
                        _G.SelectChip = "String"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble-Rumble") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble-Rumble") then
                        _G.SelectChip = "Rumble"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma-Magma") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma-Magma") then
                        _G.SelectChip = "Magma"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        _G.SelectChip = "Human: Buddha"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand-Sand") then
                        _G.SelectChip = "Sand"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                        _G.SelectChip = "Bird: Phoenix"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough") then
                        _G.SelectChip = "Dough"
                    else
                        _G.SelectChip = "Flame"
                    end
                end)
            end
        end
    end)
    
    R:Toggle("Mua Chip Tự Động",_G.BuyChip,function(V)
        _G.BuyChip = V
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.BuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)
    
    R:Button("Mua Chip Đã Chọn",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
    end)
    
    R:Toggle("Tự Động Bắt Đầu Đột Kích",_G.StartRaid,function(V)
        _G.StartRaid = V
    end)
    
    spawn(function()
        while wait(.1) do
            pcall(function()
                if _G.StartRaid then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                            if World2 then
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                            elseif World3 then
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    R:Button("Bắt Đầu Đột Kích",function()
        if World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif World3 then
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
    end)

R:Toggle("Auto Next Island And Kill Mob",false,function(V)
    _G.Dungeon = V
     StopTween(_G.Dungeon)
end)
    
function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
            then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
            then
                return v
            end
        end
    end
end

function getNextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if IsIslandRaid(v) and (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return IsIslandRaid(v)
        end
    end
end

function attackNearbyEnemies()
    local enemies = {}
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance <= 1000 then
                table.insert(enemies, v)
            end
        end
    end

    for _, enemy in pairs(enemies) do
        repeat
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                EquipWeapon(_G.SelectWeapon)
                topos(enemy.HumanoidRootPart.CFrame * Pos)
                wait(0.1)
            end
        until not enemy:FindFirstChild("Humanoid") or enemy.Humanoid.Health <= 0
    end
end

spawn(function()
    while wait() do
        if _G.Dungeon then
            attackNearbyEnemies()
            if getNextIsland() then
                spawn(topos(getNextIsland().CFrame * CFrame.new(0, 60, 0)), 1)
            end
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.Kill_Aura then
                local player = game:GetService("Players").LocalPlayer
                local enemies = game:GetService("Workspace").Enemies:GetChildren()
                local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
                if playerPos then
                    for _, enemy in pairs(enemies) do
                        if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            local distance = (enemy.HumanoidRootPart.Position - playerPos).Magnitude
                            if distance <= 1000 then
                                pcall(function()
                                    repeat wait()
                                        sethiddenproperty(player, "SimulationRadius", math.huge)
                                        enemy.Humanoid.Health = 0
                                        enemy.HumanoidRootPart.CanCollide = false
                                    until not _G.Kill_Aura or not enemy.Parent or enemy.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end)
    
    R:Toggle("Tự động thức Tỉnh",_G.Awakener,function(V)
        _G.Awakener = V
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Awakener then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
                end
            end
        end)
    end)
    
    if World2 then
        R:Button("Dịch chuyển đến phòng thí nghiệm",function()
            topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
            end)
    elseif World3 then
        R:Button("Dịch chuyển đến phòng thí nghiệm",function()
            topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
        end)
    end
    
    if World2 then
        R:Button("Phòng thức tỉnh",function()
            topos(CFrame.new(266.227783, 1.39509034, 1857.00732))
        end)
    elseif World3 then
        R:Button("Phòng thức tỉnh",function()
            topos(CFrame.new(-11571.440429688, 49.172668457031, -7574.7368164062))
        end)
    end
    
    R:Seperator("Kiếm KoKo")
    
 R:Toggle("Đánh Law", _G.OderSword,function(V)
     _G.OderSword = V
    StopTween( _G.OderSword)
    end)
    
    R:Toggle("Đánh Law Đổi Sever", _G.OderSwordHop,function(V)
         _G.OderSwordHop = V
    end)
    
    spawn(function()
        while wait() do
            if  _G.OderSword then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Order [Lv. 1250] [Raid Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.OderSword or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.OderSwordHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    R:Button("Mua Chip Law",function()
    local args = {
       [1] = "BlackbeardReward",
       [2] = "Microchip",
       [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

    R:Button("Bắt Đầu Vào Đánh",function()
        if World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end
    end)
--------------------------------------------------------------------------------------------------------
    T:Seperator("Thế Giới")
    
    T:Button("Dịch chuyển đến Biển 1",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end)
    
    T:Button("Dịch chuyển đến Biển 2",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end)
    
    T:Button("Dịch chuyển đến Biển 3",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end)
    
T:Seperator("Dịch chuyển nhanh")
    
    if World1 then
        T:Dropdown("Chọn Đảo",{
            "Đảo Trời 1",
            "Đảo Trời 2",
            "Đảo dưới nước",
            "Lối vào Đảo Dưới Nước"
            },function(V)
            _G.SelectFast = V
        end)
    end
    
    if World2 then
        T:Dropdown("Chọn Đảo",{
            "Biệt thự Flamingo",
            "Phòng Flamingo",
            "Con tàu bị nguyền rủa",
            "Đảo thây ma"
            },function(V)
            _G.SelectFast = V
        end)
    end
    
    if World3 then
        T:Dropdown("Chọn Đảo",{
            "Dinh Thự",
            "Đảo Hydra",
            "Pháo đài trên biển",
            "Đảo rùa",
            "Cướp biển xinh đẹp"
            },function(V)
            _G.SelectFast = V
        end)
    end
    
    T:Toggle("Dịch Chuyển Đến Đảo Đã Chỉ Định",false,function(V)
        _G.TeleFast = V
        if _G.TeleFast == true then
            repeat wait()
                if _G.SelectFast == "Đảo Trời 1" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4652, 873, -1754))
                elseif _G.SelectFast == "Đảo Trời 2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7895, 5547, -380))
                elseif _G.SelectFast == "Đảo dưới nước" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61164, 5, 1820))
                elseif _G.SelectFast == "Lối vào Đảo Dưới Nước" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3865, 5, -1926))
                elseif _G.SelectFast == "Biệt thự Flamingo" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-317, 331, 597))
                elseif _G.SelectFast == "Phòng Flamingo" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2283, 15, 867))
                elseif _G.SelectFast == "Con tàu bị nguyền rủa" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923, 125, 32853))
                elseif _G.SelectFast == "Đảo thây ma" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6509, 83, -133))
                elseif _G.SelectFast == "Dinh Thự" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471, 374, -7551))
                elseif _G.SelectFast == "Đảo Hydra" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5756, 610, -282))
                elseif _G.SelectFast == "Pháo đài trên biển" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5092, 315, -3130))
                elseif _G.SelectFast == "Đảo rùa" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12001, 332, -8861))
                elseif _G.SelectFast == "Cướp biển xinh đẹp" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5319, 23, -93))
                end
            until not _G.TeleFast
        end
    end)                    
                
    T:Seperator("đảo")
    
    if World1 then
        T:Dropdown("Chọn Đảo",{
            "Cối xay gió",
            "Hàng hải",
            "Trung tâm thị trấn",
            "Rừng",
            "Làng cướp biển",
            "Sa mạc",
            "Đảo Tuyết",
            "Ford hàng hải",
            "Đấu trường La Mã",
            "Đảo Trời 1",
            "Đảo Trời 2",
            "Đảo Trời 3",
            "Nhà tù",
            "Làng Magma",
            "Đảo dưới nước",
            "Thành phố đài phun nước"
            },function(V)
            _G.SelectIsland = V
        end)
    end
    
    if World2 then
        T:Dropdown("Chọn Đảo",{
            "Quán cà phê",
            "Đốm đầu tiên",
            "Đảo Râu Đen",
            "Biệt thự Flamingo",
            "Phòng Flamingo",
            "Khu vực xanh",
            "Đảo thây ma",
            "Hai ngọn núi tuyết",
            "Punk nguy hiểm",
            "Con tàu bị nguyền rủa",
            "Lâu đài băng",
            "Đảo bị lãng quên",
            "Đảo Ussop"
            },function(V)
            _G.SelectIsland = V
        end)
    end
    
    if World3 then
        T:Dropdown("Chọn Đảo",{
            "Dinh Thự",
            "Cảng",
            "Cây lớn",
            "Pháo đài trên biển",
            "Đảo Hydra",
            "Đảo rùa",
            "Đảo Xương",
            "Đảo kem",
            "Đảo Đậu Phộng",
            "Đảo Bánh",
            "Đảo kẹo mía",
            "Doanh Trại Tiki"
            },function(V)
            _G.SelectIsland = V
        end)
    end
    
    T:Toggle("Bay Đến Đảo Đã Chọn",false,function(V)
        _G.TeleportIsland = V
        if _G.TeleportIsland == true then
            repeat wait()
                if _G.SelectIsland == "Trung tâm thị trấn" then
                    topos(CFrame.new(-688, 15, 1585))
                elseif _G.SelectIsland == "Ford hàng hải" then
                    topos(CFrame.new(-4810, 21, 4359))
                elseif _G.SelectIsland == "Hàng hải" then
                    topos(CFrame.new(-2728, 25, 2056))
                elseif _G.SelectIsland == "Cối xay gió" then
                    topos(CFrame.new(889, 17, 1434))
                elseif _G.SelectIsland == "Sa mạc" then
                    topos(CFrame.new(945, 21, 4375))
                elseif _G.SelectIsland == "Đảo Tuyết" then
                    topos(CFrame.new(1298, 87, -1344))
                elseif _G.SelectIsland == "Làng cướp biển" then
                    topos(CFrame.new(-1173, 45, 3837))
                elseif _G.SelectIsland == "Rừng" then
                    topos(CFrame.new(-1614, 37, 146))
                elseif _G.SelectIsland == "Nhà tù" then
                    topos(CFrame.new(4870, 6, 736))
                elseif _G.SelectIsland == "Đảo dưới nước" then
                    topos(CFrame.new(61164, 5, 1820))
                elseif _G.SelectIsland == "Đấu trường La Mã" then
                    topos(CFrame.new(-1535, 7, -3014))
                elseif _G.SelectIsland == "Làng Magma" then
                    topos(CFrame.new(-5290, 9, 8349))
                elseif _G.SelectIsland == "Đảo Trời 1" then
                    topos(CFrame.new(-4814, 718, -2551))
                elseif _G.SelectIsland == "Đảo Trời 2" then
                    topos(CFrame.new(-4652, 873, -1754))
                elseif _G.SelectIsland == "Đảo trời 3" then
                    topos(CFrame.new(-7895, 5547, -380))
                elseif _G.SelectIsland == "Thành phố đài phun nước" then
                    topos(CFrame.new(5128, 60, 4106))
                elseif _G.SelectIsland == "Quán cà phê" then
                    topos(CFrame.new(-382, 73, 290))
                elseif _G.SelectIsland == "Đốm đầu tiên" then
                    topos(CFrame.new(-11, 29, 2771))
                elseif _G.SelectIsland == "Đảo Râu Đen" then
                    topos(CFrame.new(3494, 13, -3259))
                elseif _G.SelectIsland == "Biệt thự Flamingo" then
                    topos(CFrame.new(-317, 331, 597))
                elseif _G.SelectIsland == "Phòng Flamingo" then
                    topos(CFrame.new(2285, 15, 905))
                elseif _G.SelectIsland == "Khu vực xanh" then
                    topos(CFrame.new(-2258, 73, -2696))
                elseif _G.SelectIsland == "Đảo thây ma" then
                    topos(CFrame.new(-5552, 194, -776))
                elseif _G.SelectIsland == "Hai ngọn núi tuyết" then
                    topos(CFrame.new(752, 408, -5277))
                elseif _G.SelectIsland == "Punk nguy hiểm" then
                    topos(CFrame.new(-5897, 18, -5096))
                elseif _G.SelectIsland == "Con tàu bị nguyền rủa" then
                    topos(CFrame.new(919, 125, 32869))
                elseif _G.SelectIsland == "Lâu đài băng" then
                    topos(CFrame.new(5505, 40, -6178))
                elseif _G.SelectIsland == "Đảo bị lãng quên" then
                    topos(CFrame.new(-3050, 240, -10178))
                elseif _G.SelectIsland == "Đảo Ussop" then
                    topos(CFrame.new(4816, 8, 2863))
                elseif _G.SelectIsland == "Dinh Thự" then
                    topos(CFrame.new(-12471, 374, -7551))
                elseif _G.SelectIsland == "Cảng" then
                    topos(CFrame.new(-334, 7, 5300))
                elseif _G.SelectIsland == "Pháo đài trên biển" then
                    topos(CFrame.new(-5073, 315, -3153))
                elseif _G.SelectIsland == "Đảo Hydra" then
                    topos(CFrame.new(5756, 610, -282))
                elseif _G.SelectIsland == "Cây lớn" then
                    topos(CFrame.new(2681, 1682, -7190))
                elseif _G.SelectIsland == "Đảo rùa" then
                    topos(CFrame.new(-12528, 332, -8658))
                elseif _G.SelectIsland == "Đảo Xương" then
                    topos(CFrame.new(-9517, 142, 5528))
                elseif _G.SelectIsland == "Đảo kem" then
                    topos(CFrame.new(-902, 79, -10988))
                elseif _G.SelectIsland == "Đảo Đậu Phộng" then
                    topos(CFrame.new(-2062, 50, -10232))
                elseif _G.SelectIsland == "Đảo Bánh" then
                    topos(CFrame.new(-1897, 14, -11576))
                elseif _G.SelectIsland == "Đảo kẹo mía" then
                    topos(CFrame.new(-1038, 10, -14076))
                elseif _G.SelectIsland == "Doanh Trại Tiki" then
                    topos(CFrame.new(-16224, 9, 439))
                end
            until not _G.TeleportIsland
        end
        StopTween(_G.TeleportIsland)
    end)
--------------------------------------------------------------------------------------------------------
    S:Seperator("Khả năng")
    
    S:Button("Mua Geppo [ 10,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end)
    
    S:Button("Mua Haki Vũ Trang [ 25,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end)
    
    S:Button("Mua Soru [ 25,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end)
    
    S:Button("Mua Haki Quan Sát [ 750,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end)
    
S:Toggle("Mua Tất Cả Những Thứ Ở Trên", false, function(t)
    Abilities = t
    while Abilities do wait(.1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end
end)

    S:Seperator("Phong cách chiến đấu")
    
    S:Button("Mua Chân Đen V1 [ 150,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end)
    
    S:Button("Mua Võ Điện V1 [ 550,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end)
    
    S:Button("Mua Võ Người Cá V1 [ 750,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end)
    
    S:Button("Mua Hơi Thở Rồng V1 [ 1,500 Fragments ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end)
    
    S:Button("Mua Superhuman [ 3,000,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end)
    
    S:Button("Mua Chân Đen V2 [ 5,000 Fragments 5,000,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end)
    
    S:Button("Mua Võ Cá V2 [ 5,000 Fragments 2,500,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end)
    
    S:Button("Mua Võ Điện V2 [ 5,000 Fragments 3,000,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end)
    
    S:Button("Mua Võ Rồng V2 [ 5,000 Fragments 3,000,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end)

    S:Button("Mua God Human [ 5,000 Fragments 5,000,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end)
    
    S:Button("Mua Huyết Quỷ [ 5,000 Fragments $5,000,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end)
    
    S:Seperator(" Kiếm ")
    
    S:Button("Cutlass [ 1,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
    end)

    S:Button("Katana [ 1,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
    end)
    
    S:Button("Iron Mace [ 25,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
    end)
    
    S:Button("Dual Katana [ 12,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
    end)
    
    S:Button("Triple Katana [ 60,000 Beli ]", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
    end)
    
    S:Button("Pipe [ 100,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
    end)
    
    S:Button("Dual-Headed Blade [ 400,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
    end)
    
    S:Button("Bisento [ 1,200,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
    end)
    
    S:Button("Soul Cane [ 750,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
    end)

    S:Button("Pole v.2 [ 5,000 Fragments ]",function()
		game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
	end)

    S:Toggle("Yama Sword [ Elite Hunter 30 ]",_G.Yama,function(V)
        _G.Yama = V
    end)
    
    spawn(function()
        while wait() do
            if _G.Yama then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.Yama
                end
            end
        end
    end)

    S:Seperator(" Súng ")
    
    S:Button("Slingshot [ 5,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
    end)
    
    S:Button("Musket [ 8,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
    end)
    
    S:Button("Flintlock [ 10,500 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
    end)
    
    S:Button("Refined Slingshot [ 30,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
    end)
    
    S:Button("Refined Flintlock [ 65,000 Beli ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Refined Flintlock"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
    
    S:Button("Cannon [ 100,000 Beli ]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
    end)
    
    S:Button("Kabucha [ 1,500 Fragments]",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
    end)

          S:Button("Bizarre Rifle [ 250 Ectoplasm ]", function()
                                    local A_1 = "Ectoplasm"
                                    local A_2 = "Buy"
                                    local A_3 = 1
                                    local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
                                    Event:InvokeServer(A_1, A_2, A_3) 
                                    local A_1 = "Ectoplasm"
                                    local A_2 = "Buy"
                                    local A_3 = 1
                                    local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
                                    Event:InvokeServer(A_1, A_2, A_3)
                                end)
    
    S:Seperator(" Fragments ")

S:Button("Đặt lại Chỉ Số ( 2.5K F )", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)

S:Button("Đổi Tộc ( 3K F )", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end)
    	S:Seperator(" Phụ kiện ")
	S:Button("Black Cape [ 50,000 Beli ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Black Cape"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	S:Button("Swordsman Hat [ 150k Beli ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Swordsman Hat"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	S:Button("Tomoe Ring [ 500k Beli ]",function()
		local args = {
			[1] = "BuyItem",
			[2] = "Tomoe Ring"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
--------------------------------------------------------------------------------------------------------
    D:Seperator("Trái")
    
    FruitList = {
        "Bomb-Bomb",
        "Spike-Spike",
        "Chop-Chop",
        "Spring-Spring",
        "Kilo-Kilo",
        "Spin-Spin",
        "Bird: Falcon",
        "Smoke-Smoke",
        "Flame-Flame",
        "Ice-Ice",
        "Sand-Sand",
        "Dark-Dark",
        "Revive-Revive",
        "Diamond-Diamond",
        "Light-Light",
        "Love-Love",
        "Rubber-Rubber",
        "Barrier-Barrier",
        "Magma-Magma",
        "Door-Door",
        "Quake-Quake",
        "Human-Human: Buddha",
        "String-String",
        "Bird-Bird: Phoenix",
        "Rumble-Rumble",
        "Paw-Paw",
        "Gravity-Gravity",
        "Dough-Dough",
        "Venom-Venom",
        "Shadow-Shadow",
        "Control-Control",
        "Soul-Soul",
        "Dragon-Dragon",
        "Leopard-Leopard"
    }
    
    local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
	Table_DevilFruitSniper = {}
	ShopDevilSell = {}
	for i,v in next,Remote_GetFruits do
		table.insert(Table_DevilFruitSniper,v.Name)
		if v.OnSale then 
			table.insert(ShopDevilSell,v.Name)
		end
	end
	
    _G.SelectFruit = ""
    D:Dropdown("Chọn Trái",Table_DevilFruitSniper,function(V)
        _G.SelectFruit = V
    end)
    
    D:Toggle("Mua Trái Đã Chọn",_G.BuyFruitSniper,function(V)
        _G.BuyFruitSniper = V
    end)
    
    D:Seperator("khác")
    
    D:Dropdown("Chọn Trái",Table_DevilFruitSniper,function(V)
        _G.SelectFruitEat = V
    end)
    
    D:Toggle("Ăn Trái Đã Chọn",_G.EatFruit,function(V)
        _G.EatFruit = V
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.EatFruit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.BuyFruitSniper then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit","_G.SelectFruit",false)
                end 
            end
        end)
    end)
    
    D:Button("Quay Trái Ác Quỷ",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end)
    
    D:Button("Mở Shop Trái",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end)
    
    D:Toggle("Tự Động Lưu Trái",_G.StoreFruit,function(V)
        _G.StoreFruit = V
    end)

spawn(function()
	while wait() do
		if _G.StoreFruit then
			pcall(function()
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kilo-Kilo",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Revive-Revive",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Door-Door",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","String-String",game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Paw-Paw",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard",game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
				end
			end)
		 end
	   end
    end)   
    
    D:Toggle("Dịch Chuyển Đến Trái",_G.Grabfruit,function(V)
    _G.Grabfruit = V
    end)
    
spawn(function()
	while wait(.1) do
		if _G.Grabfruit then
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v:IsA("Tool") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
				end
			end
		end
    end
end)
    
    D:Toggle("Bay Đến Trái",_G.Tweenfruit,function(V)
    _G.Tweenfruit = V
    StopTween(_G.Tweenfruit)
    end)
spawn(function()
    while wait() do
        if _G.Tweenfruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") then
                    topos(v.Handle.CFrame)
                end
            end
        end
    end
end)
--------------------------------------------------------------------------------------------------------
    Mc:Seperator("Máy Chủ")
    
    Mc:Button("Vào Lại Máy Chủ",function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)
    
    Mc:Button("Đổi Máy Chủ",function()
        Hop()
    end)
    
    Mc:Button("Đổi Máy Chủ Ít Người",function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true 
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end       
        end
        function getservers()
            serversearch()
            for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" ..v
                    getservers()
                end
            end
        end 
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then 
                if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm") 
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)
    
    Mc:Button("Sao chép Id Máy Chủ",function()
	setclipboard(tostring(game.JobId))
	end)
	
    Mc:Textbox("Nhập Id Máy Chủ", true, function(V)
	_G.Job = V
	end)

	Mc:Button("Vào Máy Chủ Đã Nhập Id",function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
	end)
	
    Mc:Seperator("linh tinh")
    
    Mc:Button("Mở Tilte",function()
    local args = {
        [1] = "getTitles"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end)

Mc:Button("Mở Haki Màu",function()
    game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
end)
      
Mc:Seperator("Đội")
    
    Mc:Button("Tham gia đội Hải Tặc",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
    end)
    
    Mc:Button("Tham gia đội Thủy quân lục chiến",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
    end)

Mc:Toggle("Chống AFK", true, function()
local vu = game:GetService("VirtualUser")
repeat wait() until game:IsLoaded() 
	game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end)
end)
    
    Mc:Seperator("Mã")
    
    local x2Code = {
        "KITTGAMING",
        "ENYU_IS_PRO",
        "FUDD10",
        "BIGNEWS",
        "THEGREATACE",
        "SUB2GAMERROBOT_EXP1",
        "STRAWHATMAIME",
        "SUB2OFFICIALNOOBIE",
        "SUB2NOOBMASTER123",
        "SUB2DAIGROCK",
        "AXIORE",
        "TANTAIGAMIMG",
        "STRAWHATMAINE",
        "JCWK",
        "FUDD10_V2",
        "SUB2FER999",
        "MAGICBIS",
        "TY_FOR_WATCHING",
        "STARCODEHEO"
    }
    
    Mc:Button("Nhập Tất Cả Mã",function()
        function RedeemCode(V)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(V)
        end
        for i,v in pairs(x2Code) do
            RedeemCode(v)
        end
    end)
    
    Mc:Dropdown("Chọn Mã Reset Chỉ Số",{"NOOB_REFUND","SUB2GAMERROBOT_RESET1","Sub2UncleKizaru"},function(V)
        _G.CodeSelect = V
    end)
    
    Mc:Button("Nhập Mã Đã Chọn",function()
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(_G.CodeSelect)
    end)
    
    Mc:Seperator("Tình trạng")
    
    Mc:Dropdown("Chọn trạng thái Haki",{"Tình trạng 0","Tình trạng 1","Tình trạng 2","Tình trạng 3","Tình trạng 4","Tình trạng 5"},function(V)
        _G.SelectStateHaki = V
    end)
    
    Mc:Button("Thay đổi trạng thái Haki",function()
        if _G.SelectStateHaki == "Tình trạng 0" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
        elseif _G.SelectStateHaki == "Tình trạng 1" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
        elseif _G.SelectStateHaki == "Tình trạng 2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
        elseif _G.SelectStateHaki == "Tình trạng 3" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
        elseif _G.SelectStateHaki == "Tình trạng 4" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
        elseif _G.SelectStateHaki == "Tình trạng 5" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
        end
    end)
    
local L = require(game.ReplicatedStorage.Util.CameraShaker)
L:Stop()
--------------------------------------------------------------------------------------------------------
local players = game:GetService("Players")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Hiếu Roblox";
    Text = "Đã tải xong";
    Icon = "rbxthumb://type=Asset&id=136478742457628&w=150&h=150";
    Duration = 10
})