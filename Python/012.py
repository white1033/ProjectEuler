#!/usr/bin/env python
# encoding: utf-8
from euler import primes


def main():
    prime_numbers = primes(1000)
    num, num_of_div, num_of_div_sofar = 3, 2, 0

    while num_of_div_sofar <= 500:
        num += 1
        next_num = num

        if next_num % 2 == 0:
            next_num /= 2

        tmp_num_of_div = 1
        for prime in prime_numbers:
            if prime * prime > next_num:
                tmp_num_of_div *= 2
                break

            expon = 1
            while next_num % prime == 0:
                expon += 1
                next_num /= prime

            if expon > 1:
                tmp_num_of_div *= expon

            if next_num == 1:
                break

        num_of_div_sofar = num_of_div * tmp_num_of_div
        num_of_div = tmp_num_of_div

    print(num * (num - 1) / 2)


if __name__ == '__main__':
    main()
