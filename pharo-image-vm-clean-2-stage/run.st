"run.st"

(ZnServer defaultOn: 8080)
  logLevel: 1;
  start.

ZnLogEvent announcer
  when: ZnLogEvent 
  do: [ :event | event traceCr ]
  for: ZnServer default.
