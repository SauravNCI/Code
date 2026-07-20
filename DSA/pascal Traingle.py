class Solution:
    def fact(self,n):
        if(n==0 or n==1):
            return 1
        return n*self.fact(n-1)
        
    def pascalTriangleI(self, r, c):
        r-=1
        c-=1
        return int(self.fact(r)/(self.fact(r-c)*self.fact(c)))
        