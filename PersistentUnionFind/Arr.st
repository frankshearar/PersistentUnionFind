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


!Arr methodsFor: 'converting' stamp: 'fbs 12/28/2011 12:38'!
asArray
	^ array copy.! !


!Arr methodsFor: 'printing' stamp: 'fbs 12/28/2011 15:59'!
printOn: aStream
	aStream
		nextPutAll: 'Arr(';
		nextPutAll: array printString;
		nextPutAll: ')'.! !


!Arr methodsFor: 'private' stamp: 'fbs 12/30/2011 08:13'!
wrapping: aSequenceableCollection
	| coll |
	coll := aSequenceableCollection copy.
	array := coll isDictionary
		ifTrue: [DictionaryWithIdentity wrapping: coll]
		ifFalse: [coll].! !


!Arr methodsFor: 'testing' stamp: 'fbs 12/31/2011 10:52'!
includes: anObject
	^ array includes: anObject.! !



"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Arr class
	instanceVariableNames: 'array'!

!Arr class methodsFor: 'instance creation' stamp: 'fbs 12/28/2011 11:45'!
wrapping: aSequenceableCollection
	^ self new wrapping: aSequenceableCollection.! !
tor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Arr class
	instanceVariableNames: 'array'!

!Arr class methodsFor: 'instance creation' stamp: 'fbs 12/28/2011 11:45'!
wrapping: aSequenceableCollection
	^ self new wrapping: aSequenceableCollection.! !
