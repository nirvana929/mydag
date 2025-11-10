import threading
import time
import argparse


def helper_x(n: int) -> int:
    time.sleep(0.01)
    return n * n


def helper_y(n: int) -> int:
    time.sleep(0.005)
    return n + 1


def work_a(iters: int) -> int:
    s = 0
    for i in range(iters):
        s += helper_x(i)
        s += helper_y(i)
    return s


def work_b(iters: int) -> int:
    s = 1
    for i in range(iters):
        s *= (helper_y(i) or 1)
        s += helper_x(i)
    return s


def compute(n: int) -> int:
    a = helper_x(n)
    b = helper_y(n)
    return a - b


def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--loops", type=int, default=3)
    args = parser.parse_args(argv)

    t1 = threading.Thread(target=work_a, args=(args.loops,))
    t2 = threading.Thread(target=work_b, args=(args.loops,))

    t1.start()
    t2.start()

    c = compute(args.loops)
    t1.join()
    t2.join()
    return c


if __name__ == "__main__":
    main()

