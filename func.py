import re
import threading
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot

class Calculator(QObject):

    def __init__(self):
        QObject.__init__(self)
        self.operands = ('-', '+', '/', '*')

    evaluated = pyqtSignal(str, arguments=['_compute'])

    @pyqtSlot(str)
    def compute(self, stat):
        compute_thread = threading.Thread(target=self._compute, args=[stat])
        compute_thread.daemon = True
        compute_thread.start()

    def _compute(self, problem):
        # calculates and return the answer
        result = self._solve(problem)
        print('result: ', result)

        # if can be converted to an interger
        diff = result - int(result)

        if diff == 0.0:
            final = int(result)
        else:
            final = result

        self.evaluated.emit(str(final))



    def _solve(self, pb):
        # Does the real solving
        if '%' in pb:
            p = self._solve_per(pb)
        else:
            p = pb

        for operator in self.operands:
            if operator in p:
                splits = p.split(operator, 1)
                print(splits)
                # check if it contains some other operator
                left_sp = [i for i in self.operands if i in splits[0]]
                right_sp = [i for i in self.operands if i in splits[1]]

                if operator == '-':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    if not left:
                        left = '0.0'
                    if not right:
                        right = '0.0'

                    sol = float(left) - float(right)
                    return sol

                elif operator == '+':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    if not left:
                        left = '0.0'
                    if not right:
                        right = '0.0'

                    sol = float(left) + float(right)
                    return sol

                if operator == '/':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    if not left:
                        if right:
                            return float(right)
                        else:
                            # might cause problems for multiplication func
                            return 0.0

                    if not right:
                        right = '1.0'

                    sol = float(left) / float(right)
                    return sol

                if operator == '*':
                    if left_sp:
                        left = self._solve(splits[0])
                    else:
                        left = splits[0]

                    if right_sp:
                        right = self._solve(splits[1])
                    else:
                        right = splits[1]

                    if not left:
                        left = '1.0'

                    if not right:
                        right = '1.0'

                    sol = float(left) * float(right)
                    return sol

        else:
            print(p)
            print('contains no operator')
            return float(p)

    def _solve_per(self, prob):
        # calculates the percentage and return a statement with the value
        percent = re.findall('[0-9]+%', prob)
        o_per = [o+per for o in self.operands for per in percent if o+per in prob]
        print('oper:', o_per)
        real_percent = o_per[0][1:-1] # eg 10
        sign = o_per[0][0]
        prob_split = prob.split(o_per[0])
        left_p = prob_split[0]
        right_p = prob_split[1]

        if left_p:
            left_sol = self._solve(left_p)
            print(left_sol)
        else:
            # percentage doens't act on anything
            return '0'

        if right_p:
            pass
        else:
            right_p = ''

        # calculate the percentage on it
        percent_value = float(left_sol) * float(real_percent) / 100

        stat = str(left_sol) + sign + str(percent_value) + right_p

        return stat




