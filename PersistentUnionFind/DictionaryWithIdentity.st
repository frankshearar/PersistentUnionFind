DictionaryWithDefault subclass: #DictionaryWithIdentity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!DictionaryWithIdentity commentStamp: 'fbs 12/30/2011 23:21' prior: 0!
A DictionaryWithDefault that maps unknown keys to themselves.!



!DictionaryWithIdentity methodsFor: 'private' stamp: 'fbs 12/30/2011 23:12'!
wrapping: aDictionary
	super wrapping: aDictionary default: #yourself.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DictionaryWithIdentity class
	instanceVariableNames: ''!

!DictionaryWithIdentity class methodsFor: 'instance creation' stamp: 'fbs 12/30/2011 08:03'!
wrapping: aDictionary
	^ self new wrapping: aDictionary.! !
- -- -- -- -- -- -- -- -- -- -- -- "!

DictionaryWithIdentity class
	instanceVariableNames: ''!

!DictionaryWithIdentity class methodsFor: 'instance creation' stamp: 'fbs 12/30/2011 08:03'!
wrapping: aDictionary
	^ self new wrapping: aDictionary.! !
ionary.! !
