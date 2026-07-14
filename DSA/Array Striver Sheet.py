class Solution:
    def isSorted(self, nums):
        
        for i in range(len(nums)-1):
            if(nums[i+1]<nums[i]):
                return False
        return True

        # Second Larget Element
        class Solution:
    def secondLargestElement(self, arr):
        arr.sort()
        n=len(arr)-1
        if(n<1):
            return -1
        while(n-1>=0):
            if(arr[n]>arr[n-1]):
                return arr[n-1]
            else:
                n-=1
        return -1
        
        