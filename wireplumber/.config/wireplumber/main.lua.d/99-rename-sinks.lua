-- After a change run: `systemctl --user restart pipewire pipewire-pulse wireplumber.service`
-- To get the available sinks: `pactl list sinks short` 

local rules = {
    {
        matches = {
            { { "node.name", "matches", "alsa_output.pci-0000_07_00.6.HiFi__hw_Generic_1__sink" } }
        },
        apply_properties = {
            ["node.description"] = "Laptop Speaker"
        }
    },
    -- Rename using bluetoothctl: set-alias
    -- {
    --     matches = {
    --         { { "node.name", "matches", "bluez_output.AC_BF_71_67_F9_78.a2dp-sink" } }
    --     },
    --     apply_properties = {
    --         ["node.description"] = "Bluetooth Headphones"
    --     }
    -- },
    -- 
    {
        matches = {
            { { "node.name", "matches", "alsa_output.pci-0000_07_00.1.HiFi__hw_Generic_9__sink" } }
        },
        apply_properties = {
            ["node.description"] = "Ignore"
        }
    },
    {
        matches = {
            { { "node.name", "matches", "alsa_output.pci-0000_07_00.1.HiFi__hw_Generic_8__sink" } }
        },
        apply_properties = {
            ["node.description"] = "Ignore"
        }
    },
    {
        matches = {
            { { "node.name", "matches", "alsa_output.pci-0000_07_00.1.HiFi__hw_Generic_7__sink" } }
        },
        apply_properties = {
            ["node.description"] = "HDMI Output",
            ["node.priority"] = 1000 -- Assign a high priority to HDMI
        }
    },
    {
        matches = {
            { { "node.name", "matches", "alsa_output.pci-0000_07_00.1.HiFi__hw_Generic_3__sink" } }
        },
        apply_properties = {
            ["node.description"] = "Ignore"
        }
    }
}

---- Add fallback logic
--local function set_fallback_to_hdmi()
--    local devices = require("wireplumber.devices")
--    local default_sink = "alsa_output.pci-0000_07_00.1.HiFi__hw_Generic_7__sink" -- HDMI sink
--
--    -- Get the default sink
--    local default_sink_node = devices.get_device_by_name(default_sink)
--    if default_sink_node then
--        default_sink_node.priority = 10j0 -- Ensure HDMI has the highest priority
--    end
--end

for _, rule in ipairs(rules) do
    table.insert(alsa_monitor.rules, rule)
end

-- Call the fallback setup function
-- set_fallback_to_hdmi()

