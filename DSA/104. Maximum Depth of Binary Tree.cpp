class Solution {
public:
    int maxDepth(TreeNode* root) {
        if(root==NULL) return 0;
        int l=0,r=0;
        if(root->left!=NULL){ l = maxDepth(root->left);}
        if(root->right!=NULL){ r = maxDepth(root->right);}
    return max(l,r)+1;
    }
};