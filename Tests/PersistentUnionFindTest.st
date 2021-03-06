TestCase subclass: #PersistentUnionFindTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind-Tests'!


!PersistentUnionFindTest methodsFor: 'testing - accessing' stamp: 'fbs 1/2/2012 13:59'!
testElementsOfClassUsingDictionary
	| partition p2 p3 |
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: (DictionaryWithIdentity wrapping: Dictionary new).
	p2 := partition union: #foo with: #bar.
	p3 := p2 union: #foo with: #baz.
	self assert: #(foo bar) equals: (p2 elementsOfClass: #foo).
	self assert: #(foo bar) equals: (p2 elementsOfClass: #bar).! !

!PersistentUnionFindTest methodsFor: 'testing - accessing' stamp: 'fbs 1/2/2012 13:59'!
testElementsOfClassWithEmptyPartition
	| partition |
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: #().
	self assert: #() equals: (partition elementsOfClass: 1).! !

!PersistentUnionFindTest methodsFor: 'testing - accessing' stamp: 'fbs 1/2/2012 14:00'!
testElementsOfClassWithNonEmptyPartition
	| partition p2 |
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: #(1 2 3 4).
	p2 := partition union: 1 with: 2.
	self assert: #(1 2) equals: (p2 elementsOfClass: 1).
	self assert: #(3) equals: (p2 elementsOfClass: 3).! !


!PersistentUnionFindTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/11/2012 09:22'!
testInjectIntoAcceptsSymbols
	| partition |
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: (DictionaryWithIdentity wrapping: (Dictionary newFromPairs: #(1 1 2 2))).
	
	self assert: 3 equals: (partition inject: 0 into: #+).! !

!PersistentUnionFindTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/11/2012 09:21'!
testInjectIntoFoldsOverRepresentativesOfEquivalenceClasses
	| partition |
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: (DictionaryWithIdentity wrapping: (Dictionary newFromPairs: #(1 1 2 2))).
	
	self assert: 3 equals: (partition inject: 0 into: [:sum :representative | sum + representative]).! !


!PersistentUnionFindTest methodsFor: 'testing - instance creation' stamp: 'fbs 12/30/2011 08:19'!
testInitialStateHasNoUnification
	| partition data |
	data := #(1 2 3 4).
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: data.
	self assert: data first equals: (partition find: data first).
	self assert: data second equals: (partition find: data second).
	self assert: data third equals: (partition find: data third).
	self assert: data fourth equals: (partition find: data fourth).! !


!PersistentUnionFindTest methodsFor: 'testing - map unions' stamp: 'fbs 12/31/2011 15:59'!
testUnionOfUnknownKeysMergesClasses
	| partition p2 |
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: (DictionaryWithIdentity wrapping: Dictionary new).
	p2 := partition union: 1 with: 3.

	self deny: (partition find: 1) = (partition find: 3).
	self assert: (p2 find: 1) equals: (p2 find: 3).
	self assert: 4 equals: (p2 find: 4).! !


!PersistentUnionFindTest methodsFor: 'testing - union' stamp: 'fbs 12/30/2011 08:19'!
testUnionLeavesOtherEquivalenceClassesUnchanged
	| partition p2 data |
	data := #(1 2 3 4).
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: data.
	p2 := partition union: 1 with: 3.

	self assert: 3 equals: (partition find: 3).
	self assert: 4 equals: (partition find: 4).! !

!PersistentUnionFindTest methodsFor: 'testing - union' stamp: 'fbs 12/30/2011 08:19'!
testUnionMergesTwoEquivalenceClasses
	| partition p2 data |
	data := #(1 2 3 4).
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: data.

	p2 := partition union: 1 with: 3.
	self assert: (p2 find: 1) equals: (p2 find: 3).! !

!PersistentUnionFindTest methodsFor: 'testing - union' stamp: 'fbs 12/30/2011 08:19'!
testUnionsDontAffectPreviousVersions
	| partition p2 p3 p4 data |
	data := #(1 2 3 4).
	partition := PersistentUnionFind usingArrayType: PersistentCollection partitioning: data.
	p2 := partition union: 1 with: 3.
	p3 := partition union: 2 with: 4.
	p4 := partition union: 1 with: 2.
	self assert: (p2 find: 1) equals: (p2 find: 3).
	self deny: (p2 find: 1) = (p2 find: 2).! !
