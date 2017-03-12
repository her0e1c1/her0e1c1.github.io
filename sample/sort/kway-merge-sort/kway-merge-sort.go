
// TODO:
// k個のソート済み配列を用意
// それぞれの先頭を要素にしたヒープを作成する(要素kのヒープk-heap)
// rootから順に小さい値を取得できるが
// k-heapを更新する必要がある. (Aij, value)を要素として、valueによるソート
// 全部使いきったら、最後の要素と先頭をswapして、(k-1) heapにする

int *mergeKArrays(int arr[][n], int k)
{
    int *output = new int[n*k];  // To store output array
    MinHeapNode *harr = new MinHeapNode[k];
    for (int i = 0; i < k; i++)
    {
        harr[i].element = arr[i][0]; // Store the first element
        harr[i].i = i;  // index of array
        harr[i].j = 1;  // Index of next element to be stored from array
    }
    MinHeap hp(harr, k); // Create the heap
    for (int count = 0; count < n*k; count++)
    {
        // Get the minimum element and store it in output
        MinHeapNode root = hp.getMin();
        output[count] = root.element;
        if (root.j < n)
        {
            root.element = arr[root.i][root.j];
            root.j += 1;
        }
        else root.element =  INT_MAX; //INT_MAX is for infinite
        hp.replaceMin(root);
    }
    return output;
}
