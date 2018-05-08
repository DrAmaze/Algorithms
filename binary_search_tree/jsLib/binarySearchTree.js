import Node from './bstNode';

class BST
{
  constructor() {
    this.root = null;
  }

  insert(data) {
    let newNode = new Node(data);
    if (this.root === null) {
      this.root = newNode;
    } else {
      this.insertNode(this.root, newNode);
    }
  }

  // helper method to #insert
  insertNode(root, node) {
    if (node.val < root.val) {
      root.left ? this.insertNode(root.left, node) : root.left = node;
    } else {
      root.right ? this.insertNode(root.right, node) : root.right = node;
    }
  }

  find(data, node = this.root) {
    if (data === node.val) {
      return node;
    } else if (data < node.val) {
      return node.left ? this.find(data, node.left) : null;
    } else {
      return node.right ? this.find(data, node.right) : null;
    }
  }

  delete(data, node = this.root) {
    let target = this.find(data);
    if (target) {
      this.remove(target);
    } else {
      return null;
    }
  }

  remove(node) {
    let parent = this.parent(node.val);
    if (!node.left && !node.right) {

      if (parent) {
        parent.left === node ? parent.left = null : parent.right = null;
      } else {
        this.root = null;
      }

    } else if (node.left && !node.right) {

      if (parent) {
        parent.left === node ? parent.left = node.left : parent.right = node.left;
      } else {
        this.root = node.left;
      }

    } else if (!node.left && node.right) {

      if (parent) {
        parent.left === node ? parent.left = node.left : parent.right = node.left;
      } else {
        this.root = node.right;
      }

    } else {
      let nextMax = this.maxLess(node);
      let nextMaxParent = this.parent(nextMax.val, node);
      nextMaxParent.right = null;

      if (parent) {
        parent.left === node ? parent.left = nextMax : parent.right = nextMax;
      } else {
        this.root = nextMax;
      }

      nextMax.left = node.left;
      nextMax.right = node.right;
    }
    return node;
  }

  parent(data, node = this.root) {
    let target = this.find(data);
    if (!target || data === node.val) {
      return null;
    } else {
      if (data === node.left.val || data === node.right.val) {
        return node;
      } else {
        return data < node.val ? this.parent(data, node.left) : this.parent(data, node.right);
      }
    }
  }

  maximum(root = this.root) {
    if (root.right === null) {
      return null;
    } else {
      return this.maximum(root.right);
    }
  }

  maxLess(node = this.root) {
    let currentNode = node.left;
    if (!currentNode) {
      return null;
    } else {
      while (currentNode.right) {
        currentNode = currentNode.right;
      }
      return currentNode;
    }
  }
}

export default BST;
