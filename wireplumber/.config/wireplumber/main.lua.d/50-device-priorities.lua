-- Device priority configuration for video sources
-- Override v4l2_monitor rules to set proper priorities

v4l2_monitor.rules = {
  -- Set Creative Live! Cam as highest priority
  {
    matches = {
      {
        { "node.name", "equals", "v4l2_input.pci-0000_07_00.4-usb-0_1.1.4.3_1.0" },
      },
    },
    apply_properties = {
      ["priority.driver"] = 1200,
      ["priority.session"] = 1200,
    },
  },
  -- Lower priority for integrated cameras
  {
    matches = {
      {
        { "node.name", "matches", "v4l2_input.pci-0000_06_00.0-usb-0_2_1.*" },
      },
    },
    apply_properties = {
      ["priority.driver"] = 500,
      ["priority.session"] = 500,
    },
  },
  -- Default rule for other v4l2 devices
  {
    matches = {
      {
        { "node.name", "matches", "v4l2_input.*" },
      },
    },
    apply_properties = {
      ["priority.driver"] = 800,
      ["priority.session"] = 800,
    },
  },
}