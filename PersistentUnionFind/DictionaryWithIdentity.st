Object subclass: #DictionaryWithIdentity
	instanceVariableNames: 'dict'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!

!DictionaryWithIdentity methodsFor: 'accessing' stamp: 'fbs 12/30/2011 08:10'!
at: key
	^ dict at: key ifAbsent: [key].! !

!DictionaryWithIdentity methodsFor: 'accessing' stamp: 'fbs 12/30/2011 08:09'!
at: key put: value
	dict at: key put: value! !


!DictionaryWithIdentity methodsFor: 'private' stamp: 'fbs 12/30/2011 08:02'!
wrapping: aDictionary
	dict := aDictionary.! !


!DictionaryWithIdentity methodsFor: 'printing' stamp: 'fbs 12/30/2011 22:39'!
printOn: aStream
	aStream
		nextPutAll: self class name.
	dict printElementsOn: aStream.	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DictionaryWithIdentity class
	instanceVariableNames: ''!

!DictionaryWithIdentity class methodsFor: 'instance creation' stamp: 'fbs 12/30/2011 08:03'!
wrapping: aDictionary
	^ self new wrapping: aDictionary.! !
ionary.! !
