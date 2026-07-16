function openLog()
   logyear = os.date("%Y")
   logmonth = os.date("%m")
   local logpath = rune.config_dir.."/logs/immlog_"..os.date("%Y-%m.txt")
   rune.echo("Starting logging to: "..logpath)
   rune.log.start(logpath)
end


if rune.log.status() == nil then
   openLog()
end

rune.timer.every(60, function()
   -- Check if we've rolled over to a new month.
   if logyear ~= os.date("%Y") or logmonth ~= os.date("%m") then
      rune.echo("Welcome to a new month! Starting new log file.")
      rune.log.stop()
      openLog()
   end
end, {name="logtimer"})