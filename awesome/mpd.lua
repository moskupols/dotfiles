
-- BEGIN OF AWESOMPD WIDGET DECLARATION

local beautiful = require('beautiful')
local awesompd = require('awesompd/awesompd')

musicwidget = awesompd:create() -- Create awesompd widget
musicwidget.font = "Liberation Mono 8" -- Set widget font
musicwidget.font_color = beautiful.fg_widget --Set widget font color
musicwidget.background = beautiful.bg_widget --Set widget background color
musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
musicwidget.output_size = 25 -- Set the size of widget in symbols
musicwidget.update_interval = 10 -- Set the update interval in seconds

-- Set the folder where icons are located (change username to your login name)
musicwidget.path_to_icons = "/home/moskupols/.config/awesome/awesompd/icons"

-- Set the path to the icon to be displayed on the widget itself
-- musicwidget.widget_icon = "/home/moskupols/.config/awesome/awesompd/icons/play_icon.png"

-- Specify the browser you use so awesompd can open links from
-- Jamendo in it.
musicwidget.browser = "google-chrome"

-- If true, song notifications for Jamendo tracks and local tracks
-- will also contain album cover image.
musicwidget.show_album_cover = true

-- Specify how big in pixels should an album cover be. Maximum value
-- is 100.
musicwidget.album_cover_size = 50

-- This option is necessary if you want the album covers to be shown
-- for your local tracks.
musicwidget.mpd_config = "/home/moskupols/.config/mpd/mpd.conf"

-- Specify decorators on the left and the right side of the
-- widget. Or just leave empty strings if you decorate the widget
-- from outside.
musicwidget.ldecorator = ""
musicwidget.rdecorator = ""

-- Set all the servers to work with (here can be any servers you use)
musicwidget.servers = {
  { server = "localhost",
    port = 6600 }
  -- { server = "192.168.0.72",
    -- port = 6600 }
}


-- END OF AWESOMPD WIDGET DECLARATION

return musicwidget

