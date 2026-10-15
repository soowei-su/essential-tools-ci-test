# test_smoke.py -- run with: python3 -m pytest -q
from app import summarize


def test_summarize_counts_rows():
    assert summarize(["a", "b", "b"])["b"] == 2


def test_summarize_empty_is_calm():
    assert summarize([]) == {}
