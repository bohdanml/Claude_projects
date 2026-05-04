import calendar

print ('Вітаю в кадендарі!\n')

year = int(input('Введіть рік: '))

month = int(input('Введіть номер місяця: '))

print(calendar.month(year,month))