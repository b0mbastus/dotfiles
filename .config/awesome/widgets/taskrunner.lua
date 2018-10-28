local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
local filesystem = require("gears.filesystem")

--- Spawn in center of focused screen
--- Show intellisense-like dropdown text window when starting to type

--- Custom taskrunner with fuzzy finder autocompletion capabilities
local ICON = '/home/jan/Desktop/prompt.png'

local taskrunner = awful.widget.prompt()

local w = wibox {
    bg = '#1e252c',
    border_width = 1,
    border_color = '#84bd00',
    max_widget_size = 500,
    ontop = true,
    screen = mouse.screen,
    height = 50,
    width = 300,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 3)
    end
}

w:setup {
    {
        {
            image = ICON,
            widget = wibox.widget.imagebox,
            resize = false
        },
        id = 'icon',
        top = 9,
        left = 10,
        layout = wibox.container.margin
    },
    {
        layout = wibox.container.margin,
        left = 10,
        taskrunner,
    },
    id = 'left',
    layout = wibox.layout.fixed.horizontal
}

--- Widget which is shown when user clicks on the ram widget
local dropdown = wibox {
    height = 200,
    width = 400,
    ontop = true,
    screen = mouse.screen,
    expand = true,
    bg = '#1e252c',
    max_widget_size = 500
}

local function launch()
    w.visible = true
    awful.placement.top(w, { margins = { top = 40 } })
    awful.prompt.run {
        prompt = ">",
        bg_cursor = '#84bd00',
        textbox = taskrunner.widget,
        history_path = filesystem.get_dir('cache') .. '/taskrunner_history',
        exe_callback = function(input_text)
            if not input_text or #input_text == 0 then return end
            awful.spawn("st -e " .. input_text)
        end,
        done_callback = function()
            w.visible = false
        end
    }
end

return {
    launch = launch
}