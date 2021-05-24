/* https://adventofcode.com/2019/day/2 (part 1) */

fn main() {
    let mut list = vec![
        1, 12, 2, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 1, 9, 19, 1, 10, 19,
        23, 2, 9, 23, 27, 1, 6, 27, 31, 2, 31, 9, 35, 1, 5, 35, 39, 1, 10, 39,
        43, 1, 10, 43, 47, 2, 13, 47, 51, 1, 10, 51, 55, 2, 55, 10, 59, 1, 9,
        59, 63, 2, 6, 63, 67, 1, 5, 67, 71, 1, 71, 5, 75, 1, 5, 75, 79, 2, 79,
        13, 83, 1, 83, 5, 87, 2, 6, 87, 91, 1, 5, 91, 95, 1, 95, 9, 99, 1, 99,
        6, 103, 1, 103, 13, 107, 1, 107, 5, 111, 2, 111, 13, 115, 1, 115, 6,
        119, 1, 6, 119, 123, 2, 123, 13, 127, 1, 10, 127, 131, 1, 131, 2, 135,
        1, 135, 5, 0, 99, 2, 14, 0, 0
    ];

    for i in (0..list.len()).step_by(4) {
        if list[i] == 1 {
            // addition
            let r = list[i+3];
            list[r] = list[list[i+1]] + list[list[i+2]];
        } else if list[i] == 2 {
            // multiplication
            let r = list[i+3];
            list[r] = list[list[i+1]] * list[list[i+2]];
        } else if list[i] == 99 {
            break;
        }
    }
    println!("{}", list[0]);
}
/*
# Equivalent Python program

arr = [1, 12, 2, 3, ...
       ... 
       1, 135, 5, 0, 99, 2, 14, 0, 0]

for i in range(0, len(arr), 4):
    if arr[i] == 1:
        arr[arr[i+3]] = arr[arr[i+1]] + arr[arr[i+2]]
    elif arr[i] == 2:
        arr[arr[i+3]] = arr[arr[i+1]] * arr[arr[i+2]]
    elif arr[i] == 99:
        break

print(arr[0])
*/
