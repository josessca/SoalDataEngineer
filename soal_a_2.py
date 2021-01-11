# -*- coding: utf-8 -*-
"""Soal A.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1XtSj0cdVpttcqCBdNo7BbM572BsjlJ3u

# **Jawaban Nomor 2**
"""

# INPUT 
# jumlah kaos kaki
n = int(input())

# declare array untuk  warna kaos kaki
ar = []

# memasukan nilai ar
ar = list(map(int,input().strip().split()))[:n]

# FUNGSI MENGHITUNG JUMLAH PASANG KAOS KAKI
def hitungpair(ar, n):
 
    # counter
    count = 0
 
    # mengurutkan array awal
    ar.sort()
    i = 0
    while i < (n-1):
 
        # Menemukan pasangan
        if (ar[i] == ar[i + 1]):
            count += 1
 
            # Skip elemen pasangan saat ini
            i = i + 2
 
        # elemen saat ini yg tidak berpasangan
        else:
            i += 1
 
    return count

# OUTPUT
if __name__ == "__main__":
    print(hitungpair(ar, n))
