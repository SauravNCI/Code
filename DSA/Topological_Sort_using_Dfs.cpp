class Solution {
  public:
   
    void dfs(int i, vector<bool> &visited, vector<vector<int>> &adj,vector<int> &seq){
        
        visited[i]=true;
        
        for(auto itr:adj[i]){
            if(!visited[itr]){
                dfs(itr,visited,adj,seq);
            }
        }
        
        seq.push_back(i);
    }
    vector<int> topoSort(int V, vector<vector<int>>& edges) {
        // code here
        vector<vector<int>> adj(V);
        for(auto itr:edges){
            adj[itr[0]].push_back(itr[1]);
        }
        
        vector<bool> visited(V,false);
        vector<int> seq;
        for(int i=0;i<V;i++){
            
            if(!visited[i]){
                dfs(i,visited,adj,seq);
            }
        }
        
        reverse(seq.begin(),seq.end());
        return seq;
    }
};