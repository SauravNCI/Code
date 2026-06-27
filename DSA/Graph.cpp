#include <bits/stdc++.h>
using namespace std;
class Graph{
int N;
vector<vector<int>> adj;
bool direction;


Graph(int n, bool d)
{
    N=n;
    direction = d;
    adj.resize(N);
}
void addEdges(int a,int b )
{
    
    adj[a].push_back(b);
    if(!direction){
        adj[b].push_back(a);
    }

}
void bfs(int n, vector<vector<int>> adj){
    int n=adj.size();
    queue<int> q;
    visited<int> v(n,false);
    q.push(n);
    
    while(!q.empty()){
        int a = q.front();
        q.pop();
        
        if(!visited[a]){
        for(auto itr:adj[a]){
            visited[itr]=true;
            q.push(itr);

        }}

    }


}
void dfs_helper(int a, vector<vector<int>> adj,vector<bool> &visited)
{

    visited[a]=true;
    cout<<"print or push";
    for(auto itr:adj[a]){
        if(!visited[itr]){
            dfs_helper(itr,adj,visited)
        }
    }

}



};
int main() 
{

}
