bluez_monitor.enabled = true

bluez_monitor.properties = {
  ["bluez5.headset-roles"] = "[ ]",
  ["bluez5.hfphsp-backend"] = "none",

  ["with-logind"] = true,
}

bluez_monitor.rules = {
  {
    matches = {
      {
        { "device.name", "matches", "bluez_card.*" },
      },
    },
    apply_properties = {
      ["bluez5.auto-connect"]  = "[ hfp_hf hsp_hs a2dp_sink ]",
    },
  },
  {
    matches = {
      {
        { "node.name", "matches", "bluez_input.*" },
      },
      {
        { "node.name", "matches", "bluez_output.*" },
      },
    },
    apply_properties = {
    },
  },
}
