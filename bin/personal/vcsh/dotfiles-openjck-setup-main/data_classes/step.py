from collections.abc import Callable
from dataclasses import dataclass

from enums import StepResult


@dataclass
class Step:
    term: str
    setup_fn: Callable[[], StepResult]
    own_activity_output: bool = False
