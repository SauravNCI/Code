class Solution {
  public:
    vector<int> topoSort(int V, vector<vector<int>>& edges) {
        // code here
        
        vector<int> indegree(V,0);
        vector<vector<int>> adj(V);
        
        for(auto it:edges){
            
            indegree[it[1]]++;
            adj[it[0]].push_back(it[1]);
        }
        
        
        queue<int> q;
        for(int i=0;i<V;i++){
            if(indegree[i]==0) q.push(i);
        }
        vector<int> topo;
        while(!q.empty()){
            
            int f = q.front();
            topo.push_back(f);
            q.pop();
            
            for(auto it:adj[f]){
                
                    indegree[it]--;
                    
                
                if(indegree[it]==0) q.push(it);
            }
        }
        
        return topo;
    }
};

// 3 1 1 1