list1 = ['apple', 1, 'banana', 2, 'grapes', 3, 'pineapple', 4]

dict_m = {i for i in list1 }

print("dict_m==>", dict_m)


list1 = [1, 3, 4, 5, 6]

sum = 3

nums = [45, 18, 9, 13, 12]
k = 31
import itertools

def solve():
    import itertools
    list1 = [2, 8, 4, 7, 9, 5, 1]
    target = 10
    for numbers in itertools.combinations(list1, 2):
        if sum(numbers) == target:
            print([list1.index(number) for number in numbers])

print(solve())

