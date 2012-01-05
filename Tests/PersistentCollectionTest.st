TestCase subclass: #PersistentCollectionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind-Tests'!

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:17'!
testAtOnChangedArrayReturnsAssociatedValue
	| arr arr2 |
	arr := PersistentCollection initially: #(3 2 1).
	arr2 := arr at: 2 put: 99.
	self assert: 99 equals: (arr2 at: 2).! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:17'!
testAtOnNewArrayReturnsAssociatedValue
	| arr |
	arr := PersistentCollection initially: #(3 2 1).
	self assert: 2 equals: (arr at: 2).! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:18'!
testAtPutLeavesWrappedArrayUnchanged
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentCollection initially: array.
	persistentArray := persistentArray at: 1 put: 4.

	self assert: #(3 2 1) equals: array.! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:18'!
testAtPutOfSameValueApparentlyDoesNothing
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentCollection initially: array.
	persistentArray := persistentArray at: 1 put: 4.
	persistentArray := persistentArray at: 1 put: 4.

	self assert: #(4 2 1) equals: persistentArray asArray.! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:18'!
testAtPutReturnsaPersistentArray
	| array persistentArray persistentArray2 |
	array := #(3 2 1).
	persistentArray := PersistentCollection initially: array.
	persistentArray2 := persistentArray at: 1 put: 4.
	self assert: #(4 2 1) equals: persistentArray2 asArray.! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:18'!
testAtPutWorksOnImmediateReferences
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentCollection initially: array.
	persistentArray := persistentArray at: 1 put: 4.
	self assert: 4 equals: (persistentArray at: 1).! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 1/1/2012 00:12'!
testAtWorksOnImmediateReferences
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentCollection initially: array.
	self assert: 3 equals: (persistentArray at: 1).
	self assert: 2 equals: (persistentArray at: 2).
	self assert: 1 equals: (persistentArray at: 3).! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:19'!
testPersistentArraysPersist
	| arr arr2 arr3 arr4 |
	arr := PersistentCollection initially: #(1 2 3).
	arr2 := arr at: 1 put: 4.
	arr3 := arr2 at: 2 put: 5.
	arr4 := arr2 at: 3 put: 6.
	
	"A linear chain of changes."
	self assert: #(1 2 3) equals: arr asArray.
	self assert: #(4 2 3) equals: arr2 asArray.
	self assert: #(4 2 6) equals: arr4 asArray.
	
	"The alternative branch of changes."
	self assert: #(4 5 3) equals: arr3 asArray.! !


!PersistentCollectionTest methodsFor: 'testing - maps' stamp: 'fbs 12/30/2011 08:19'!
testAtOnUnknownValueWorksLikeIdentity
	| map |
	map := PersistentCollection initially: Dictionary new.
	self assert: 1 equals: (map at: 1).! !

!PersistentCollectionTest methodsFor: 'testing - maps' stamp: 'fbs 12/30/2011 08:18'!
testAtPutWorksLikeaMap
	| map |
	map := PersistentCollection initially: Dictionary new.
	map := map at: 1 put: 4.
	self assert: 4 equals: (map at: 1).! !


!PersistentCollectionTest methodsFor: 'testing - printing' stamp: 'fbs 12/30/2011 08:19'!
testPrintOnPrintsSensiblyForNew
	| a |
	a := PersistentCollection initially: #(1 2 3).
	self assert: 'Ref(Arr(#(1 2 3)))' equals: a printString.! !

!PersistentCollectionTest methodsFor: 'testing - printing' stamp: 'fbs 12/30/2011 08:19'!
testPrintOnPrintsSensiblyForUpdatedArrays
	| d |
	d := Diff index: 1 value: 4 in: (PersistentCollection initially: #(1 2 3)).
	self assert: 'Diff(1, 4, Ref(Arr(#(1 2 3))))' equals: d printString.! !


!PersistentCollectionTest methodsFor: 'testing - updating' stamp: 'fbs 12/30/2011 08:19'!
testRerootLeavesArraySeeminglyUnchanged
	| arr arr2 arr3 |
	arr := PersistentCollection initially: #(1 2 3).
	arr2 := arr at: 3 put: 4.
	arr3 := arr2 reroot.
	
	self assert: #(1 2 4) equals: arr3 asArray! !


!PersistentCollectionTest methodsFor: 'testing - testing' stamp: 'fbs 12/31/2011 15:26'!
testIncludesWorksLikeAnyOtherCollection
	| arr |
	arr := PersistentCollection initially: #(1 2 3).
	self deny: (arr includes: 4).
	self assert: ((arr at: 1 put: 4) includes: 4).! !


!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/1/2012 13:57'!
testSelectOnEmptyCollectionDoesNothing
	| arr |
	arr := PersistentCollection initially: #().
	self assert: #() equals: (arr select: [:o | true]).
	self assert: #() equals: (arr select: [:o | false]).! !
