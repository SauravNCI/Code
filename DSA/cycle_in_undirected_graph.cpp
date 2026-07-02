class Solution {
  public:

     
    bool dfs(int current, int parent,vector<bool> &visited, vector<vector<int>> &adj){
        
        visited[current]=true;
        
        
        
        for(auto itr:adj[current]){
            
                
                
                if(visited[itr] && itr!=parent )  // check if other edge is already visited or not and also exist in order 
                {
                    
                    return true;
                    
                }
                else if(!visited[itr] ){
                 if(dfs(itr,current,visited,adj)) return true;
                }
            
        }
        
    
        
        return false;
        
        
    }
    
    
    bool isCycle(int V, vector<vector<int>>& edges) {
        // Code here
            
    vector<bool> visited(V,false);
    vector<vector<int>> adj(V);
    for(auto itr:edges){
        adj[itr[0]].push_back(itr[1]);
        adj[itr[1]].push_back(itr[0]);
    }
    for(int i=0;i<V;i++){
        
        if(!visited[i]){
            if(dfs(i,-1 , visited,adj)) return true;
        }
    }
    return false;
        
    }
};