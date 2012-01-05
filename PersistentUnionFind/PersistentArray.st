Ref subclass: #PersistentArray
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!PersistentArray commentStamp: 'fbs 12/29/2011 11:06' prior: 0!
A PersistentArray is a reference to an array-like structure that permits one fast access to the _most recent version_ of the array, but also (slower) access to _previous versions_ of the array.!


!PersistentArray methodsFor: 'converting' stamp: 'fbs 12/29/2011 11:18'!
asArray
	^ self value asArray.! !


!PersistentArray methodsFor: 'accessing' stamp: 'fbs 12/29/2011 13:10'!
at: anInteger
	| t |
	t := value.
	^ t isDiff
		ifFalse: [t array at: anInteger]
		ifTrue: [ | t1 |
			self reroot.
			t1 := value.
			t1 isDiff
				ifFalse: [Error signal: 'Reroot returned a Diff']
				ifTrue: [t1 array at: anInteger]]! !

!PersistentArray methodsFor: 'accessing' stamp: 'fbs 12/29/2011 13:14'!
at: anInteger put: anObject
	| t |
	self reroot.
	t := value.
	^ t isDiff
		ifTrue: [Error signal: 'Reroot returns a Diff']
		ifFalse: [ | t1 |
			t1 := value.
			t1 isDiff
				ifFalse: [| old res |
					old := t1 array at: anInteger.
					t1 array at: anInteger put: anObject.
					res := PersistentArray wrapping: t1.
					self value: (Diff index: anInteger value: old in: res).
					res]
				ifTrue: [PersistentArray wrapping:
							(Diff
								index: anInteger
								value: anObject
								in: self)]].! !


!PersistentArray methodsFor: 'updating' stamp: 'fbs 12/29/2011 13:52'!
reroot
	| t t1 |
	t := value.
	t isDiff ifFalse: [^ self].
	
	t baseArray reroot.
	t1 := t baseArray value.
	t1 isDiff
		ifFalse: [ | v1 |
			v1 := t baseArray at: t index.
			t baseArray at: t index put: t value.
			self value: t1.
			t baseArray value: (Diff index: t index value: v1 in: self)]
		ifTrue: [Error signal: 'Reroot returned a Diff']! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PersistentArray class
	instanceVariableNames: ''!

!PersistentArray class methodsFor: 'instance creation' stamp: 'fbs 12/29/2011 11:38'!
initially: anArray
	^ self new wrapping: (Arr wrapping: anArray).! !
