class Solution {
  public:
    
    bool dfs(int current, vector<bool> &visited, vector<vector<int>> &edges, vector<int> &order){
        
        visited[current]=true;
        
        order.push_back(current);
        
        for(auto itr:edges){
            if(itr[0]==current){
                auto t = find(order.begin(),order.end(),itr[1]);
                
                if(visited[itr[1]] && t!=order.end() )  // check if other edge is already visited or not and also exist in order 
                {
                    
                    return true;
                    
                }
                else if(!visited[itr[1]] ){
                 if(dfs(itr[1],visited,edges,order)) return true;
                }
            }
        }
        
        order.pop_back();
        
        return false;
        
        
    }
    
    bool isCyclic(int V, vector<vector<int>> &edges) {
        // code here
        vector<bool> visited(V,false);
        vector<int> order;
        
        for(auto itr:edges){
            
            if(!visited[itr[0]]){
                bool check = dfs(itr[0],visited,edges,order);
                if(check) return true;
            }    
        }
        
        return false;
    }
};