local shell = require('utils.shell')

-- { Redshift
local redshift_state

-- Dim screen
local function redshift_dim()
  shell.run_command("redshift -o", true, function() redshift_state = 1 end)
end

-- Undim screen
local function redshift_undim()
  shell.run_command("redshift -x", true, function() redshift_state = 0 end)
end

-- Toggle redshift state
local function redshift_toggle()
  if redshift_state == 1 then
    redshift_undim()
  else
    redshift_dim()
  end
end

-- Initial screen to normal
local function redshift_init()
  redshift_state = 0
  redshift_undim()
end

return {
  redshift_toggle = redshift_toggle,
  redshift_init = redshift_init
}
