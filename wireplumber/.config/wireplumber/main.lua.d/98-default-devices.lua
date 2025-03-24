table.insert(v4l2_monitor.rules, {
  matches = {
    {
      { "node.name",   "matches", "v4l2_input.pci-0000_07_00.4-usb-0_1.1.4.3_1.0" },
      { "media.class", "matches", "Video/Source" },
    },
  },
  apply_properties = {
    ["priority.driver"] = 3000,
    ["priority.session"] = 3000,
    ["node.preferred"] = true,
  },
})
