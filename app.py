"""Tiny stand-in course project: tally the status codes in web logs."""
import sys
from collections import Counter


def summarize(values):
    """Count how often each value occurs."""
    return dict(Counter(values))


def main(paths):
    statuses = []
    for path in paths:
        with open(path) as f:
            statuses += [line.split()[2] for line in f if line.strip()]
    for status, n in sorted(summarize(statuses).items()):
        print(status, n)


if __name__ == "__main__":
    main(sys.argv[1:] or ["sample.log"])
