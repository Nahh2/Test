# Orion Library

A powerful and customizable UI library for Roblox exploits with performance optimizations.

## Features

- **Intuitive API**: Easy-to-use functions for creating UI elements
- **Customizable Themes**: Built-in themes with the ability to create custom ones
- **Configuration Saving**: Save and load UI configurations
- **Performance Optimizations**: Lazy loading and element pooling for better performance
- **Responsive Design**: Clean and modern UI that works across different screen sizes

## Installation

```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Nahh2/Test/refs/heads/main/Test.lua')))() 
```

## Basic Usage

### Initialization

```lua
-- Initialize the library
OrionLib:Init()

-- Create a window
local Window = OrionLib:MakeWindow({
    Name = "My Script",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroEnabled = true,
    IntroText = "My Script"
})
```

### Creating Tabs

```lua
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
```

### Adding UI Elements

#### Label
```lua
MainTab:AddLabel("This is a label")
```

#### Button
```lua
MainTab:AddButton({
    Name = "Button",
    Callback = function()
        print("Button clicked")
    end
})
```

#### Toggle
```lua
MainTab:AddToggle({
    Name = "Toggle",
    Default = false,
    Flag = "myToggle",
    Save = true,
    Callback = function(Value)
        print("Toggle value:", Value)
    end
})
```

#### Slider
```lua
MainTab:AddSlider({
    Name = "Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Value",
    Flag = "mySlider",
    Save = true,
    Callback = function(Value)
        print("Slider value:", Value)
    end
})
```

#### Dropdown
```lua
MainTab:AddDropdown({
    Name = "Dropdown",
    Default = "Option 1",
    Options = {"Option 1", "Option 2", "Option 3"},
    Flag = "myDropdown",
    Save = true,
    Callback = function(Option)
        print("Selected option:", Option)
    end
})
```

#### Colorpicker
```lua
MainTab:AddColorpicker({
    Name = "Colorpicker",
    Default = Color3.fromRGB(255, 0, 0),
    Flag = "myColorpicker",
    Save = true,
    Callback = function(Color)
        print("Selected color:", Color)
    end
})
```

#### Paragraph
```lua
MainTab:AddParagraph("Title", "This is the content of the paragraph")
```

## Notifications

```lua
OrionLib:MakeNotification({
    Name = "Notification Title",
    Content = "Notification content",
    Image = "rbxassetid://4483345998",
    Time = 5
})
```

## Themes

Orion Library comes with three built-in themes: Default, Dark, and Light.

```lua
-- Set theme
OrionLib:SetTheme("Dark") -- Options: "Default", "Dark", "Light"
```

## Performance Optimizations

### Lazy Loading

Tabs are now lazy loaded, meaning their contents are only created when you click on them. This improves initial loading times and reduces memory usage.

### Element Pooling

UI elements are reused instead of being created and destroyed repeatedly. This reduces memory usage and improves performance by minimizing garbage collection.

Example of element recycling:
```lua
local label = Tab:AddLabel("My Label")

-- Later, when you want to hide or recycle the element
label:Set("") -- This makes the element available for reuse
```

## Configuration Saving

Orion Library can automatically save and load configurations when the `SaveConfig` option is set to `true` in the window configuration.

```lua
local Window = OrionLib:MakeWindow({
    Name = "My Script",
    SaveConfig = true,
    ConfigFolder = "MyScriptConfig"
})
```

## Destroying the UI

```lua
OrionLib:Destroy()
```

## Complete Example

```lua
-- Load the Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Nahh2/Test/refs/heads/main/Test.lua')))() 

-- Initialize the library
OrionLib:Init()

-- Create a window
local Window = OrionLib:MakeWindow({
    Name = "My Script",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroEnabled = true,
    IntroText = "My Script"
})

-- Create a tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Add elements to the tab
MainTab:AddLabel("Welcome to my script!")

MainTab:AddButton({
    Name = "Click Me",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Button Clicked",
            Content = "You clicked the button!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

MainTab:AddToggle({
    Name = "Toggle Feature",
    Default = false,
    Flag = "featureToggle",
    Save = true,
    Callback = function(Value)
        -- Your code here
    end
})

-- Keep the script running
while true do
    wait(1)
    -- Your periodic checks or updates here
end
```

## Version

Current version: 2.0.0
