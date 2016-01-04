# coding: utf-8
# concreat component
class Human(object):

    def __init__(self, name):
        self.name = name

    # operation
    def dressup(self):
        return self.name


# concreat decorator
class Cloth(object):

    def __init__(self, human):
        self._human = human

    def dressup(self):
        return self._human.dressup() + " +cloth"


class Shoe(object):

    def __init__(self, human):
        self._human = human

    def dressup(self):
        return self._human.dressup() + " +shoe"


# 重ね着可能
human = Cloth(Cloth(Shoe(Human("Bob"))))
print(human.dressup())
