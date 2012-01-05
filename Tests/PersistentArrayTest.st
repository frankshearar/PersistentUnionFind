TestCase subclass: #PersistentArrayTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind-Tests'!

!PersistentArrayTest methodsFor: 'testing - accessing' stamp: 'fbs 12/29/2011 11:39'!
testAtPutLeavesWrappedArrayUnchanged
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentArray initially: array.
	persistentArray := persistentArray at: 1 put: 4.

	self assert: #(3 2 1) equals: array.! !

!PersistentArrayTest methodsFor: 'testing - accessing' stamp: 'fbs 12/29/2011 14:49'!
testAtPutOfSameValueApparentlyDoesNothing
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentArray initially: array.
	persistentArray := persistentArray at: 1 put: 4.
	persistentArray := persistentArray at: 1 put: 4.

	self assert: #(4 2 1) equals: persistentArray asArray.! !

!PersistentArrayTest methodsFor: 'testing - accessing' stamp: 'fbs 12/29/2011 11:39'!
testAtPutReturnsaPersistentArray
	| array persistentArray persistentArray2 |
	array := #(3 2 1).
	persistentArray := PersistentArray initially: array.
	persistentArray2 := persistentArray at: 1 put: 4.
	self assert: #(4 2 1) equals: persistentArray2 asArray.! !

!PersistentArrayTest methodsFor: 'testing - accessing' stamp: 'fbs 12/29/2011 11:39'!
testAtPutWorksOnImmediateReferences
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentArray initially: array.
	persistentArray := persistentArray at: 1 put: 4.
	self assert: 4 equals: (persistentArray at: 1).! !

!PersistentArrayTest methodsFor: 'testing - accessing' stamp: 'fbs 12/29/2011 11:40'!
testAtWorksOnImmediateReferences
	| array persistentArray |
	array := #(3 2 1).
	persistentArray := PersistentArray initially: array.
	self assert: 3 equals: (persistentArray at: 1).
	self assert: 2 equals: (persistentArray at: 2).
	self assert: 1 equals: (persistentArray at: 3).! !

!PersistentArrayTest methodsFor: 'testing - accessing' stamp: 'fbs 12/29/2011 13:48'!
testPersistentArraysPersist
	| arr arr2 arr3 arr4 |
	arr := PersistentArray initially: #(1 2 3).
	arr2 := arr at: 1 put: 4.
	arr3 := arr2 at: 2 put: 5.
	arr4 := arr2 at: 3 put: 6.
	
	"A linear chain of changes."
	self assert: #(1 2 3) equals: arr asArray.
	self assert: #(4 2 3) equals: arr2 asArray.
	self assert: #(4 2 6) equals: arr4 asArray.
	
	"The alternative branch of changes."
	self assert: #(4 5 3) equals: arr3 asArray.! !


!PersistentArrayTest methodsFor: 'testing - printing' stamp: 'fbs 12/29/2011 13:58'!
testPrintOnPrintsSensiblyForNew
	| a |
	a := PersistentArray initially: #(1 2 3).
	self assert: 'Ref(Arr(#(1 2 3)))' equals: a printString.! !

!PersistentArrayTest methodsFor: 'testing - printing' stamp: 'fbs 12/29/2011 13:56'!
testPrintOnPrintsSensiblyForUpdatedArrays
	| d |
	d := Diff index: 1 value: 4 in: (PersistentArray initially: #(1 2 3)).
	self assert: 'Diff(1, 4, Ref(Arr(#(1 2 3))))' equals: d printString.! !


!PersistentArrayTest methodsFor: 'testing - updating' stamp: 'fbs 12/29/2011 13:48'!
testRerootLeavesArraySeeminglyUnchanged
	| arr arr2 arr3 |
	arr := PersistentArray initially: #(1 2 3).
	arr2 := arr at: 3 put: 4.
	arr3 := arr2 reroot.
	
	self assert: #(1 2 4) equals: arr3 asArray! !
