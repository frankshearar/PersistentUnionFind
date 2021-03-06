Object subclass: #DictionaryWithDefault
	instanceVariableNames: 'dict default'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!DictionaryWithDefault commentStamp: 'fbs 12/30/2011 23:22' prior: 0!
A DictionaryWithDefault is a Dictionary that, for unknown keys, maps those keys to some pluggable behaviour, instead of raising an exception.!


!DictionaryWithDefault methodsFor: 'accessing' stamp: 'fbs 1/1/2012 22:01'!
at: key
	^ dict at: key ifAbsentPut: [default value: key].! !

!DictionaryWithDefault methodsFor: 'accessing' stamp: 'fbs 12/30/2011 23:11'!
at: key put: value
	dict at: key put: value! !

!DictionaryWithDefault methodsFor: 'accessing' stamp: 'fbs 1/15/2012 11:30'!
keys
	^ dict keys! !


!DictionaryWithDefault methodsFor: 'enumerating' stamp: 'fbs 1/10/2012 22:33'!
do: aUnaryBlock
	^ dict values do: aUnaryBlock.! !

!DictionaryWithDefault methodsFor: 'enumerating' stamp: 'fbs 1/10/2012 22:38'!
inject: thisValue into: binaryBlock
	| nextValue |
	nextValue := thisValue.
	self do: [:each | nextValue := binaryBlock value: nextValue value: each].
	^nextValue! !

!DictionaryWithDefault methodsFor: 'enumerating' stamp: 'fbs 1/16/2012 16:30'!
reject: aUnaryBlock
	^ self class
		wrapping: (dict reject: aUnaryBlock)
		default: default.! !


!DictionaryWithDefault methodsFor: 'printing' stamp: 'fbs 12/30/2011 23:11'!
printOn: aStream
	aStream
		nextPutAll: self class name.
	dict printElementsOn: aStream.	! !


!DictionaryWithDefault methodsFor: 'testing' stamp: 'fbs 12/31/2011 15:39'!
includes: key
	^ dict includesKey: key.! !


!DictionaryWithDefault methodsFor: 'unification' stamp: 'fbs 1/2/2012 13:55'!
elementsOfClass: aParentObject
	^ dict elementsOfClass: aParentObject.! !


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
