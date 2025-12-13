"build.st"

Metacello new
  repository: 'github://svenvc/zinc/repository';
  baseline: 'ZincHTTPComponents';
  onConflict: [ :e | e useIncoming ];
  onUpgrade: [ :e | e useIncoming ];
  onWarning: [ :e | e load ];
  load: #('default' 'WebSocket').

Smalltalk garbageCollect.
