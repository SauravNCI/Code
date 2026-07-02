class Solution {
public:
    
    void dfs(int i,int j, int n,int m,vector<vector<char>>& grid, vector<vector<bool>> &visited)  
    {
        visited[i][j]=true;
        
        if(i-1>=0 && !visited[i-1][j] && grid[i-1][j]=='1'){
            dfs(i-1,j,n,m,grid,visited);
        }
        
        if(i+1<n && !visited[i+1][j] && grid[i+1][j]=='1'){
            dfs(i+1,j,n,m,grid,visited);
        }
        
        if(j-1>=0 && !visited[i][j-1] && grid[i][j-1] =='1'){
            dfs(i,j-1,n,m,grid,visited);
        }
        
        if(j+1<m && !visited[i][j+1] && grid[i][j+1]=='1'){
            dfs(i,j+1,n,m,grid,visited);
        }


    return;

    }
    int numIslands(vector<vector<char>>& grid) {
        int n=grid.size();
        int m = grid[0].size();
        vector<vector<bool>> visited(n,vector<bool> (m,false));
        int count=0;
        for(int i=0;i<n;i++){
            for (int j=0;j<m;j++){

                
                if(!visited[i][j] && grid[i][j]=='1')
                {   cout<<"i : "<<i<<" j : "<<j<<endl; 
                    count++;
                    dfs(i,j,n,m,grid,visited);
                }
            }
        }

    return count;
    }
};

