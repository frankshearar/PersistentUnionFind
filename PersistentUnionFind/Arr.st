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


!Arr methodsFor: 'private' stamp: 'fbs 12/28/2011 19:01'!
wrapping: aSequenceableCollection
	array := aSequenceableCollection copy.! !




"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Arr class
	instanceVariableNames: 'array'!

!Arr class methodsFor: 'instance creation' stamp: 'fbs 12/28/2011 11:45'!
wrapping: aSequenceableCollection
	^ self new wrapping: aSequenceableCollection.! !
/2012 13:50'!
elementsOfClass: aParentObject
	^ array elementsOfClass: aParentObject.! !


!Arr methodsFor: 'enumerating' stamp: 'fbs 1/1/2012 13:58'!
select: aUnaryBlockOrSelector
	^ array select: aUnaryBlockOrSelector.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Arr class
	instanceVariableNames: 'array'!

!Arr class methodsFor: 'instance creation' stamp: 'fbs 12/28/2011 11:45'!
wrapping: aSequenceableCollection
	^ self new wrapping: aSequenceableCollection.! !
