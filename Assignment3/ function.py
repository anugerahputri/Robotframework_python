def sort_numbers(arr):

    even_numbers = [num for num in arr if num % 2 == 0]
    odd_numbers = [num for num in arr if num % 2 != 0]

    even_numbers.sort(reverse=True)
    odd_numbers.sort(reverse=True)

    return even_numbers + odd_numbers

input= [3, 2, 5, 1, 8, 9, 6]
output = sort_numbers(input)
print(output)
