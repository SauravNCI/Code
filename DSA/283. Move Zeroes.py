class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        
        j=-1
        for k in range(len(nums)):
            if(nums[k]==0):
                j=k
                break
        if(j!=-1):
            for k in range(j+1,len(nums)):
                if(nums[k]!=0):
                    nums[j],nums[k]=nums[k],nums[j]
                    j+=1

        
        