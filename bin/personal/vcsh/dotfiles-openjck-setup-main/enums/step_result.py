from enum import Enum


class StepResult(Enum):
    DONE = 1
    ALREADY_DONE = 2
    UNSUPPORTED = 3
