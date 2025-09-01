hs.loadSpoon("AppLauncher")

function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "E", open_app("Visual Studio Code"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "E", open_app("Visual Studio Code - Insiders"))
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F", open_app("Firefox"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "T", open_app("WezTerm"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "C", open_app("Google Chrome"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "B", open_app("Sublime Text"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "W", open_app("Finder"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F", open_app("Firefox"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "O", open_app("Obsidian"))
