local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup {
  '*';
  conf = { RRGGBB = true };
  css = { rgb_fn = true };
  html = { names = false };
  rasi = { RRGGBBAA = true };
}
