-- After a change run: `systemctl --user restart pipewire pipewire-pulse wireplumber.service`
-- To get the available sinks: `pactl list sinks short` 

--
local rules = {
    {
        matches = {
            { { "node.name", "matches", "alsa_output.pci-0000_07_00.6.HiFi__hw_Generic_1__sink" } }
        },
        apply_properties = {
            ["node.description"] = "Laptop Speakers"
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
            ["node.description"] = "HDMI Output"
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

for _, rule in ipairs(rules) do
    table.insert(alsa_monitor.rules, rule)
end

