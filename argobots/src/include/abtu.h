/* -*- Mode: C; c-basic-offset:4 ; indent-tabs-mode:nil ; -*- */
/*
 * See COPYRIGHT in top-level directory.
 */

#ifndef ABTU_H_INCLUDED
#define ABTU_H_INCLUDED

#include <stdlib.h>
#include <string.h>

/* Utility Functions */
#define ABTU_malloc(a)          malloc((size_t)(a))
#define ABTU_calloc(a,b)        calloc((size_t)(a),(size_t)b)
#define ABTU_free(a)            free((void *)(a))
#define ABTU_realloc(a,b)       realloc((void *)(a),(size_t)(b))

#define ABTU_strcpy(d,s)        strcpy(d,s)
#define ABTU_strncpy(d,s,n)     strncpy(d,s,n)

/* The caller should free the memory returned. */
char *ABTU_get_indent_str(int indent);

int ABTU_get_int_len(size_t num);

#endif /* ABTU_H_INCLUDED */
