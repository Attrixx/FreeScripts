local Library = {}

function Library:init(name)
    name = name or "New Library"
    if not type(name) == "string" then name = "New Library" end

    if game:GetService("CoreGui"):FindFirstChild(name) then
        game:GetService("CoreGui")[name]:Destroy()
    end
    local UI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Background = Instance.new("Frame")
    local Top = Instance.new("Frame")
    local Label = Instance.new("TextLabel")
    local Line = Instance.new("Frame")
    local Main_2 = Instance.new("Frame")
    local Tabs = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Items = Instance.new("Frame")
    local Borders = Instance.new("Folder")
    local Border1 = Instance.new("Frame")
    local Border2 = Instance.new("Frame")

    UI.Name = name
    UI.Parent = game:GetService("CoreGui")
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = UI
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.BackgroundTransparency = 1.000
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, -245, 0.5, -265)
    Main.Size = UDim2.new(0, 490, 0, 530)
    Main.ZIndex = 1000

    local UIS = game:GetService("UserInputService")
    dragToggle = nil
    local dragSpeed = 0.50
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Main, TweenInfo.new(0.30), {Position = Position}):Play()
    end
    Main.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
    
    Background.Name = "Background"
    Background.Parent = Main
    Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 10

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, 0, 25)
    Top.ZIndex = 15

    Label.Name = "Label"
    Label.Parent = Top
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.BorderSizePixel = 0
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.Size = UDim2.new(1, -15, 1, 0)
    Label.ZIndex = 15
    Label.Font = Enum.Font.Arial
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 15.000
    Label.TextWrapped = true
    Label.TextXAlignment = Enum.TextXAlignment.Left

    Line.Name = "Line"
    Line.Parent = Top
    Line.BackgroundColor3 = Color3.fromRGB(201, 43, 67)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 1, 0)
    Line.Size = UDim2.new(1, 0, 0, 1)

    Main_2.Name = "Main"
    Main_2.Parent = Main
    Main_2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    Main_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
    Main_2.BorderSizePixel = 0
    Main_2.Position = UDim2.new(0, 7, 0, 32)
    Main_2.Size = UDim2.new(1, -14, 1, -37)
    Main_2.ZIndex = 20

    Tabs.Name = "Tabs"
    Tabs.Parent = Main_2
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 5, 0, 0)
    Tabs.Size = UDim2.new(1, -10, 0, 30)
    Tabs.ScrollBarImageTransparency = 1
    Tabs.ScrollBarThickness = 0
    Tabs.CanvasSize = UDim2.new(0,0,0,0)
    Tabs.CanvasPosition = Vector2.new(0,0)

    UIListLayout.Parent = Tabs
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    Items.Name = "Items"
    Items.Parent = Main_2
    Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Items.BackgroundTransparency = 1.000
    Items.BorderSizePixel = 0
    Items.Position = UDim2.new(0, 0, 0, 40)
    Items.Size = UDim2.new(1, 0, 1, -40)

    Borders.Name = "Borders"
    Borders.Parent = Main

    Border1.Name = "Border1"
    Border1.Parent = Borders
    Border1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Border1.BorderSizePixel = 0
    Border1.Position = UDim2.new(0, -1, 0, -1)
    Border1.Size = UDim2.new(1, 2, 1, 2)
    Border1.ZIndex = 9

    Border2.Name = "Border2"
    Border2.Parent = Borders
    Border2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Border2.BorderSizePixel = 0
    Border2.Position = UDim2.new(0, -2, 0, -2)
    Border2.Size = UDim2.new(1, 4, 1, 4)
    Border2.ZIndex = 9

    Tabs.ChildAdded:Connect(function(child)
        repeat wait() until child.Size ~= nil and child.Size ~= UDim2.new(0,0,0,0)
        Tabs.CanvasSize = UDim2.new(0,UIListLayout.AbsoluteContentSize.X,0,0)
    end)

    local firstTab = true
    local selectedTab = nil
    local items = {}
    function items:Tab(name)
        name = name or "New Tab"
        if not type(name) == "string" then name = "New Tab" end
        local Tab = Instance.new("TextButton")
        
        Tab.Name = name
        Tab.Parent = Tabs
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Size = UDim2.new(0, 100, 1, 0)
        Tab.Font = Enum.Font.GothamSemibold
        Tab.Text = name
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 13.000

        if firstTab then
            selectedTab = Tab
            firstTab = false
        else
            Tab.TextColor3 = Color3.fromRGB(163, 163, 163)
        end

        local tween = nil
        Tab.MouseEnter:Connect(function() 
            if selectedTab ~= Tab then
                if tween ~= nil then tween:Cancel() end
                tween = game:GetService("TweenService"):Create(Tab, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255,255,255)})
                tween:Play()
                wait(0.2)
                tween = nil
            end
        end)

        Tab.MouseLeave:Connect(function() 
            if selectedTab ~= Tab then
                if tween ~= nil then tween:Cancel() end
                tween = game:GetService("TweenService"):Create(Tab, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(163, 163, 163)})
                tween:Play()
                wait(0.2)
                tween = nil
            end
        end)
        
        local TabItems = Instance.new("ScrollingFrame")

        local cooldown = false
        Tab.MouseButton1Click:Connect(function()
            if cooldown == false then
                cooldown = true
                for i,v in pairs(Tabs:GetChildren()) do
                    if v ~= Tab and v.ClassName ~= "UIListLayout" then
                        game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(163, 163, 163)}):Play()
                    end
                end
                game:GetService("TweenService"):Create(Tab, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                for i,v in pairs(Items:GetChildren()) do
                    if v ~= TabItems and v.ClassName ~= "UIListLayout" then
                        v.Visible = false
                    end
                end
                TabItems.Visible = true
                selectedTab = Tab
                wait(0.25)
                cooldown = false
            end
        end)

        local textSize = game:GetService("TextService"):GetTextSize(Tab.Text, Tab.TextSize, Tab.Font, Vector2.new(math.huge, math.huge))
        Tab.Size = UDim2.new(0, textSize.x + 5, 0, 30)

        local Left = Instance.new("Frame")
        local LeftUIListLayout = Instance.new("UIListLayout")
        local Right = Instance.new("Frame")
        local RightUIListLayout = Instance.new("UIListLayout")

        TabItems.Name = name
        TabItems.Parent = Items
        TabItems.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabItems.BackgroundTransparency = 1.000
        TabItems.BorderSizePixel = 0
        TabItems.Size = UDim2.new(1, 0, 1, 0)
        TabItems.ScrollBarImageTransparency = 1
        TabItems.ScrollBarThickness = 0
        TabItems.CanvasSize = UDim2.new(0,0,0,0)

        Left.Name = "Left"
        Left.Parent = TabItems
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BackgroundTransparency = 1.000
        Left.BorderSizePixel = 0
        Left.Size = UDim2.new(0.5, 0, 1, 0)

        LeftUIListLayout.Name = "LeftUIListLayout"
        LeftUIListLayout.Parent = Left
        LeftUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        LeftUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        LeftUIListLayout.Padding = UDim.new(0, 10)

        local LeftUIPadding = Instance.new("UIPadding", Left)
        LeftUIPadding.PaddingTop = UDim.new(0,7)

        Right.Name = "Right"
        Right.Parent = TabItems
        Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Right.BackgroundTransparency = 1.000
        Right.BorderSizePixel = 0
        Right.Position = UDim2.new(0.5, 0, 0, 0)
        Right.Size = UDim2.new(0.5, 0, 1, 0)

        RightUIListLayout.Name = "RightUIListLayout"
        RightUIListLayout.Parent = Right
        RightUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        RightUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        RightUIListLayout.Padding = UDim.new(0, 10)

        local RightUIPadding = Instance.new("UIPadding", Right)
        RightUIPadding.PaddingTop = UDim.new(0,10)

        function updateSize(child)
            if string.find(child.ClassName, "UI") then return end
            repeat wait() until child.Size ~= nil and child.Size ~= UDim2.new(0,0,0,0)
            local chosen = LeftUIListLayout

            if LeftUIListLayout.AbsoluteContentSize.Y < RightUIListLayout.AbsoluteContentSize.Y then
                chosen = RightUIListLayout
            end
            TabItems.CanvasSize = UDim2.new(0,0,0,chosen.AbsoluteContentSize.Y)        
        end

        Left.ChildAdded:Connect(function(child)
            updateSize(child)
        end)

        Left.ChildRemoved:Connect(function(child)
            updateSize(child)
        end)

        Right.ChildAdded:Connect(function(child)
            updateSize(child)
        end)

        Right.ChildRemoved:Connect(function(child)
            updateSize(child)
        end)

        local items = {}
        function items:Section(name)
            name = name or "New Section"
            if not type(name) == "string" then name = "New Section" end

            local chosen = Left

            if LeftUIListLayout.AbsoluteContentSize.Y > RightUIListLayout.AbsoluteContentSize.Y then
                chosen = Right  
            end

            local Section = Instance.new("Frame")
            local Background = Instance.new("Frame")
            local Borders = Instance.new("Folder")
            local RLBBorder1 = Instance.new("Frame")
            local RLBBorder2 = Instance.new("Frame")
            local TBorder11 = Instance.new("Frame")
            local TBorder12 = Instance.new("Frame")
            local TBorder22 = Instance.new("Frame")
            local TBorder21 = Instance.new("Frame")
            local Label = Instance.new("TextLabel")
            local SectionItems = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")

            Section.Name = name
            Section.Parent = chosen
            Section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Section.BackgroundTransparency = 1.000
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(0, 220, 0, 15)

            Background.Name = "Background"
            Background.Parent = Section
            Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Background.BorderSizePixel = 0
            Background.Size = UDim2.new(1, 0, 1, 0)
            Background.ZIndex = 10

            Borders.Name = "Borders"
            Borders.Parent = Section

            RLBBorder1.Name = "RLBBorder1"
            RLBBorder1.Parent = Borders
            RLBBorder1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            RLBBorder1.BorderSizePixel = 0
            RLBBorder1.Position = UDim2.new(0, -1, 0, 0)
            RLBBorder1.Size = UDim2.new(1, 2, 1, 1)
            RLBBorder1.ZIndex = 9

            RLBBorder2.Name = "RLBBorder2"
            RLBBorder2.Parent = Borders
            RLBBorder2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            RLBBorder2.BorderSizePixel = 0
            RLBBorder2.Position = UDim2.new(0, -2, 0, 0)
            RLBBorder2.Size = UDim2.new(1, 4, 1, 2)
            RLBBorder2.ZIndex = 8

            TBorder11.Name = "TBorder1-1"
            TBorder11.Parent = Borders
            TBorder11.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            TBorder11.BorderSizePixel = 0
            TBorder11.Position = UDim2.new(0, -1, 0, -1)
            TBorder11.Size = UDim2.new(0, 10, 0, 1)
            TBorder11.ZIndex = 9

            TBorder12.Name = "TBorder1-2"
            TBorder12.Parent = Borders
            TBorder12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TBorder12.BorderSizePixel = 0
            TBorder12.Position = UDim2.new(0, -2, 0, -2)
            TBorder12.Size = UDim2.new(0, 10, 0, 1)
            TBorder12.ZIndex = 8

            TBorder22.Name = "TBorder2-2"
            TBorder22.Parent = Borders
            TBorder22.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TBorder22.BorderSizePixel = 0
            TBorder22.Position = UDim2.new(1, -150, 0, -2)
            TBorder22.Size = UDim2.new(1, -70, 0, 1)
            TBorder22.ZIndex = 8

            TBorder21.Name = "TBorder2-1"
            TBorder21.Parent = Borders
            TBorder21.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            TBorder21.BorderSizePixel = 0
            TBorder21.Position = UDim2.new(1, -150, 0, -1)
            TBorder21.Size = UDim2.new(1, -70, 0, 1)
            TBorder21.ZIndex = 9

            Label.Name = "Label"
            Label.Parent = Section
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderSizePixel = 0
            Label.Position = UDim2.new(0, 15, 0, -10)
            Label.Size = UDim2.new(0, 50, 0, 20)
            Label.ZIndex = 15
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTruncate = Enum.TextTruncate.AtEnd

            SectionItems.Name = "Items"
            SectionItems.Parent = Section
            SectionItems.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionItems.BackgroundTransparency = 1.000
            SectionItems.Position = UDim2.new(0, 0, 0, 14)
            SectionItems.Size = UDim2.new(1, 0, 1, -14)
            SectionItems.ZIndex = 20

            UIListLayout.Parent = SectionItems
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 5)

            SectionItems.ChildAdded:Connect(function(child)
                if string.find(child.ClassName, "UI") then return end
                repeat wait() until child.Size ~= nil and child.Size ~= UDim2.new(0,0,0,0)
                Section.Size = UDim2.new(0, 220, 0, UIListLayout.AbsoluteContentSize.Y + 20)
            end)

            SectionItems.ChildRemoved:Connect(function(child)
                if string.find(child.ClassName, "UI") then return end
                repeat wait() until child.Size ~= nil and child.Size ~= UDim2.new(0,0,0,0)
                Section.Size = UDim2.new(0, 220, 0, UIListLayout.AbsoluteContentSize.Y + 20)
            end)
            
            local textSize = game:GetService("TextService"):GetTextSize(Label.Text, Label.TextSize, Label.Font, Vector2.new(math.huge, math.huge))
            if textSize.x > 150 then
                textSize = Vector2.new(150,0)
            end
            Label.Size = UDim2.new(0, textSize.x + 5, 0, 20)
            TBorder21.Size = UDim2.new(1, textSize.x - textSize.x - textSize.x + -20, 0, 1)
            TBorder22.Size = UDim2.new(1, textSize.x - textSize.x - textSize.x + -20, 0, 1)
            TBorder21.Position = UDim2.new(1, TBorder21.AbsoluteSize.X - TBorder21.AbsoluteSize.X - TBorder21.AbsoluteSize.X, 0, -1)
            TBorder22.Position = UDim2.new(1, TBorder21.AbsoluteSize.X - TBorder21.AbsoluteSize.X - TBorder21.AbsoluteSize.X, 0, -2)

            local items = {}
            function items:Toggle(name, default, callback)
                name = name or "New Toggle"
                if not type(name) == "string" then name = "New Toggle" end
                default = default or false
                if not type(default) == "boolean" then default = false end
                callback = callback or function() end
                if not type(callback) == "function" then callback = function() end end

                local Toggle = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                local Button = Instance.new("TextButton")
                local ToggleFrame = Instance.new("Frame")
                local Border2 = Instance.new("Frame")
                local Background = Instance.new("Frame")
                local Border1 = Instance.new("Frame")

                Toggle.Name = name
                Toggle.Parent = SectionItems
                Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.BackgroundTransparency = 1.000
                Toggle.Size = UDim2.new(1, -20, 0, 15)

                Text.Name = "Text"
                Text.Parent = Toggle
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0, 20, 0, 0)
                Text.Size = UDim2.new(1, -25, 1, 0)
                Text.Font = Enum.Font.GothamSemibold
                Text.Text = name
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 14.000
                Text.TextXAlignment = Enum.TextXAlignment.Left

                Button.Name = "Button"
                Button.Parent = Toggle
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(1, 0, 1, 0)
                Button.ZIndex = 25
                Button.Font = Enum.Font.SourceSans
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000
                Button.TextTransparency = 1.000

                ToggleFrame.Name = "ToggleFrame"
                ToggleFrame.Parent = Toggle
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                ToggleFrame.BackgroundTransparency = 1.000
                ToggleFrame.BorderSizePixel = 0
                ToggleFrame.Position = UDim2.new(0, 2, 0, 2)
                ToggleFrame.Size = UDim2.new(0, 10, 0, 10)

                Border2.Name = "Border2"
                Border2.Parent = ToggleFrame
                Border2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                Border2.BorderSizePixel = 0
                Border2.Position = UDim2.new(0, -2, 0, -2)
                Border2.Size = UDim2.new(1, 4, 1, 4)
                Border2.ZIndex = 8

                Background.Name = "Background"
                Background.Parent = ToggleFrame
                Background.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                Background.BorderSizePixel = 0
                Background.Size = UDim2.new(1, 0, 1, 0)
                Background.ZIndex = 10

                Border1.Name = "Border1"
                Border1.Parent = ToggleFrame
                Border1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Border1.BorderSizePixel = 0
                Border1.Position = UDim2.new(0, -1, 0, -1)
                Border1.Size = UDim2.new(1, 2, 1, 2)
                Border1.ZIndex = 9

                if default == true then
                    Background.BackgroundColor3 = Color3.fromRGB(201, 43, 67)
                end

                local cooldown = false
                Button.MouseButton1Click:Connect(function()
                    if cooldown == false then
                        cooldown = true
                        if default == true then
                            game:GetService("TweenService"):Create(Background, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(38, 38, 38)}):Play()
                            default = false
                            pcall(callback, false)
                        else
                            game:GetService("TweenService"):Create(Background, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(201, 43, 67)}):Play()
                            default = true
                            pcall(callback, true)
                        end
                        wait(0.25)
                        cooldown = false
                    end
                end)
            end
            function items:Dropdown(name, items, default, callback)
                name = name or "New Dropdown"
                if not type(name) == "string" then name = "New Dropdown" end
                items = items or {"A", "B", "C"}
                if not type(items) == "table" then items = {"A", "B", "C"} end
                default = default or ""
                if not type(default) == "string" then default = "" end
                callback = callback or function() end
                if not type(callback) == "function" then callback = function() end end

                local Dropdown = Instance.new("Frame")
                local DropdownFrame = Instance.new("Frame")
                local Button = Instance.new("TextButton")
                local ItemFrame = Instance.new("ScrollingFrame")
                local UIListLayout2 = Instance.new("UIListLayout")
                local Arrow = Instance.new("ImageButton")
                local Text = Instance.new("TextLabel")
                local Border2 = Instance.new("Frame")
                local Border1 = Instance.new("Frame")
                local Background = Instance.new("Frame")
                local Text_2 = Instance.new("TextLabel")

                Dropdown.Name = name
                Dropdown.Parent = SectionItems
                Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.BackgroundTransparency = 1.000
                Dropdown.Position = UDim2.new(0.0454545468, 0, 0.448529422, 0)
                Dropdown.Size = UDim2.new(1, -20, -0, 35)

                DropdownFrame.Name = "DropdownFrame"
                DropdownFrame.Parent = Dropdown
                DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownFrame.BackgroundTransparency = 1.000
                DropdownFrame.BorderSizePixel = 0
                DropdownFrame.Position = UDim2.new(0, 0, 0, 20)
                DropdownFrame.Size = UDim2.new(1, 0, 1, -20)

                Button.Name = "Button"
                Button.Parent = DropdownFrame
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(1, 0, 0, 15)
                Button.ZIndex = 25
                Button.Font = Enum.Font.SourceSans
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000
                Button.TextTransparency = 1.000

                ItemFrame.Name = "ItemFrame"
                ItemFrame.Parent = DropdownFrame
                ItemFrame.Active = true
                ItemFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ItemFrame.BackgroundTransparency = 1.000
                ItemFrame.Position = UDim2.new(0, 0, 0, 20)
                ItemFrame.Size = UDim2.new(1, 0, 1, -20)
                ItemFrame.ZIndex = 20
                ItemFrame.ScrollBarThickness = 0

                UIListLayout2.Parent = ItemFrame
                UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout2.Padding = UDim.new(0, 3)

                Arrow.Name = "Arrow"
                Arrow.Parent = DropdownFrame
                Arrow.BackgroundTransparency = 1.000
                Arrow.Position = UDim2.new(1, -17, 0, 0)
                Arrow.Size = UDim2.new(0, 15, 0, 15)
                Arrow.ZIndex = 20
                Arrow.Image = "rbxassetid://3926305904"
                Arrow.ImageRectOffset = Vector2.new(564, 284)
                Arrow.ImageRectSize = Vector2.new(36, 36)

                Text.Name = "Text"
                Text.Parent = DropdownFrame
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0, 5, 0, 0)
                Text.Size = UDim2.new(1, -25, 0, 15)
                Text.ZIndex = 20
                Text.Font = Enum.Font.GothamSemibold
                Text.Text = default
                Text.TextColor3 = Color3.fromRGB(205, 205, 205)
                Text.TextSize = 12.000
                Text.TextXAlignment = Enum.TextXAlignment.Left

                Border2.Name = "Border2"
                Border2.Parent = DropdownFrame
                Border2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                Border2.BorderSizePixel = 0
                Border2.Position = UDim2.new(0, -2, 0, -2)
                Border2.Size = UDim2.new(1, 4, 1, 4)
                Border2.ZIndex = 8

                Border1.Name = "Border1"
                Border1.Parent = DropdownFrame
                Border1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Border1.BorderSizePixel = 0
                Border1.Position = UDim2.new(0, -1, 0, -1)
                Border1.Size = UDim2.new(1, 2, 1, 2)
                Border1.ZIndex = 9

                Background.Name = "Background"
                Background.Parent = DropdownFrame
                Background.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                Background.BorderSizePixel = 0
                Background.Size = UDim2.new(1, 0, 1, 0)
                Background.ZIndex = 10

                Text_2.Name = "Text"
                Text_2.Parent = Dropdown
                Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.BackgroundTransparency = 1.000
                Text_2.Size = UDim2.new(1, 0, 0, 15)
                Text_2.ZIndex = 20
                Text_2.Font = Enum.Font.GothamSemibold
                Text_2.Text = name
                Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.TextSize = 14.000
                Text_2.TextXAlignment = Enum.TextXAlignment.Left

                local open = false
                local cooldown = false

                Button.MouseButton1Click:Connect(function()
                    if cooldown == false then
                        cooldown = true
                        if open == false then
                            game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.25), {Size = UDim2.new(0,200,0,UIListLayout2.AbsoluteContentSize.Y + 40)}):Play()
                            game:GetService("TweenService"):Create(Section, TweenInfo.new(0.25), {Size = UDim2.new(0,220,0,UIListLayout2.AbsoluteContentSize.Y + UIListLayout.AbsoluteContentSize.Y + 30)}):Play()
                            open = true
                        else
                            game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.25), {Size = UDim2.new(0,200,0,35)}):Play()
                            game:GetService("TweenService"):Create(Section, TweenInfo.new(0.25), {Size = UDim2.new(0,220,0,UIListLayout.AbsoluteContentSize.Y - UIListLayout2.AbsoluteContentSize.Y + 20)}):Play()
                            open = false
                        end
                        wait(0.25)
                        cooldown = false
                    end
                end)

                local firstItem = true
                local selectedItem = nil
                function update()
                    for _,v in pairs(ItemFrame:GetChildren()) do
                        if not string.find(v.ClassName, "UI") then
                            v:Destroy()
                        end
                    end
                    for _,v in pairs(items) do
                        local Item = Instance.new("TextButton")

                        Item.Name = v
                        Item.Parent = ItemFrame
                        Item.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                        Item.BackgroundTransparency = 1.000
                        Item.Size = UDim2.new(1, -10, 0, 20)
                        Item.Font = Enum.Font.GothamSemibold
                        Item.Text = v
                        Item.TextColor3 = Color3.fromRGB(170, 170, 170)
                        Item.TextSize = 14.000

                        if firstItem then
                            Item.TextColor3 = Color3.fromRGB(255,255,255)
                            selectedItem = Item
                            firstItem = false
                        end

                        local tween = nil
                        Item.MouseEnter:Connect(function()
                            if selectedItem ~= Item then
                                if tween ~= nil then tween:Cancel() tween = nil end
                                tween = game:GetService("TweenService"):Create(Item, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(255,255,255)})
                                tween:Play()
                                wait(0.25)
                                tween = nil
                            end
                        end)

                        Item.MouseLeave:Connect(function()
                            if selectedItem ~= Item then
                                if tween ~= nil then tween:Cancel() tween = nil end
                                tween = game:GetService("TweenService"):Create(Item, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(170,170,170)})
                                tween:Play()
                                wait(0.25)
                                tween = nil
                            end
                        end)

                        local cooldown2 = false
                        Item.MouseButton1Click:Connect(function()
                            if cooldown2 == false then
                                cooldown2 = true
                                selectedItem = Item
                                for i,v in pairs(ItemFrame:GetChildren()) do
                                    if not string.find(v.ClassName, "UI") and v ~= selectedItem then
                                        game:GetService("TweenService"):Create(v, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(170,170,170)}):Play()
                                    end
                                end
                                if tween ~= nil then tween:Cancel() tween = nil end
                                game:GetService("TweenService"):Create(Item, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(255,255,255)})
                                wait(0.125)
                                game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.25), {Size = UDim2.new(0,200,0,35)}):Play()
                                game:GetService("TweenService"):Create(Section, TweenInfo.new(0.25), {Size = UDim2.new(0,220,0,UIListLayout.AbsoluteContentSize.Y - UIListLayout2.AbsoluteContentSize.Y + 20)}):Play()
                                open = false
                                Text.Text = selectedItem.Name
                                wait(0.125)
                                pcall(callback, selectedItem.Name)
                                cooldown2 = false
                            end
                        end)
                    end
                end
                update()
            end
            function items:Slider(name, min, default, max, callback)
                name = name or "New Slider"
                if not type(name) == "string" then name = "New Slider" end
                min = min or 0
                if not type(min) == "number" then min = 0 end
                default = default or 50
                if not type(default) == "number" then default = 50 end
                max = max or 100
                if not type(max) == "number" then max = 100 end

                if min > max then min = max - 1 end
                if max < min then max = min + 1 end
                if default < min then default = min end
                if default > max then default = max end

                local Slider = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                local SliderOuter = Instance.new("Frame")
                local SliderInner = Instance.new("Frame")
                local Border2 = Instance.new("Frame")
                local Border1 = Instance.new("Frame")
                local Background = Instance.new("Frame")
                local Button = Instance.new("TextButton")
                
                Slider.Name = name
                Slider.Parent = SectionItems
                Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slider.BackgroundTransparency = 1.000
                Slider.Size = UDim2.new(1, -20, 0, 16)
                
                Text.Name = "Text"
                Text.Parent = Slider
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Size = UDim2.new(1, 0, 1, 0)
                Text.ZIndex = 20
                Text.Font = Enum.Font.GothamSemibold
                Text.Text = name .. ": " .. tostring(default)
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 14.000
                
                SliderOuter.Name = "SliderOuter"
                SliderOuter.Parent = Slider
                SliderOuter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderOuter.BackgroundTransparency = 1.000
                SliderOuter.BorderSizePixel = 0
                SliderOuter.Size = UDim2.new(1, 0, 1, 0)
                
                SliderInner.Name = "SliderInner"
                SliderInner.Parent = SliderOuter
                SliderInner.BackgroundColor3 = Color3.fromRGB(201, 43, 67)
                SliderInner.BorderSizePixel = 0
                SliderInner.Size = UDim2.new(0.75, 0, 1, 0)
                SliderInner.ZIndex = 15

                local a = max - min
                local b = default - min
                local c = b / a
                local d = c * SliderOuter.AbsoluteSize.X
                SliderInner.Size = UDim2.new(0, d, 1,0)
                
                Border2.Name = "Border2"
                Border2.Parent = SliderOuter
                Border2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                Border2.BorderSizePixel = 0
                Border2.Position = UDim2.new(0, -2, 0, -2)
                Border2.Size = UDim2.new(1, 4, 1, 4)
                Border2.ZIndex = 8
                
                Border1.Name = "Border1"
                Border1.Parent = SliderOuter
                Border1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Border1.BorderSizePixel = 0
                Border1.Position = UDim2.new(0, -1, 0, -1)
                Border1.Size = UDim2.new(1, 2, 1, 2)
                Border1.ZIndex = 9
                
                Background.Name = "Background"
                Background.Parent = SliderOuter
                Background.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                Background.BorderSizePixel = 0
                Background.Size = UDim2.new(1, 0, 1, 0)
                Background.ZIndex = 10
                
                Button.Name = "Button"
                Button.Parent = SliderOuter
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(1, 0, 1, 0)
                Button.ZIndex = 20
                Button.Font = Enum.Font.SourceSans
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000
                Button.TextTransparency = 1.000

                local ValueNum = default

                function update()
                    SliderInner.Size = UDim2.new(0, math.clamp(game.Players.LocalPlayer:GetMouse().X - SliderInner.AbsolutePosition.X, 0, SliderOuter.AbsoluteSize.X), 1, 0)
                    ValueNum = math.floor((((tonumber(max) - tonumber(min)) / SliderOuter.AbsoluteSize.X) * SliderInner.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(ValueNum)
                    end)
                    Text.Text = name .. ": " .. tostring(ValueNum)
                    moveconnection = game.Players.LocalPlayer:GetMouse().Move:Connect(function()
                        ValueNum = math.floor((((tonumber(max) - tonumber(min)) / SliderOuter.AbsoluteSize.X) * SliderInner.AbsoluteSize.X) + tonumber(min))
                        Text.Text = name .. ": " .. tostring(ValueNum)
                        pcall(function()
                            callback(ValueNum)
                        end)
                        SliderInner.Size = UDim2.new(0, math.clamp(game.Players.LocalPlayer:GetMouse().X - SliderInner.AbsolutePosition.X, 0, SliderOuter.AbsoluteSize.X), 1, 0)
                    end)
                    releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            ValueNum = math.floor((((tonumber(max) - tonumber(min)) / SliderOuter.AbsoluteSize.X) * SliderInner.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(ValueNum)
                            end)
                            SliderInner.Size = UDim2.new(0, math.clamp(game.Players.LocalPlayer:GetMouse().X - SliderInner.AbsolutePosition.X, 0, SliderOuter.AbsoluteSize.X), 1, 0)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end
                Button.MouseButton1Down:Connect(update)
            end
            function items:Keybind(name, default, callback)
                name = name or "New Keybind"
                if not type(name) == "string" then name = "New Keybind" end
                default = default or "E"
                if not type(default) == "string" or Enum.KeyCode[default] == nil then default = "E" end
                callback = callback or function() end
                if not type(callback) == "function" then callback = function() end end

                local Keybind = Instance.new("Frame")
                local Button = Instance.new("TextButton")
                local Value = Instance.new("TextLabel")
                local Text = Instance.new("TextLabel")

                Keybind.Name = name
                Keybind.Parent = SectionItems
                Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Keybind.BackgroundTransparency = 1.000
                Keybind.Position = UDim2.new(0.0454545468, 0, 0.448529422, 0)
                Keybind.Size = UDim2.new(1, -20, 0, 15)

                Button.Name = "Button"
                Button.Parent = Keybind
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(1, 0, 1, 0)
                Button.ZIndex = 5
                Button.Font = Enum.Font.SourceSans
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000
                Button.TextTransparency = 1.000

                Value.Name = "Value"
                Value.Parent = Keybind
                Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Value.BackgroundTransparency = 1.000
                Value.Position = UDim2.new(1, -20, 0, 0)
                Value.Size = UDim2.new(0, 20, 1, 0)
                Value.Font = Enum.Font.GothamSemibold
                Value.Text = default
                Value.TextColor3 = Color3.fromRGB(255, 255, 255)
                Value.TextSize = 14.000
                Value.TextXAlignment = Enum.TextXAlignment.Right

                Text.Name = "Text"
                Text.Parent = Keybind
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Size = UDim2.new(1, -15, 0, 15)
                Text.ZIndex = 20
                Text.Font = Enum.Font.GothamSemibold
                Text.Text = name
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 14.000
                Text.TextXAlignment = Enum.TextXAlignment.Left

                local cooldown = false
                local key = default
                local allowKeyChange = false
                Button.MouseButton1Click:Connect(function()
                    if cooldown == false then
                        cooldown = true
                        for i = 1, #Value.Text do
                            Value.Text = string.sub(Value.Text, 1, #Value.Text - 1)
                            wait(0.05)
                        end
                        for i = 1, 3 do
                            Value.Text = string.sub("...", 1, i)
                            wait(0.05)
                        end
                        allowKeyChange = true
                    end
                end)

                game:GetService("UserInputService").InputBegan:connect(function(input, Processed)
                    if allowKeyChange then
                        allowKeyChange = false
                        for i = 1, 3 do
                            Value.Text = string.sub("...", 1, 3 - i)
                            wait(0.05)
                        end
                        for i = 1, #input.KeyCode.Name do
                            Value.Text = string.sub(input.KeyCode.Name, 1, i)
                            wait(0.05)
                        end
                        key = input.KeyCode.Name
                        wait(0.1)
                        cooldown = false
                    else
                        if input.KeyCode.Name == key then
                            pcall(callback)
                        end
                    end
                end)
            end
            return items
        end
        return items
    end
    return items
end
