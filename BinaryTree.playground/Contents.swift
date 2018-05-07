//: Playground - noun: a place where people can play

import UIKit

/*
 #if swift(>=4.0)
 print("Hello, Swift 4!")
 #endif
 */

class TreeNode {
   var val: Int
   var left: TreeNode?
   var right: TreeNode?
   init(val: Int, left: TreeNode?, right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
   }
}

/*
 Binary Tree Example (Well Balanced)

 1 <-Root
 / \
 2   3 <-Children
 / \
 4   5 <-Leaves
 */

let threeTreeNode = TreeNode(val: 3, left: nil, right: nil)
let fourTreeNode = TreeNode(val: 4, left: nil, right: nil)
let fiveTreeNode = TreeNode(val: 5, left: nil, right: nil)
let twoTreeNode = TreeNode(val: 2, left: fourTreeNode, right: fiveTreeNode)
let oneTreeNode = TreeNode(val: 1, left: twoTreeNode, right: threeTreeNode)


// #1: Print nodes "inorder"
// Expected output: 4 -> 2 -> 5 -> 1 -> 3

func printInOrder(_ rootNode: TreeNode?)  {
   if rootNode == nil {
      return
   } else {
      printInOrder(rootNode?.left)
      Swift.print(rootNode!.val)
      printInOrder(rootNode?.right)
   }
}

printInOrder(oneTreeNode)

// Traverse inorder and add node values to array
func  recursiveHelper(_ rootNode: TreeNode?, resultArray: inout [Int])  {
   if rootNode == nil {
      return
   } else {
      recursiveHelper(rootNode?.left, resultArray: &resultArray)
      resultArray.append(rootNode!.val)
      recursiveHelper(rootNode?.right, resultArray: &resultArray)
   }
}

// Traverse inoreder and return node values in array
func traverseInOrder(_ rootNode: TreeNode?) -> [Int]   {
   var resultArray:[Int] = []
   recursiveHelper(rootNode, resultArray: &resultArray)
   return resultArray
}

// traverseInOrder(oneTreeNode)



/*
 INVERSE a tree...
 ORIGINAL

 1 <-Root
 / \
 2   3 <-Children
 / \
 4   5 <-Leaves

 INVERSE
 1
 / \
 3   2
 / \
 5   4
 Expected result from inOrder...
 [3,1,5,2,4]
 */

// Traverse inorder and add node values to array
func  inverse(ofRootNode node: TreeNode?) -> TreeNode? {
   if node == nil {
      return nil
   } else {
      let left = inverse(ofRootNode: node?.left)
      let right = inverse(ofRootNode: node?.right)
      node?.left = right
      node?.right = left
      return node!
   }
}
// Test inverse
traverseInOrder(oneTreeNode)
inverse(ofRootNode: oneTreeNode)
// Expected result from inversed inOrder [3,1,5,2,4]
traverseInOrder(oneTreeNode)



