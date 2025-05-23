package com.example.ReservationsManagement;

public class MergeSortReservations {
    // Merge two sorted subarrays
    private static void merge(Reservation[] arr, int left, int mid, int right) {
        int n1 = mid - left + 1;
        int n2 = right - mid;

        // Create temporary arrays
        Reservation[] leftArray = new Reservation[n1];
        Reservation[] rightArray = new Reservation[n2];

        // Copy data to temporary arrays
        for (int i = 0; i < n1; i++) {
            leftArray[i] = arr[left + i];
        }
        for (int j = 0; j < n2; j++) {
            rightArray[j] = arr[mid + 1 + j];
        }

        // Merge the temporary arrays back
        int i = 0, j = 0, k = left;
        while (i < n1 && j < n2) {
            if (leftArray[i].getReservationDateTime().compareTo(rightArray[j].getReservationDateTime()) <= 0) {
                arr[k] = leftArray[i];
                i++;
            } else {
                arr[k] = rightArray[j];
                j++;
            }
            k++;
        }

        // Copy remaining elements of leftArray, if any
        while (i < n1) {
            arr[k] = leftArray[i];
            i++;
            k++;
        }

        // Copy remaining elements of rightArray, if any
        while (j < n2) {
            arr[k] = rightArray[j];
            j++;
            k++;
        }
    }

    // Main merge sort function
    public static void mergeSort(Reservation[] arr, int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2;
            mergeSort(arr, left, mid);
            mergeSort(arr, mid + 1, right);
            merge(arr, left, mid, right);
        }
    }

    // Helper method to sort a Reservation array
    public static Reservation[] sortReservations(Reservation[] reservations) {
        mergeSort(reservations, 0, reservations.length - 1);
        return reservations;
    }
}
