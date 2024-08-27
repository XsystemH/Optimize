#define bool _Bool
typedef unsigned int size_t;

int scanf(const char *format, ...);

int printf(const char *format, ...);

int sprintf(char *str, const char *format, ...);

void print(char *s) { printf("%s", s); }

void println(char *s) { printf("%s\n", s); }

void printInt(int n) { printf("%d", n); }

void printlnInt(int n) { printf("%d\n", n); }

void *malloc(size_t size);

int *_malloc_array(int size, int length) {
  int *tmp = (int *) malloc(size * length + 4);
  tmp[0] = length;
  return tmp + 1;
}

int _arr_size(void* arr) {
    return ((int*)arr)[-1];
}

void *_malloc(int size) {
  return malloc(size);
}

char *getString() {
  char *s = malloc(256);
  scanf("%s", s);
  return s;
}

int getInt() {
  int n;
  scanf("%d", &n);
  return n;
}

char *toString(int i) {
  char *s = malloc(12 * sizeof(char));
  sprintf(s, "%d", i);
  return s;
}

char *_str_add(char *str1, char *str2) {
  char *res = malloc(strlen(str1) + strlen(str2) + 1);
  strcpy(res, str1);
  strcat(res, str2);
  return res;
}

bool _str_eq(char *str1, char *str2) {
  return strcmp(str1, str2) == 0;
}

bool _str_ne(char *str1, char *str2) {
  return strtrcmp(str1, str2) != 0;
}

bool _str_lt(char* str1, char* str2) {
    return strcmp(str1, str2) < 0;
}

bool _str_le(char* str1, char* str2) {
    return strcmp(str1, str2) <= 0;
}

bool _str_gt(char* str1, char* str2) {
    return strcmp(str1, str2) > 0;
}

bool _str_ge(char* str1, char* str2) {
    return strcmp(str1, str2) >= 0;
}

int _str_length(char *str) {
    return strlen(str);
}

char *_str_substr(char *str, int l, int r) {
  int len = r - l;
  char *temp = malloc(len + 1);
  memcpy(temp, str + l, len);
  temp[len] = '\0';
  return temp;
}

int _str_parseInt(char *str) {
  int n;
  sscanf(str, "%d", &n);
  return n;
}

int _str_ord(char *str, int pos) {
  return (int)str[pos];
}