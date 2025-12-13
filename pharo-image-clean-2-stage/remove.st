"remove.st"

TestCase allSubclassesDo: [ :e | e removeFromSystem].

Smalltalk garbageCollect.
