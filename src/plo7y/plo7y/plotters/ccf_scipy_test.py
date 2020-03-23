from unittest import TestCase
import sys

from plo7y._tests import get_test_output_path
# TODO: use generated files instead of these:
from plo7y.generate_test_data import _get_testdata_noisy_sines
from plo7y.generate_test_data import _get_testdata_binary_and_noise


class Test_ccf_scipy(TestCase):
    def test_ccf_scipy_on_noisy_binary(self):
        from plo7y.plotters.ccf_scipy import plot

        y1, y2 = _get_testdata_binary_and_noise()
        plot(
            y1, y2,
            saveFigPath=get_test_output_path(
                __file__, sys._getframe().f_code.co_name
            )
        )

    def test_ccf_scipy_on_phased_sines(self):
        from plo7y.plotters.ccf_scipy import plot

        x, y1, y2 = _get_testdata_noisy_sines()
        plot(
            y1, y2,
            saveFigPath=get_test_output_path(
                __file__, sys._getframe().f_code.co_name
            )
        )