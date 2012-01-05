Object subclass: #PersistentUnionFind
	instanceVariableNames: 'ranks parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!
!PersistentUnionFind commentStamp: 'fbs 12/28/2011 11:07' prior: 0!
A union-find data structure maintains a _partition_ of objects in some structure. That is, it implicitly defines an equivalence relation between the nodes of some structure.

The structure provides two methods - _find_ returns the representative of some class of nodes, and _union_ merges two classes of nodes.

* ranks is an array of the ranks (sizes) of the various equivalence classes.
* parents is an array of the representative terms for each of the equivalence classes.!


asses.!


!PersistentUnionFind methodsFor: 'accessing' stamp: 'fbs 1/2/2012 13:56'!
elementsOfClass: aParentObject
	"Return all those objects with representative aParentObject. This returns all the elements in any particular equivalence call."
	"asSet because the representative element points to itself: it will appear twice otherwise."
	^ parents elementsOfClass: aParentObject.! !

!PersistentUnionFind methodsFor: 'accessing' stamp: 'fbs 12/29/2011 17:56'!
find: anObject
	"Return the representative element of anObject's equivalence class."
	| fAndCx |
	fAndCx := self findAux: anObject in: parents.
	parents := fAndCx first. "Path compression"
	^ fAndCx second.! !

!PersistentUnionFind methodsFor: 'accessing' stamp: 'fbs 1/3/2012 15:59'!
union: anObject with: anotherObject
	| cx cy rx ry |
	cx := self find: anObject.
	cy := self find: anotherObject.
	(cx = cy) ifTrue: [^ self].
	
	rx := ranks at: cx.
	ry := ranks at: cy.
	
	(rx > ry)
		ifTrue: [
			^ self copyWithRanks: (ranks at: cy put: ry + rx)
				parents: (self storeSchemaTermFor: cy as: cx)].
		
	^ self copyWithRanks: (ranks at: cx put: ry + rx)
		parents: (self storeSchemaTermFor: cx as: cy).! !


!PersistentUnionFind methodsFor: 'private' stamp: 'fbs 1/3/2012 15:59'!
copyWithRanks: anArray parents: anotherArray
	^ self class new ranks: anArray parents: anotherArray.! !

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

!PersistentUnionFind methodsFor: 'private' stamp: 'fbs 1/2/2012 20:13'!
storeSchemaTermFor: anObject as: anotherObject
	^ parents at: anObject put: anotherObject.! !

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
