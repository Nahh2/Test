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

--[[Parameters for MakeTab:
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.]]
```

### Adding UI Elements

#### Label

```lua
MainTab:AddLabel("This is a label")

--[[Parameters for AddLabel:
Text = <string> - The text to display on the label.]]
```

#### Button

```lua
MainTab:AddButton({
    Name = "Button",
    Callback = function()
        print("Button clicked")
    end
})

--[[Parameters for AddButton:
Name = <string> - The name/text of the button.
Callback = <function> - The function that gets called when the button is pressed.]]
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

--[[
Parameters for AddToggle:
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Flag = <string> - The identifier for the configuration saving system.
Save = <bool> - Determines if the toggle state should be saved.
Callback = <function> - The function that gets called when the toggle is changed.
]]
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

--[[Parameters for AddSlider:
Name = <string> - The name of the slider.
Min = <number> - The minimum value of the slider.
Max = <number> - The maximum value of the slider.
Default = <number> - The default value of the slider.
Color = <Color3> - The color of the slider.
Increment = <number> - How much the slider will change value when dragged.
ValueName = <string> - The text after the value number.
Flag = <string> - The identifier for the configuration saving system.
Save = <bool> - Determines if the slider value should be saved.
Callback = <function> - The function that gets called when the slider value changes.]]
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

--[[Parameters for AddDropdown:
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The available options in the dropdown.
Flag = <string> - The identifier for the configuration saving system.
Save = <bool> - Determines if the dropdown value should be saved.
Callback = <function> - The function that gets called when an option is selected.]]
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

--[[Parameters for AddColorpicker:
Name = <string> - The name of the colorpicker.
Default = <Color3> - The default color of the colorpicker.
Flag = <string> - The identifier for the configuration saving system.
Save = <bool> - Determines if the selected color should be saved.
Callback = <function> - The function that gets called when a color is selected.]]
```

#### Paragraph

```lua
MainTab:AddParagraph("Title", "This is the content of the paragraph")

--[[Parameters for AddParagraph:
Title = <string> - The title of the paragraph.
Content = <string> - The content of the paragraph.]]
```

## Notifications

```lua
OrionLib:MakeNotification({
    Name = "Notification Title",
    Content = "Notification content",
    Image = "rbxassetid://4483345998",
    Time = 5
})

--[[Parameters for MakeNotification:
Name = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - How long the notification should remain visible (in seconds).]]
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

--[[Parameters for Destroy:
None - This function doesn't take any parameters. It simply destroys the UI.]]
```

## Complete Example

```lua
// Load the Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Nahh2/Test/refs/heads/main/Test.lua')))()

// Initialize the library
OrionLib:Init()

// Create a window
local Window = OrionLib:MakeWindow({
    Name = "My Script",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroEnabled = true,
    IntroText = "My Script"
})

// Create a tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

// Add elements to the tab
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

// Keep the script running
while true do
    wait(1)
    -- Your periodic checks or updates here
end
```

## Version

Current version: 2.0.0

# Orion Library
## Localization
### Multi-language Support

Orion Library now supports multiple languages through its localization system. You can load different language packs and switch between them dynamically.

```lua
-- Get available languages
local availableLanguages = OrionLib.Localization:GetAvailableLanguages()

-- Set a specific language
OrionLib.Localization:SetLanguage("Spanish")

-- Get localized text
local buttonText = OrionLib.Localization:GetText("Elements", "Button")

-- Register a UI element for automatic text updates when language changes
local myLabel = Tab:AddLabel("Button")
OrionLib.Localization:RegisterTextElement(myLabel, "Elements", "Button")

-- Add a custom language
local customLanguage = {
    Window = {
        DefaultTitle = "My Custom Title",
        -- Add more translations here
    },
    Elements = {
        Button = "My Button",
        Toggle = "My Toggle",
        -- Add more translations here
    }
    -- Add more categories as needed
}

OrionLib.Localization:AddLanguage("MyLanguage", customLanguage)
```

--[[Parameters for Localization functions:
GetAvailableLanguages() - Returns a table of available language names.
SetLanguage(languageName) - Sets the current language. Returns true if successful.
GetText(category, key) - Gets localized text for the specified category and key.
RegisterTextElement(element, category, key, [formatFunc]) - Registers a UI element for automatic updates.
AddLanguage(languageName, languagePack) - Adds a new language. Returns true if successful.
LoadLanguageFromFile(languageName, filePath) - Loads a language pack from a JSON file.
SaveLanguageToFile(languageName, filePath) - Saves a language pack to a JSON file.]]
