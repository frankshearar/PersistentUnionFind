ArrayPart subclass: #Arr
	instanceVariableNames: 'array'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!Arr commentStamp: 'fbs 12/28/2011 11:12' prior: 0!
An Arr is a wrapper for an array - really, a SequenceableCollection.!


!Arr methodsFor: 'accessing' stamp: 'fbs 12/28/2011 12:53'!
array
	^ array! !

!Arr methodsFor: 'accessing' stamp: 'fbs 1/15/2012 11:49'!
keys
	"Return the domain of the partial function this collection represents. Or, its indices."
	^ array keys! !


!Arr methodsFor: 'converting' stamp: 'fbs 12/28/2011 12:38'!
asArray
	^ array copy.! !


!Arr methodsFor: 'enumerating' stamp: 'fbs 1/10/2012 19:18'!
do: aUnaryBlock
	^ array do: aUnaryBlock.! !

!Arr methodsFor: 'enumerating' stamp: 'fbs 1/16/2012 15:51'!
reject: aUnaryBlockOrSelector
	^ array reject: aUnaryBlockOrSelector.! !

!Arr methodsFor: 'enumerating' stamp: 'fbs 1/1/2012 13:58'!
select: aUnaryBlockOrSelector
	^ array select: aUnaryBlockOrSelector.! !


!Arr methodsFor: 'printing' stamp: 'fbs 12/28/2011 15:59'!
printOn: aStream
	aStream
		nextPutAll: 'Arr(';
		nextPutAll: array printString;
		nextPutAll: ')'.! !


!Arr methodsFor: 'testing' stamp: 'fbs 12/31/2011 10:52'!
includes: anObject
	^ array includes: anObject.! !


!Arr methodsFor: 'unification' stamp: 'fbs 1/2/2012 13:50'!
elementsOfClass: aParentObject
	^ array elementsOfClass: aParentObject.! !


!Arr methodsFor: 'private' stamp: 'fbs 12/30/2011 08:13'!
wrapping: aSequenceableCollection
	| coll |
	coll := aSequenceableCollection copy.
	array := coll isDictionary
		ifTrue: [DictionaryWithIdentity wrapping: coll]
		ifFalse: [coll].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Arr class
	instanceVariableNames: 'array'!

!Arr class methodsFor: 'instance creation' stamp: 'fbs 12/28/2011 11:45'!
wrapping: aSequenceableCollection
	^ self new wrapping: aSequenceableCollection.! !
