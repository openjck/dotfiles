from enum import Enum


class StepResult(Enum):
    DONE = 1
    NOTHING_TO_DO = 2
    ALREADY_DONE = 3
    UNSUPPORTED = 4
