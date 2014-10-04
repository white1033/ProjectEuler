#!/usr/bin/env python
# encoding: utf-8


def get_name_score(name):
    return sum(ord(e) - ord('A') + 1 for e in name)


def main():
    names_list = []
    result = 0
    with open('names.txt', 'r') as f:
        line = f.readline()
        names_list.extend(line.replace('"', '').split(','))

    for idx, name in enumerate(sorted(names_list), start=1):
        result += get_name_score(name) * idx
    print(result)


if __name__ == '__main__':
    main()
