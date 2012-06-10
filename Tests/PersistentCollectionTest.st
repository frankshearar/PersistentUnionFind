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

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 1/15/2012 11:46'!
testKeysReturnsDomain! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 1/15/2012 11:47'!
testKeysReturnsDomainForEmptyCollection
	self assert: #() equals: (PersistentCollection initially: #()) keys.! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 1/15/2012 11:47'!
testKeysReturnsDomainForNonEmptyArray
	self assert: #(1 2 3) equals: (PersistentCollection initially: #(4 5 6)) keys.! !

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 1/15/2012 11:50'!
testKeysReturnsDomainForNonEmptyDictionary
	self assert: #(1 3 5) sort equals: (PersistentCollection initially: (DictionaryWithIdentity wrapping: (Dictionary newFromPairs: #(1 2 3 4 5 6)))) keys sort.! !

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

!PersistentCollectionTest methodsFor: 'testing - accessing' stamp: 'fbs 6/10/2012 23:07'!
testWithValueExposesLatestVersionOfCollection
	"#withValue: is a back door, permitting direct access to the inner workings of the PersistentCollection. That means it exposes the Arr that is the root of the change tree representing the versions of the collection."
	| array referencedThing |
	referencedThing := #(1 2 3).
	array := PersistentCollection initially: referencedThing.
	self assert: referencedThing = (array withValue: [:x | x]) array.! !


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


!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 19:20'!
testDoIteratesOverCollection
	| arr copy i |
	copy := PersistentCollection initially: #(0 0 0 0).
	arr := PersistentCollection initially: #(1 2 3 4).
	i := 1.
	arr do: [: each | copy := copy at: i put: each. i := i + 1].
	
	self assert: #(1 2 3 4) equals: copy asArray.! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 19:21'!
testInjectIntoFoldsCollection
	| arr |
	arr := PersistentCollection initially: #(1 2 3 4).
	self assert: 10 equals: (arr inject: 0 into: [:sum :each | sum + each]).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 19:20'!
testInjectIntoOnEmptyCollectionReturnsInitialValue
	| arr |
	arr := PersistentCollection initially: #().
	self assert: 0 equals: (arr inject: 0 into: [:sum :each | sum + each]).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/16/2012 15:51'!
testRejectAcceptsMessageNameAsArgument
	| arr |
	arr := PersistentCollection initially: #(1 2 3 4).
	self assert: #(2 4) equals: (arr reject: #odd).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/16/2012 15:51'!
testRejectOnEmptyCollectionDoesNothing
	| arr |
	arr := PersistentCollection initially: #().
	self assert: #() equals: (arr reject: [:o | true]).
	self assert: #() equals: (arr reject: [:o | false]).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/16/2012 15:51'!
testRejectReturnsElementsNotMatchingPredicate
	| arr |
	arr := PersistentCollection initially: #(1 2 3 4).
	self assert: #(1 3) equals: (arr reject: [:o | o even]).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 19:13'!
testSelectAcceptsMessageNameAsArgument
	| arr |
	arr := PersistentCollection initially: #(1 2 3 4).
	self assert: #(1 3) equals: (arr select: #odd).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/1/2012 13:57'!
testSelectOnEmptyCollectionDoesNothing
	| arr |
	arr := PersistentCollection initially: #().
	self assert: #() equals: (arr select: [:o | true]).
	self assert: #() equals: (arr select: [:o | false]).! !

!PersistentCollectionTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 19:12'!
testSelectReturnsElementsMatchingPredicate
	| arr |
	arr := PersistentCollection initially: #(1 2 3 4).
	self assert: #(2 4) equals: (arr select: [:o | o even]).! !
