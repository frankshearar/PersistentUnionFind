Object subclass: #Ref
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!Ref commentStamp: 'fbs 12/29/2011 13:59' prior: 0!
I wrap some other object, acting something like a pointer. Thus, things may have an immutable pointer to me, while having my value be mutable: an immutable reference to a mutable thing.!


!Ref methodsFor: 'printing' stamp: 'fbs 12/29/2011 11:20'!
printOn: aStream
	aStream nextPutAll: ('Ref({1})' format: {value printString})! !


!Ref methodsFor: 'accessing' stamp: 'fbs 12/29/2011 10:38'!
value
	^ value.! !

!Ref methodsFor: 'accessing' stamp: 'fbs 12/29/2011 11:13'!
value: anObject
	value := anObject.! !


!Ref methodsFor: 'private' stamp: 'fbs 12/29/2011 11:14'!
wrapping: anObject
	value := anObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Ref class
	instanceVariableNames: ''!

!Ref class methodsFor: 'instance creation' stamp: 'fbs 12/29/2011 11:13'!
wrapping: anObject
	^ self new wrapping: anObject.! !
