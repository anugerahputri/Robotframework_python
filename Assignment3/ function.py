def sort_numbers(arr):
    # Separate even and odd numbers
    even_numbers = [num for num in arr if num % 2 == 0]
    odd_numbers = [num for num in arr if num % 2 != 0]

    # Sort both lists in descending order
    even_numbers.sort(reverse=True)
    odd_numbers.sort(reverse=True)

    # Combine even and odd numbers (even first, then odd)
    return even_numbers + odd_numbers

# Example usage
input_array = [3, 2, 5, 1, 8, 9, 6]
output = sort_numbers(input_array)
print(output)
