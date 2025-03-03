-- Mage UI Library (Combined Orion + Rayfield)

local Mage = {
    Elements = {},
    Themes = {},
    Flags = {},
    -- Combined configuration properties
    SaveConfig = false,
    ConfigurationFolder = "Mage/Configurations"
}

-- Unified theme system combining both libraries' approaches
Mage.Themes.Default = {
    Main = Color3.fromRGB(25, 25, 25),
    TextColor = Color3.fromRGB(240, 240, 240),
    ElementBackground = Color3.fromRGB(35, 35, 35),
    -- Additional theme properties from both libraries
    NotificationBackground = Color3.fromRGB(20, 20, 20),
    SliderProgress = Color3.fromRGB(50, 138, 220)
}

-- Merged initialization function
function Mage:Init()
    -- Combined configuration loading logic
    if self.SaveConfig then
        pcall(function()
            -- Orion-style config loading
            if isfile(self.ConfigurationFolder.."/game_config.txt") then
                LoadConfig(readfile(self.ConfigurationFolder.."/game_config.txt"))
            end
            -- Rayfield-style settings loading
            if isfile(self.ConfigurationFolder.."/settings.rfld") then
                ApplySettings(HttpService:JSONDecode(readfile(self.ConfigurationFolder.."/settings.rfld")))
            end
        end)
    end
end

-- Unified window creation method
function Mage:CreateWindow(config)
    -- Combined window properties from both libraries
    local window = {
        Name = config.Name or "Mage UI",
        Tabs = {},
        -- Orion-style theming
        Theme = config.Theme or "Default",
        -- Rayfield-style configuration saving
        ConfigurationSaving = config.ConfigurationSaving or {Enabled = false}
    }

    -- Merged tab creation logic
    function window:CreateTab(tabName)
        -- Combined tab initialization
        local newTab = {
            Elements = {},
            Name = tabName,
            -- Orion-style element management
            AddElement = function(self, elementConfig)
                -- Unified element creation
            end
        }
        table.insert(window.Tabs, newTab)
        return newTab
    end

    return window
end

function Mage:MakeWindow(config)
    local window = {
        Name = config.Name or "Mage UI",
        Tabs = {},
        Theme = config.Theme or "Default",
        Configuration = {
            Saving = config.ConfigurationSaving or {Enabled = false},
            Folder = config.ConfigFolder or "Mage/Configurations"
        },
        _elements = {},
        _flags = {}
    }

    -- Combined theming system
    window.Themes = {
        Default = table.clone(Mage.Themes.Default),
        DarkBlue = table.clone(Rayfield.Theme.DarkBlue)
    }

    -- Unified initialization
    function window:Init()
        -- Orion-style game config loading
        if self.Configuration.Saving.Enabled then
            pcall(function()
                if isfile(self.Configuration.Folder.."/"..game.GameId..".txt") then
                    LoadConfig(readfile(self.Configuration.Folder.."/"..game.GameId..".txt"))
                end
            end)
        end

        -- Rayfield-style settings loading
        pcall(function()
            if isfile(self.Configuration.Folder.."/settings.rfld") then
                self:ApplySettings(HttpService:JSONDecode(readfile(self.Configuration.Folder.."/settings.rfld")))
            end
        end)
    end

    -- Combined tab creation
    function window:CreateTab(tabName, icon)
        local newTab = {
            Name = tabName,
            Elements = {},
            _columns = {},
            -- Orion-style element management
            AddElement = function(self, elementType, config)
                local element = Mage.Elements[elementType].new(config)
                table.insert(self.Elements, element)
                return element
            end,
            -- Rayfield-style section creation
            CreateSection = function(self, sectionName)
                return {
                    Name = sectionName,
                    _elements = {}
                }
            end
        }
        table.insert(window.Tabs, newTab)
        return newTab
    end

    return window
end

-- Unified notification system
function Mage:MakeNotification(config)
    -- Combine Orion's visual style with Rayfield's action system
    local notification = {
        Title = config.Title or "Notification",
        Content = config.Content or "",
        Duration = config.Time or 5,
        Actions = config.Actions or {}
    }

    -- Orion-style animation framework
    notification.Show = function(self)
        -- Animation logic from Orion
    end

    -- Rayfield-style action handling
    notification.AddAction = function(self, actionConfig)
        table.insert(self.Actions, actionConfig)
    end

    return notification
end

return Mage
