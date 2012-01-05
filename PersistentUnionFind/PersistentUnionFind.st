Object subclass: #PersistentUnionFind
	instanceVariableNames: 'arrayType ranks parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!PersistentUnionFind commentStamp: 'fbs 12/28/2011 11:07' prior: 0!
A union-find data structure maintains a _partition_ of objects in some structure. That is, it implicitly defines an equivalence relation between the nodes of some structure.

The structure provides two methods - _find_ returns the representative of some class of nodes, and _union_ merges two classes of nodes.

* ranks is an array of the ranks (sizes) of the various equivalence classes.
* parents is an array of the representative terms for each of the equivalence classes.!


!PersistentUnionFind methodsFor: 'accessing' stamp: 'fbs 12/29/2011 17:56'!
find: anObject
	"Return the representative element of anObject's equivalence class."
	| fAndCx |
	fAndCx := self findAux: anObject in: parents.
	parents := fAndCx first. "Path compression"
	^ fAndCx second.! !

!PersistentUnionFind methodsFor: 'accessing' stamp: 'fbs 12/31/2011 16:01'!
union: anObject with: anotherObject
	| cx cy rx ry |
	cx := self find: anObject.
	cy := self find: anotherObject.
	(cx = cy) ifTrue: [^ self].
	
	rx := ranks at: cx.
	ry := ranks at: cy.
	
	(rx > ry)
		ifTrue: [
			^ self class new
				ranks: (ranks at: cy put: ry + rx)
				parents: (parents at: cy put: cx)].
		
	(ry < rx)
		ifTrue: [
			^ self class new
				ranks: (ranks at: cx put: ry + rx)
				parents: (parents at: cx put: cy)].

	^ self class new
		ranks: (ranks at: cx put: rx + 1)
		parents: (parents at: cy put: cx).! !


!PersistentUnionFind methodsFor: 'private' stamp: 'fbs 12/29/2011 17:36'!
findAux: anObject in: anArray
	| representative pair |
	representative := anArray at: anObject.
	^ (representative = anObject)
		ifTrue: [{anArray. anObject.}]
		ifFalse: [ | f |
			pair := self findAux: representative in: anArray.
			f := anArray at: anObject put: representative.
			{f. representative.}]! !

!PersistentUnionFind methodsFor: 'private' stamp: 'fbs 12/29/2011 20:29'!
ranks: anArray parents: anotherArray
	ranks := anArray.
	parents := anotherArray.! !

!PersistentUnionFind methodsFor: 'private' stamp: 'fbs 12/31/2011 15:58'!
usingArrayType: aClass partitioning: someObjects
	arrayType := aClass.
	ranks := arrayType initially: (DictionaryWithDefault wrapping: Dictionary new default: [:unused | 1]).
	parents := arrayType initially: someObjects.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PersistentUnionFind class
	instanceVariableNames: ''!

!PersistentUnionFind class methodsFor: 'instance creation' stamp: 'fbs 12/29/2011 17:46'!
usingArrayType: aClass partitioning: someObjects
	^ self new usingArrayType: aClass partitioning: someObjects.! !
entUnionFind methodsFor: 'private' stamp: 'fbs 12/31/2011 15:58'!
usingArrayType: aClass partitioning: someObjects
	arrayType := aClass.
	ranks := arrayType initially: (DictionaryWithDefault wrapping: Dictionary new default: [:unused | 1]).
	parents := arrayType initially: someObjects.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PersistentUnionFind class
	instanceVariableNames: ''!

!PersistentUnionFind class methodsFor: 'instance creation' stamp: 'fbs 12/29/2011 17:46'!
usingArrayType: aClass partitioning: someObjects
	^ self new usingArrayType: aClass partitioning: someObjects.! !
