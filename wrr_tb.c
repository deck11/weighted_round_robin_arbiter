#include <stdio.h>
#include <stdbool.h>

void weighted_rr(int req[4], int weight[4], int grant[4], int reset);

int main() {
    // Define input parameters
    int req[4];
    int weight[4];
    int grant[4];
    int reset;

    // reset
    printf("Test Case 0: Reset Operation\n");
    reset = 1;
    weighted_rr(req, weight, grant, reset);
    for (int i = 0; i < 4; i++) {
        printf("Grant[%d]: %d\n", i, grant[i]);
    }

    req[0] = 1; req[1] = 1; req[2] = 0; req[3] = 0;
    weight[0] = 3; weight[1] = 2; weight[2] = 1; weight[3] = 4;

    printf("Test Case 1: Normal Operation\n");
    printf("Request: ");
    for (int j = 0; j < 4; j++) {
        printf("%d ", req[j]);
    }
    printf("\n");
    printf("Weight: ");
    for (int j = 0; j < 4; j++) {
        printf("%d ", weight[j]);
    }
    printf("\n");
    reset = 0;
    for (int i = 0; i < 10; i++) {  // Run several iterations
        weighted_rr(req, weight, grant, reset);
        printf("Iteration %d Grants: ", i + 1);
        for (int j = 0; j < 4; j++) {
            printf("%d ", grant[j]);
        }
        printf("\n");
    }


    return 0;
}
