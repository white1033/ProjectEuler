#!/usr/bin/env python
# encoding: utf-8
import datetime


def main():
    count = 0
    for year in range(1901, 2001):
        for month in range(1, 13):
            if datetime.date(year, month, 1).isoweekday() == 7:
                count += 1

    print(count)


if __name__ == '__main__':
    main()
