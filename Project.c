

#include<stdio.h>

int main () {
    int array[100], search, c, n;

    printf("Enter the number of elements in array\n");
    scanf("%d", &n);

    printf("Enter %d integer(s)\n", n);

    for (c = 0; c < n; c++)
        scanf("%d", &array[c]);
    
    printf("Enter a number to search\n");
    scanf("%d", &search);

    for (c = 0; c < n; c++)
      {
        if (array[c] == search)    /* If required element is found */
           {
             printf("%d is present at location %d.\n", search, c+1);
             break;
           }
        }
    if (c == n)
        printf("%d isn't present in the array.\n", search);
    
    double number, sum = 0;

    // loop body is executed at least once
    do
    {
        printf("Enter a number: ");
        scanf("%lf", &number);
        sum += number;
    }
    while(number != 0.0);

    printf("Sum = %.2lf",sum);
    
    int number;
    long long factorial;

    printf("Enter an integer: ");
    scanf("%d",&number);

    factorial = 1;

    // loop terminates when number is less than or equal to 0
    while (number > 0)
    {
        factorial *= number;  // factorial = factorial number;
        --number;
    }

    printf("Factorial= %lld", factorial);
    int num, count, sum = 0;

    printf("Enter a positive integer: ");
    scanf("%d", &num);
    // for loop terminates when n is less than count
    for(count = 1; count <= num; ++count)
    {
        sum += count;
    }

    printf("Sum = %d", sum);
    return 0;
}