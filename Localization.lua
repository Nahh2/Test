-- Orion Library Localization Module
-- This module provides multi-language support for the Orion Library

local LocalizationModule = {
    CurrentLanguage = "English", -- Default language
    Languages = {}, -- Will store all language packs
    TextElements = {}, -- Will store references to UI elements that need updating when language changes
    DefaultLanguage = "English" -- Fallback language
}

-- Default English language pack
LocalizationModule.Languages["English"] = {
    -- Window elements
    Window = {
        DefaultTitle = "Orion Library",
        DefaultIntroText = "Orion Library",
        SaveConfig = "Save Configuration",
        DestroyUI = "Destroy UI"
    },
    
    -- UI elements
    Elements = {
        Button = "Button",
        Toggle = "Toggle",
        Slider = "Slider",
        Dropdown = "Dropdown",
        Colorpicker = "Colorpicker",
        Label = "Label",
        Paragraph = "Paragraph",
        KeyBind = "KeyBind"
    },
    
    -- Notifications
    Notifications = {
        DefaultTitle = "Notification",
        DefaultContent = "This is a notification",
        ButtonPressed = "Button Pressed",
        ConfigSaved = "Configuration saved successfully",
        ThemeChanged = "Theme set to"
    },
    
    -- Settings
    Settings = {
        Title = "Settings",
        ThemeSettings = "Theme Settings",
        SelectTheme = "Select Theme",
        LanguageSettings = "Language Settings",
        SelectLanguage = "Select Language"
    },
    
    -- Themes
    Themes = {
        Default = "Default",
        Dark = "Dark",
        Light = "Light"
    },
    
    -- Performance
    Performance = {
        Title = "Performance",
        LazyLoading = "Lazy Loading",
        ElementPooling = "Element Pooling",
        CreateTestElements = "Create Test Elements",
        ElementsCreated = "test elements were created and will be recycled after 2 seconds"
    }
}

-- Example Spanish language pack
LocalizationModule.Languages["Spanish"] = {
    -- Window elements
    Window = {
        DefaultTitle = "Biblioteca Orion",
        DefaultIntroText = "Biblioteca Orion",
        SaveConfig = "Guardar Configuración",
        DestroyUI = "Destruir Interfaz"
    },
    
    -- UI elements
    Elements = {
        Button = "Botón",
        Toggle = "Interruptor",
        Slider = "Deslizador",
        Dropdown = "Desplegable",
        Colorpicker = "Selector de Color",
        Label = "Etiqueta",
        Paragraph = "Párrafo",
        KeyBind = "Tecla"
    },
    
    -- Notifications
    Notifications = {
        DefaultTitle = "Notificación",
        DefaultContent = "Esta es una notificación",
        ButtonPressed = "Botón Presionado",
        ConfigSaved = "Configuración guardada con éxito",
        ThemeChanged = "Tema cambiado a"
    },
    
    -- Settings
    Settings = {
        Title = "Ajustes",
        ThemeSettings = "Ajustes de Tema",
        SelectTheme = "Seleccionar Tema",
        LanguageSettings = "Ajustes de Idioma",
        SelectLanguage = "Seleccionar Idioma"
    },
    
    -- Themes
    Themes = {
        Default = "Predeterminado",
        Dark = "Oscuro",
        Light = "Claro"
    },
    
    -- Performance
    Performance = {
        Title = "Rendimiento",
        LazyLoading = "Carga Diferida",
        ElementPooling = "Agrupación de Elementos",
        CreateTestElements = "Crear Elementos de Prueba",
        ElementsCreated = "elementos de prueba fueron creados y se reciclarán después de 2 segundos"
    }
}

-- Function to add a new language pack
function LocalizationModule:AddLanguage(languageName, languagePack)
    if type(languagePack) ~= "table" then
        warn("Language pack must be a table")
        return false
    end
    
    self.Languages[languageName] = languagePack
    return true
 end

-- Function to get text in the current language
function LocalizationModule:GetText(category, key)
    local currentLang = self.Languages[self.CurrentLanguage]
    local defaultLang = self.Languages[self.DefaultLanguage]
    
    -- Try to get text from current language
    if currentLang and currentLang[category] and currentLang[category][key] then
        return currentLang[category][key]
    end
    
    -- Fall back to default language
    if defaultLang and defaultLang[category] and defaultLang[category][key] then
        return defaultLang[category][key]
    end
    
    -- If all else fails, return the key itself
    return key
end

-- Function to change the current language
function LocalizationModule:SetLanguage(languageName)
    if not self.Languages[languageName] then
        warn("Language '" .. languageName .. "' not found")
        return false
    end
    
    self.CurrentLanguage = languageName
    
    -- Update all registered text elements
    self:UpdateAllTextElements()
    
    return true
end

-- Function to register a UI element for automatic text updates
function LocalizationModule:RegisterTextElement(element, category, key, formatFunc)
    table.insert(self.TextElements, {
        Element = element,
        Category = category,
        Key = key,
        FormatFunc = formatFunc -- Optional function to format the text
    })
    
    -- Update the element immediately
    self:UpdateTextElement(#self.TextElements)
    
    return #self.TextElements -- Return the index for potential manual updates
end

-- Function to update a specific text element
function LocalizationModule:UpdateTextElement(index)
    local element = self.TextElements[index]
    if not element then return end
    
    local text = self:GetText(element.Category, element.Key)
    
    -- Apply formatting function if provided
    if element.FormatFunc and type(element.FormatFunc) == "function" then
        text = element.FormatFunc(text)
    end
    
    -- Update the element based on its type
    if typeof(element.Element) == "Instance" then
        if element.Element:IsA("TextLabel") or element.Element:IsA("TextButton") or element.Element:IsA("TextBox") then
            element.Element.Text = text
        end
    elseif type(element.Element) == "table" and element.Element.Set then
        -- For Orion Library elements that have a Set method
        element.Element:Set(text)
    end
end

-- Function to update all registered text elements
function LocalizationModule:UpdateAllTextElements()
    for i = 1, #self.TextElements do
        self:UpdateTextElement(i)
    end
end

-- Function to get a list of available languages
function LocalizationModule:GetAvailableLanguages()
    local languages = {}
    for language, _ in pairs(self.Languages) do
        table.insert(languages, language)
    end
    return languages
end

-- Function to load a language pack from a file
function LocalizationModule:LoadLanguageFromFile(languageName, filePath)
    local success, result = pcall(function()
        local content = readfile(filePath)
        local languagePack = game:GetService("HttpService"):JSONDecode(content)
        return languagePack
    end)
    
    if success then
        self:AddLanguage(languageName, result)
        return true
    else
        warn("Failed to load language from file: " .. result)
        return false
    end
end

-- Function to save a language pack to a file
function LocalizationModule:SaveLanguageToFile(languageName, filePath)
    if not self.Languages[languageName] then
        warn("Language '" .. languageName .. "' not found")
        return false
    end
    
    local success, result = pcall(function()
        local content = game:GetService("HttpService"):JSONEncode(self.Languages[languageName])
        writefile(filePath, content)
        return true
    end)
    
    if success then
        return result
    else
        warn("Failed to save language to file: " .. result)
        return false
    end
end

return LocalizationModule
