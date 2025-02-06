def sort_numbers(arr):
    #Filter angka 
    even_numbers = [num for num in arr if num % 2 == 0]
    odd_numbers = [num for num in arr if num % 2 != 0]
     #urutkan angka 
    even_numbers.sort(reverse=True)
    odd_numbers.sort(reverse=True)
    #gabungkan
    return even_numbers + odd_numbers
    
input_array = [3, 2, 5, 1, 8, 9, 6]
output = sort_numbers(input_array)
print(output)
