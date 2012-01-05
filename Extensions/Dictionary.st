
!Dictionary methodsFor: '*PersistentUnionFind' stamp: 'fbs 1/2/2012 13:59'!
elementsOfClass: aParentObject
	^ ((self associations
		select: [:assoc | (assoc value == aParentObject) or: [assoc key == aParentObject]]
		thenCollect: [:assoc | {assoc key. assoc value.}])
			inject: #()
			into: [:acc :each | acc , each]) asSet asArray! !

!Dictionary methodsFor: '*PersistentUnionFind' stamp: 'fbs 1/2/2012 13:57'!
elementsOfClass:: aParentObject
	^ ((self associations
		select: [:assoc | (assoc value == aParentObject) or: [assoc key == aParentObject]]
		thenCollect: [:assoc | {assoc key. assoc value.}])
			inject: #()
			into: [:acc :each | acc , each]) asSet asArray! !
