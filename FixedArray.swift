//
//  JTFixedArray.swift
//  
//  A fixed length array type in Swift.
//
//  Created by Ben on 26/05/2016.

struct JTFixedArray<T: Comparable> {
	private(set) var length: Int = 0
	private let defaultValue: T!
	private var array: [T]
	private(set) var count: Int
	
	init(length: Int, defaultValue: T) {
		self.count = 0
		self.length = length
		self.defaultValue = defaultValue
		self.array = [T](count: length, repeatedValue: defaultValue)
	}
	
	subscript(index: Int) -> T {
		get {
			assert(index < length)
			assert(index >= 0)
			return array[index]
		}
		
		set(newValue) {
			assert(index >= 0)
			assert(count < length)
			count += 1
			array[index] = newValue
		}
	}
	
	mutating func append(newElement: T) {
		assert(count < length)
		count += 1
		array[count] = newElement
	}
	
	mutating func exchange(objectAtIndex index: Int, withIndex: Int) {
		assert(index >= 0)
		assert(index < count)
		assert(array[index] != defaultValue)
		let sourceElement = array[index]
		let destinationElement = array[withIndex]
		
		array[index] = destinationElement
		array[withIndex] = sourceElement
	}
	
	mutating func remove(atIndex index: Int) {
		assert(index >= 0)
		assert(index < count)
		count -= 1
		array[index] = defaultValue
	}
	
	mutating func dropLast() {
		assert(count >= 0)
		count -= 1
		array[count] = defaultValue
	}
}