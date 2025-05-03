function descriptor()
    return {
        title = "Ace Stream",
        version = "1.0",
        author = "ilgonmic",
        url = 'https://acestream.org',
        shortdesc = "AceStream Link Loader",
        description = "Enter an acestream:// link and play it via VLC",
        capabilities = {}
    }
end

local dlg = nil
local input_field = nil

function activate()
    dlg = vlc.dialog("AceStream Loader")
    dlg:add_label("Enter acestream:// link:", 1, 1, 1, 1)
    input_field = dlg:add_text_input("", 1, 2, 2, 1)
    dlg:add_button("Play", play_stream, 1, 3, 1, 1)
    dlg:add_button("Close", vlc.deactivate, 2, 3, 1, 1)
end

function close()
    if dlg then
        dlg:delete()
        dlg = nil
    end
end

function deactivate()
    close()
end

function play_stream()
    local input = input_field:get_text()
    local id = string.match(input, "^acestream://([a-zA-Z0-9]+)$")
    if not id then
        vlc.msg.err("[acestream] Invalid link")
        return
    end

    local url = "http://127.0.0.1:6878/ace/getstream?id=" .. id
    vlc.msg.dbg("[acestream] Opening stream: " .. url)
    vlc.playlist.clear()
    vlc.playlist.add({{ path = url, name = "AceStream" }})
    vlc.deactivate()
end
