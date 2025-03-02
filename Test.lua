--[[

	Maga Interface Suite Test File
	This file demonstrates the core functionality of the Maga UI library

]]--

-- Load the Maga library
local MagaLib = loadstring(readfile("Maga.lua"))()

-- Create a window with configuration
local Window = MagaLib:CreateWindow({
    Name = "Maga Test Window",
    LoadingTitle = "Maga Interface Suite",
    LoadingSubtitle = "Test Interface",
    Theme = "Default",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MagaTest",
        FileName = "TestConfig"
    }
})

-- Create tabs to organize elements
local MainTab = Window:CreateTab("Main Features", "home")
local ThemeTab = Window:CreateTab("Theme Testing", "palette")

-- Create sections in the main tab
local ButtonSection = MainTab:CreateSection("Button Examples")

-- Add a simple button
local Button = MainTab:CreateButton({
    Name = "Test Button",
    Callback = function()
        print("Button clicked!")
    end
})

-- Add a toggle
local Toggle = MainTab:CreateToggle({
    Name = "Test Toggle",
    CurrentValue = false,
    Flag = "TestToggle",
    Callback = function(Value)
        print("Toggle is now: ", Value)
    end
})

-- Add a slider
local Slider = MainTab:CreateSlider({
    Name = "Test Slider",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 50,
    Flag = "TestSlider",
    Callback = function(Value)
        print("Slider value: ", Value)
    end
})

-- Add a dropdown
local Dropdown = MainTab:CreateDropdown({
    Name = "Test Dropdown",
    Options = {"Option 1", "Option 2", "Option 3"},
    CurrentOption = "Option 1",
    Flag = "TestDropdown",
    Callback = function(Option)
        print("Selected option: ", Option)
    end
})

-- Add theme testing controls
local ThemeSection = ThemeTab:CreateSection("Theme Controls")

-- Add theme switcher
local ThemeDropdown = ThemeTab:CreateDropdown({
    Name = "Select Theme",
    Options = {"Default", "Ocean", "Light"},
    CurrentOption = "Default",
    Flag = "ThemeSelector",
    Callback = function(Theme)
        Window:ChangeTheme(Theme)
        print("Theme changed to: ", Theme)
    end
})

-- Add a notification test button
local NotifyButton = ThemeTab:CreateButton({
    Name = "Test Notification",
    Callback = function()
        MagaLib:Notify({
            Title = "Test Notification",
            Content = "This is a test notification from Maga Interface Suite",
            Duration = 5
        })
    end
})

-- Add a color picker
local ColorPicker = ThemeTab:CreateColorPicker({
    Name = "Color Picker",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "ColorPicker",
    Callback = function(Color)
        print("Selected color: ", Color)
    end
})

-- Add an input field
local Input = MainTab:CreateInput({
    Name = "Test Input",
    PlaceholderText = "Enter text here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        print("Input text: ", Text)
    end
})

print("Maga Interface Suite test initialized!")
