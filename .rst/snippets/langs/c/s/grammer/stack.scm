// WARN: スタックに巨大な配列をセットしない

int main()
{
  int n[1000000000];  // 配列が大きすぎる
  printf("Hello!\n"); // &"Hello!\n" のプッシュがスタックオーバーフローとなる
}

// この場合は、以下のように配列を静的領域に移動するか、
int n[1000000000];
int main()
{
  printf("Hello!\n");
}

// malloc などを使ってヒープ領域に確保すればスタックオーバーフローは回避できる。
int main()
{
  int *n = malloc(sizeof(int) * 1000000000);
  printf("Hello!\n");
  free(n);
}
