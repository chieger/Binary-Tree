//: Playground - noun: a place where people can play

import UIKit

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
