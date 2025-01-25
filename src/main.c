#include <openssl/sha.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    SHA_CTX *ctx;
    SHA1_Init(ctx);

    const void *d;
    size_t len;
    SHA1_Update(ctx, d, len);

    unsigned char *md_buf
    SHA1_Final(md_buf, ctx);

    unsigned char *data;
    size_t count;
    SHA1(data, count, md_buf);

    return 0;
}
