ArrayPart subclass: #Diff
	instanceVariableNames: 'index value baseArray'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!Diff commentStamp: 'fbs 12/29/2011 10:44' prior: 0!
A Diff is a difference record. An instance is always relative to some Arr a, and means "like a, only with this element replaced with that value."

In particular, note that baseArray is a MutableCell referencing another PersistentArray.!


!Diff methodsFor: 'converting' stamp: 'fbs 12/28/2011 12:45'!
asArray
	| arr |
	arr := baseArray asArray.
	arr at: index put: value.
	^ arr.! !


!Diff methodsFor: 'accessing' stamp: 'fbs 12/29/2011 11:08'!
baseArray
	^ baseArray.! !

!Diff methodsFor: 'accessing' stamp: 'fbs 12/28/2011 12:34'!
index
	^ index.! !

!Diff methodsFor: 'accessing' stamp: 'fbs 12/28/2011 12:34'!
value
	^ value.! !


!Diff methodsFor: 'private' stamp: 'fbs 12/28/2011 11:40'!
index: anInteger value: anObject in: aPersistentArray
	index := anInteger.
	value := anObject.
	baseArray := aPersistentArray.! !


!Diff methodsFor: 'testing' stamp: 'fbs 12/28/2011 11:27'!
isDiff
	^ true.! !


!Diff methodsFor: 'printing' stamp: 'fbs 12/28/2011 15:59'!
printOn: aStream
	aStream
		nextPutAll: 'Diff(';
		nextPutAll: ({index printString. value printString. baseArray printString.} join: ', ');
		nextPutAll: ')'.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Diff class
	instanceVariableNames: ''!

!Diff class methodsFor: 'instance creation' stamp: 'fbs 12/28/2011 11:39'!
index: anInteger value: anObject in: aPersistentArray
	^ self new index: anInteger value: anObject in: aPersistentArray.! !
 anInteger value: anObject in: aPersistentArray.! !
