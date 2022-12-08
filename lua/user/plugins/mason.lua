local status_mason, mason = pcall(require, "mason")
if not status_mason then
  return
end

mason.setup ()

