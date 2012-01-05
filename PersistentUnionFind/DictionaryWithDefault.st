Object subclass: #DictionaryWithDefault
	instanceVariableNames: 'dict default'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!DictionaryWithDefault commentStamp: 'fbs 12/30/2011 23:22' prior: 0!
A DictionaryWithDefault is a Dictionary that, for unknown keys, maps those keys to some pluggable behaviour, instead of raising an exception.!


!DictionaryWithDefault methodsFor: 'accessing' stamp: 'fbs 12/30/2011 23:17'!
at: key
	^ dict at: key ifAbsent: [default value: key].! !

!DictionaryWithDefault methodsFor: 'accessing' stamp: 'fbs 12/30/2011 23:11'!
at: key put: value
	dict at: key put: value! !


!DictionaryWithDefault methodsFor: 'printing' stamp: 'fbs 12/30/2011 23:11'!
printOn: aStream
	aStream
		nextPutAll: self class name.
	dict printElementsOn: aStream.	! !


!DictionaryWithDefault methodsFor: 'private' stamp: 'fbs 12/30/2011 23:12'!
wrapping: aDictionary default: aUnaryBlockOrSelector
	dict := aDictionary.
	default := aUnaryBlockOrSelector.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DictionaryWithDefault class
	instanceVariableNames: ''!

!DictionaryWithDefault class methodsFor: 'instance creation' stamp: 'fbs 12/30/2011 23:14'!
wrapping: aDictionary default: aUnaryBlockOrSelector
	^ self new wrapping: aDictionary default: aUnaryBlockOrSelector.! !
 "!

DictionaryWithDefault class
	instanceVariableNames: ''!

!DictionaryWithDefault class methodsFor: 'instance creation' stamp: 'fbs 12/30/2011 23:14'!
wrapping: aDictionary default: aUnaryBlockOrSelector
	^ self new wrapping: aDictionary default: aUnaryBlockOrSelector.! !
