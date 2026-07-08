/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:

    int help(TreeNode* root, int &d){

        if(root==NULL) return 0;
        int l=0,r=0;
        if(root->left!=NULL) l=help(root->left,d);
        if(root->right!=NULL) r=help(root->right,d);

        d = max(d,l+r);

        return max(l,r) +1;
    }
    int diameterOfBinaryTree(TreeNode* root) {
        int d=0;
        int height = help(root,d);
        return d;
    }
};