Ref subclass: #PersistentCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!PersistentCollection commentStamp: 'fbs 12/29/2011 21:27' prior: 0!
A PersistentArray is a reference to an array-like structure that permits one fast access to the _most recent version_ of the array, but also (slower) access to _previous versions_ of the array.

#at: takes an index - an integer - and returns the value associated with that index.
#at:put: takes an index and an object and associates the latter with the former. It returns a new PersistentArray (and, as a side effect, 'reroots' the backing Arr and Diff structures).

An Arr wraps a SequenceableCollection. A Diff describes how to get a new array from an Arr - "like this Arr, but at index i put value v". Rerooting turns a base Arr - the original array - and a sequence of Diffs into an Arr - the current version - into a sequence of Diffs - how to recalculate a previous version - and the current version, an Arr. In other words, rerooting turns pointers into backpointers.

"Rerooting" permits O(1) access to arbitrary elements, and O(n) access to older versions of the array, where n is the number of versions.!


!PersistentCollection methodsFor: 'converting' stamp: 'fbs 12/29/2011 11:18'!
asArray
	^ self value asArray.! !


!PersistentCollection methodsFor: 'accessing' stamp: 'fbs 12/29/2011 21:06'!
at: anInteger
	| t |
	t := value.
	^ t isDiff
		ifFalse: [t array at: anInteger]
		ifTrue: [ | t1 |
			self reroot.
			t1 := value.
			t1 isDiff
				ifTrue: [Error signal: 'Reroot returned a Diff']
				ifFalse: [t1 array at: anInteger]]! !

!PersistentCollection methodsFor: 'accessing' stamp: 'fbs 12/30/2011 08:17'!
at: anInteger put: anObject
	| t |
	self reroot.
	((self at: anInteger) = anObject)
		ifTrue: [^ self].
	
	t := value.
	^ t isDiff
		ifTrue: [Error signal: 'Reroot returns a Diff']
		ifFalse: [ | t1 |
			t1 := value.
			t1 isDiff
				ifFalse: [| old res |
					old := t1 array at: anInteger.
					t1 array at: anInteger put: anObject.
					res := self class wrapping: t1.
					self value: (Diff index: anInteger value: old in: res).
					res]
				ifTrue: [self class wrapping:
							(Diff
								index: anInteger
								value: anObject
								in: self)]].! !


!PersistentCollection methodsFor: 'updating' stamp: 'fbs 12/29/2011 13:52'!
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


!PersistentCollection methodsFor: 'testing' stamp: 'fbs 12/31/2011 15:25'!
includes: anObject
	value isDiff
		ifTrue: [self reroot].
		
	^ value includes: anObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PersistentCollection class
	instanceVariableNames: ''!

!PersistentCollection class methodsFor: 'instance creation' stamp: 'fbs 12/29/2011 11:38'!
initially: anArray
	^ self new wrapping: (Arr wrapping: anArray).! !
lf reroot.
	^ value select: aUnaryBlockOrSelector.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PersistentCollection class
	instanceVariableNames: ''!

!PersistentCollection class methodsFor: 'instance creation' stamp: 'fbs 12/29/2011 11:38'!
initially: anArray
	^ self new wrapping: (Arr wrapping: anArray).! !
