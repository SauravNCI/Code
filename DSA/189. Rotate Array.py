class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n=len(nums)
        k=k%n
        l=[]
        
        for i in range(n-k):
            l.append(nums[i])
        temp=0
        for i in range(n-k,n):
            nums[temp]=nums[i]
            temp+=1
        temp=k
        for i in range(len(l)):
            nums[temp]=l[i]
            temp+=1
        
         